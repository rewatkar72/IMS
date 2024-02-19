using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml.Linq;

namespace WebApplication6
{
    public partial class compose : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["mailID"] != null)
                {
                    int id = int.Parse(Request.QueryString["mailID"]);
                    Maildetail(id);
                }

            }
        }

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True");

        public void Maildetail(int id)
        {
            using (SqlCommand command = new SqlCommand("GetMailDetails", con))
            {

                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@MailID", id);

                con.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    if (Request.QueryString["replyto"] != null)
                    {
                        toEmail.Text = reader["Sender"].ToString();
                        txtmessage.Text =
                       "Sender: " + reader["Sender"].ToString() + "\n" +
                       "Receiver: " + reader["Receiver"].ToString() + "\n" +
                       "CC: " + reader["CC"].ToString() + "\n" +
                       "BCC: " + reader["BCC"].ToString() + "\n" +
                       "Subject: " + reader["Subject"].ToString() + "\n" +
                       "Body: " + reader["Body"].ToString() + "\n" + "\n" +
                       "Reply:-" + "\n";
                    }
                    else if (Request.QueryString["mailID"] != null)
                    {
                        txtmessage.Text = "Sender: " + reader["Sender"].ToString() + "\n" +
                        "Receiver: " + reader["Receiver"].ToString() + "\n" +
                        "CC: " + reader["CC"].ToString() + "\n" +
                        "BCC: " + reader["BCC"].ToString() + "\n" +
                        "Subject: " + reader["Subject"].ToString() + "\n" +
                        "Body: " + reader["Body"].ToString();
                    }
                }

                reader.Close();
                con.Close();
            }
        }


        protected void btnSend_Click(object sender, EventArgs e)
        {
            con.Open();

            int receiverid;
            int ccID;
            int bccID;



            string getreceiverID = "select ID from Registration where Email=@Email";

            string getCCID = "select ID from Registration where Email=@Email";

            string getBCCID = "select ID from Registration where Email=@Email";

            string subject = txtsubject.Text;

            string body = txtmessage.Text;
            using (SqlCommand command = new SqlCommand(getreceiverID, con))
            {
                command.Parameters.AddWithValue("@Email", toEmail.Text);
                object result = command.ExecuteScalar();
                receiverid = result == null ? -1 : Convert.ToInt32(result);
            }

            using (SqlCommand command = new SqlCommand(getCCID, con))
            {
                command.Parameters.AddWithValue("@Email", toCC.Text);
                object result = command.ExecuteScalar();
                ccID = result == null ? -1 : Convert.ToInt32(result);
            }

            using (SqlCommand command = new SqlCommand(getBCCID, con))
            {
                command.Parameters.AddWithValue("@Email", toBCC.Text);
                object result = command.ExecuteScalar();
                bccID = result == null ? -1 : Convert.ToInt32(result);
            }

            using (SqlCommand command = new SqlCommand("insertmail", con))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@SenderID", SqlDbType.NVarChar).Value = "1";
                command.Parameters.Add("@Subject", SqlDbType.NVarChar).Value = subject;
                command.Parameters.Add("@Body", SqlDbType.NVarChar).Value = body;
                command.Parameters.Add("@ReceiverID", SqlDbType.NVarChar).Value = receiverid;
                command.Parameters.Add("@CCRecipients", SqlDbType.NVarChar).Value = ccID;
                command.Parameters.Add("@BCCRecipients", SqlDbType.NVarChar).Value = bccID;
                command.Parameters.Add("@SendTime", SqlDbType.NVarChar).Value = DateTime.Now;
                command.ExecuteNonQuery();
                con.Close();
            }

        }
    }
}
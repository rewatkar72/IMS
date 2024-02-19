using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
namespace WebApplication6
{
    public partial class MailRetrive : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["mailID"] != null)
                {
                    int mailID = int.Parse(Request.QueryString["mailID"]);
                    Maildetail(mailID);
                }
                else
                {
                    Response.Redirect("ErrorPage.aspx");
                }
            }
        }

        private void Maildetail(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMailDetails", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@MailID", id);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    txtfromEmail.Text = reader["Sender"].ToString();
                    txttoEmail.Text = reader["Receiver"].ToString();
                    txttoCC.Text = reader["CC"].ToString();
                    txttoBCC.Text = reader["BCC"].ToString();
                    txtsubject.Text = reader["Subject"].ToString();
                    txtmessage.Text = reader["Body"].ToString();
                }

                reader.Close();
                connection.Close();
            }
        }


        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("inbox.aspx");
        }

        protected void btnReply_Click(object sender, EventArgs e)
        {
            string replyto = txtfromEmail.Text;
            int id = int.Parse(Request.QueryString["mailID"]);
            Response.Redirect("compose.aspx?replyto=" + replyto + "&mailID=" + id);

        }
        protected void btnForward_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["mailID"]);
            Response.Redirect("compose.aspx?mailID=" + id);
        }


    }
}
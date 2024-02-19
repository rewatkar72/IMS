using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class Delete : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            int receiverID = 1;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetDeletedMailsForLoginUser", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ReceiverID", receiverID);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    TableRow row = new TableRow();
                    TableCell mID = new TableCell();
                    mID.Text = reader["ID"].ToString();
                    TableCell senderCell = new TableCell();
                    senderCell.Text = reader["SenderName"].ToString();
                    TableCell subjectCell = new TableCell();
                    subjectCell.Text = reader["Subject"].ToString();
                    TableCell dateCell = new TableCell();
                    dateCell.Text = reader["SendTime"].ToString();
                    TableCell actionCell = new TableCell();
                    Button inboxButton = new Button();
                    inboxButton.Text = "Inbox";
                    inboxButton.Click += InboxButton_Click;
                    inboxButton.CommandArgument = reader["ID"].ToString();
                    actionCell.Controls.Add(inboxButton);
                    Button spambutton = new Button();
                    spambutton.Text = "Spam";
                    spambutton.Click += SpamButton_Click;
                    spambutton.CommandArgument = reader["ID"].ToString();
                    actionCell.Controls.Add(spambutton);
                    Button Viewbutton = new Button();
                    Viewbutton.Text = "View";
                    Viewbutton.Click += ViewButton_Click;
                    Viewbutton.CommandArgument = reader["ID"].ToString();
                    actionCell.Controls.Add(Viewbutton);
                    row.Cells.Add(senderCell);
                    row.Cells.Add(subjectCell);
                    row.Cells.Add(dateCell);
                    row.Cells.Add(actionCell);

                    mailsContainer.Controls.Add(row);
                }
            }
        }

        protected void ViewButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string mailID = btn.CommandArgument;
            Response.Redirect("MailRetrive.aspx?mailID=" + mailID);
        }

        protected void SpamButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True"))
            {
                Button btn = (Button)sender;
                int mailid = int.Parse(btn.CommandArgument);
                
                string query = "UPDATE Mail SET IsDeleted = 0,IsSpam = 1,IsStared=0 WHERE ID = @MailID;";
                SqlCommand command = new SqlCommand(query, connection); 
                command.Parameters.AddWithValue("@MailID", mailid);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void InboxButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True"))
            {
                Button btn = (Button)sender;
                int mailid = int.Parse(btn.CommandArgument);

                string query = "UPDATE Mail SET IsDeleted = 0,IsSpam = 0,IsStared=0 WHERE ID = @MailID;";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MailID", mailid);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}
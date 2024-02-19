using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebApplication6
{
    public partial class inbox : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            int receiverID = Convert.ToInt32(Session["id"]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMailsForLoginUser", connection);
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
                    Button deleteButton = new Button();
                    deleteButton.Text = "Delete";
                    deleteButton.Click += DeleteButton_Click;
                    deleteButton.CommandArgument = reader["ID"].ToString();
                    actionCell.Controls.Add(deleteButton);
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

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            Button Deletebutton = (Button)sender;
            SelectedMailId.Value = Deletebutton.CommandArgument; // Get the CommandArgument value
            int mailId = Convert.ToInt32(SelectedMailId.Value);
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("DeleteMail", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@MailID", mailId);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void SpamButton_Click(object sender, EventArgs e)
        {

            Button spambutton = (Button)sender;
            SelectedMailId.Value = spambutton.CommandArgument; // Get the CommandArgument value
            int mailId = Convert.ToInt32(SelectedMailId.Value);
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SpamMail", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@MailID", mailId);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class admin : System.Web.UI.Page
    {

        string connectionString = "Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            int receiverID = Convert.ToInt32(Session["id"]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EmployeeList", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    TableRow row = new TableRow();
                    TableCell mID = new TableCell();
                    mID.Text = reader["ID"].ToString();
                    TableCell Name = new TableCell();
                    Name.Text = reader["Name"].ToString();
                    TableCell Number = new TableCell();
                    Number.Text = reader["Number"].ToString();
                    TableCell Email = new TableCell();
                    Email.Text = reader["Email"].ToString();
                    TableCell Gender = new TableCell();
                    Gender.Text = reader["Gender"].ToString();
                    TableCell Occupation = new TableCell();
                    Occupation.Text = reader["Occupation"].ToString();
                    TableCell DOB = new TableCell();
                    DOB.Text = reader["DOB"].ToString();
                    TableCell Joining = new TableCell();
                    Joining.Text = reader["Joining"].ToString();
                    TableCell Admin = new TableCell();
                    Admin.Text = reader["Admin"].ToString();
                    TableCell Active = new TableCell();
                    Active.Text = reader["Active"].ToString();
                    TableCell LastLogin = new TableCell();
                    LastLogin.Text = reader["LastLogin"].ToString();
                    TableCell actionCell = new TableCell();
                    Button Viewbutton = new Button();
                    Viewbutton.Text = "View";
                    Viewbutton.Click += ViewButton_Click;
                    Viewbutton.CommandArgument = reader["ID"].ToString();
                    actionCell.Controls.Add(Viewbutton);

                    //< th > EmployeeID </ th >
                    //       < th > Name </ th >
                    //       < th > Number </ th >
                    //        < th > Email </ th >
                    //        < th > Gender </ th >
                    //        < th > Occupation </ th >
                    //        < th > DOB </ th >
                    //        < th > Joining </ th >
                    //        < th > Admin </ th >
                    //        < th > Active </ th >
                    //        < th > LastLogin </ th >

                    row.Cells.Add(mID);
                    row.Cells.Add(Name);
                    row.Cells.Add(Number);
                    row.Cells.Add(Email);
                    row.Cells.Add(Gender);
                    row.Cells.Add(Occupation);
                    row.Cells.Add(DOB);
                    row.Cells.Add(Joining);
                    row.Cells.Add(Admin);
                    row.Cells.Add(Active);
                    row.Cells.Add(LastLogin);
                    row.Cells.Add(actionCell);

                    EmployeeContainer.Controls.Add(row);
                }
            }
        }

        protected void OnClick(object sender, EventArgs e)
        {
            Response.Redirect("registration.aspx");
        }

        protected void ViewButton_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;     

        }
    }
}
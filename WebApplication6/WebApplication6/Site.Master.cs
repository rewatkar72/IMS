using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
   
    public partial class SiteMaster : MasterPage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

            //string newLabelText = "New Label";

            //profileLabel.InnerText = newLabelText;

            //userID.Value = "Some value";

            IsAdminRole();
        }

        public int IsAdminRole()
        {
            int IsAdmin = 0;
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True"))
            {
                int isadmin = Convert.ToInt32(Session["id"]);
                userID.Value = Convert.ToString(Session["id"]);
                string query = "select IsAdmin,Name from Registration where id = @admin";
                SqlCommand command = new SqlCommand(query, connection); // Pass connection to the SqlCommand constructor
                command.Parameters.AddWithValue("@admin", isadmin);
                connection.Open();
                SqlDataReader r = command.ExecuteReader();
                if (r.Read()) // You need to read the result before converting
                {
                    IsAdmin = Convert.ToInt32(r["IsAdmin"]);
                    profileLabel.InnerText = Convert.ToString(r["Name"]);// Access the column value using its name
                }
                connection.Close();
            }

            return IsAdmin;

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void Button2_Click2(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }
    }
}
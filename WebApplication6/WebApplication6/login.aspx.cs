using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True");
        protected void Button1_Click(object sender, EventArgs e)
        {


            string user = username.Text;
            string pass = password.Text;
            using (SqlCommand command = new SqlCommand("Authenticate", con))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Add parameters
                command.Parameters.Add("@login", SqlDbType.NVarChar).Value = user;
                command.Parameters.Add("@Password", SqlDbType.NVarChar).Value = pass;
                try
                {
                    con.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {

                        while (reader.Read())
                        {

                            Session["id"] = reader.GetInt32(0);
                            bool isAdmin = reader.GetBoolean(1);
                            if (isAdmin)
                            {
                                Session["Admin"] = 1;
                            }
                            else
                            {
                                Session["Admin"] = 0;
                            }
                            Response.Redirect("inbox.aspx");
                        }
                        //Session["IsLoggedIn"] = true;
                        //Response.Redirect("inbox.aspx");
                    }
                    else
                    {
                        errorMessage.Text = "Invalid username or password.";
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }
    }
}
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace WebApplication6
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-D0LN8VN\\SQLEXPRESS;Initial Catalog=IntranetMailingSystem;Integrated Security=True");

            string Name = TextBox2.Text;
            string Number = TextBox3.Text;
            string Email = TextBox4.Text;
            string Password = TextBox8.Text;
            string Gender = RadioButtonList1.SelectedValue;
            string Occupation = DropDownList1.SelectedValue;
            string DOB = TextBox5.Text;
            string Joining = TextBox6.Text;
            string IsAdmin = RadioButtonList2.SelectedValue;
            string IsActive = RadioButtonList3.SelectedValue;


            using (SqlCommand command = new SqlCommand("InsertUser", con))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Name;
                command.Parameters.Add("@Number", SqlDbType.NVarChar).Value = Number;
                command.Parameters.Add("@Email", SqlDbType.NVarChar).Value = Email;
                command.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Password;
                command.Parameters.Add("@Gender", SqlDbType.NVarChar).Value = Gender;
                command.Parameters.Add("@Occupation", SqlDbType.NVarChar).Value = Occupation;
                command.Parameters.Add("@DOB", SqlDbType.NVarChar).Value = DOB;
                command.Parameters.Add("@Joining", SqlDbType.NVarChar).Value = Joining;
                command.Parameters.Add("@IsAdmin", SqlDbType.Int).Value = int.Parse(IsAdmin);
                command.Parameters.Add("@IsActive", SqlDbType.Int).Value = int.Parse(IsActive);
                command.Parameters.Add("@LastLogin", SqlDbType.NVarChar).Value = DateTime.Now;


                try
                {
                    con.Open();
                    command.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                }
            }

        }
    }
}
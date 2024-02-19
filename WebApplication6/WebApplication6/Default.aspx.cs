using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-G8K6B77\\SQLEXPRESS;Initial Catalog=Programmingdb;Integrated Security=True;");
        protected void Button1_Click(object sender, EventArgs e)
        {
            
           
        }
        void LoadRecord() {
            //SqlCommand comm; 
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
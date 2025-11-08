using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodMart_Pro.Admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection conn;
        SqlCommand cmd;
        int i;

        void getcon()
        {
            conn = new SqlConnection(s);
            conn.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }
            else
            {
                lblWelcome.Text = "Welcome, " + Session["AdminUser"].ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("adminlogin.aspx");
        }

    }
}
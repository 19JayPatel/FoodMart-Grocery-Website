using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FoodMart_Pro.User
{
    public partial class login : System.Web.UI.Page
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
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text != null && txtPassword.Text != null)
            {
                cmd = new SqlCommand("SELECT COUNT(*) FROM User_tbl WHERE Email='" + txtEmail.Text + "' AND Password='" + txtPassword.Text + "'", conn);

                i = Convert.ToInt32(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["User"] = txtEmail.Text;
                    Response.Redirect("index.aspx");
                }
                else
                {
                    lblMsg.Text = "Invalid Username or Password!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblMsg.Text = "Please enter Username and Password!";
                lblMsg.ForeColor = System.Drawing.Color.DarkRed;
            }
        }
    }
}
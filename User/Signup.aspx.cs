using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodMart_Pro.User
{
    public partial class Signup : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection conn;
        SqlCommand cmd;

        void getcon()
        {
            conn = new SqlConnection(s);
            conn.Open();
        }

        void clear()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtPhone.Text = "";
            txtConfirmPassword.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (btnSignUp.Text == "Sign Up")
            {
                getcon();

                cmd = new SqlCommand(
                    "INSERT INTO User_tbl (FullName, Email, PNumber, Password) VALUES ('" +
                    txtFullName.Text + "','" +
                    txtEmail.Text + "','" +
                    txtPhone.Text + "','" +
                    txtPassword.Text + "')", conn);


                cmd.ExecuteNonQuery();
                clear();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodMart_Pro.User
{
    public partial class About : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection conn;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        void getcon()
        {
            conn = new SqlConnection(s);
            conn.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null && Session["User"].ToString() != "")
            {
                getcon();
                da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE Email = '" + Session["User"].ToString() + "'", conn);
                ds = new DataSet();
                da.Fill(ds);

                int id = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                string s = ds.Tables[0].Rows[0][1].ToString();

                string username = Session["User"].ToString();
                lblAvatar.Text = username.Substring(0, 1).ToUpper();
                lblAvatar.Visible = true;
                btnLogout.Visible = true;
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}
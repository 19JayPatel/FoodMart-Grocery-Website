using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodMart_Pro.Admin
{
    public partial class ManageCustomers : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        void getcon()
        {
            string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            conn = new SqlConnection(s);
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT Id, FullName, Email, PNumber FROM User_tbl ORDER BY Id DESC", conn);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }

            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "cmd_del")
            {
                getcon();
                conn.Open();
                cmd = new SqlCommand("DELETE FROM User_tbl WHERE Id=" + id, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                fillgrid();
            }
        }
    }
}

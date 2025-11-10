using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodMart_Pro.Admin
{
    public partial class ManageOrders : System.Web.UI.Page
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
            da = new SqlDataAdapter("SELECT Order_Id, User_Id, Order_Date, Total_Amount, Order_Status, Payment_Method, Shipping_Address FROM Order_tbl ORDER BY Order_Id DESC", conn);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void fillOrderItems(int orderId)
        {
            getcon();
            da = new SqlDataAdapter("SELECT Product_Name, Product_Price, Product_Quantity, Product_Image FROM OrderItems_tbl WHERE Order_Id='" + orderId + "'", conn);
            ds = new DataSet();
            da.Fill(ds);

            GridView2.DataSource = ds;
            GridView2.DataBind();
            divOrderItems.Visible = true;
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

            if (e.CommandName == "cmd_view")
            {
                fillOrderItems(id); // show 2nd grid for that order
            }
            else if (e.CommandName == "cmd_del")
            {
                getcon();
                conn.Open();

                cmd = new SqlCommand("DELETE FROM Order_tbl WHERE Order_Id='" + id + "'", conn);
                cmd.ExecuteNonQuery();

                conn.Close();
                fillgrid();
                divOrderItems.Visible = false; // hide second grid if deleted
            }
        }
    }
}

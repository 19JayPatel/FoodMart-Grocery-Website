using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodMart_Pro.User
{
    public partial class DisplayProduct : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection conn;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        PagedDataSource pg = new PagedDataSource();
        int p, row;

        void getcon()
        {
            conn = new SqlConnection(s);
            conn.Open();
        }

        void filldatalist()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Products_tbl ORDER BY ProductID DESC", conn);
            ds = new DataSet();
            da.Fill(ds);

            pg = new PagedDataSource();
            pg.DataSource = ds.Tables[0].DefaultView;
            pg.AllowPaging = true;
            pg.PageSize = 8; // show 10 products per page

            // get current page index
            int currentPage = 0;
            if (ViewState["pid"] != null)
                currentPage = Convert.ToInt32(ViewState["pid"]);

            pg.CurrentPageIndex = currentPage;

            // bind to DataList
            dlProducts.DataSource = pg;
            dlProducts.DataBind();

            // enable/disable navigation buttons
            lnkPrev.Visible = !pg.IsFirstPage;
            lnkNext.Visible = !pg.IsLastPage;
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["pid"]);
            currentPage -= 1;
            ViewState["pid"] = currentPage;
            filldatalist();
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["pid"]);
            currentPage += 1;
            ViewState["pid"] = currentPage;
            filldatalist();
        }

        protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ProductDetails.aspx?id=" + id);
            }
            else if (e.CommandName == "cmd_addcart")
            {
                da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE Email ='" + Session["User"] + "'", conn);
                ds = new DataSet();
                da.Fill(ds);

                int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                int prodid = Convert.ToInt32(e.CommandArgument);

                da = new SqlDataAdapter("SELECT * FROM Products_tbl WHERE ProductID = '" + prodid + "'", conn);
                ds = new DataSet();
                da.Fill(ds);

                string prod_name = ds.Tables[0].Rows[0][1].ToString();
                string prod_price = ds.Tables[0].Rows[0][3].ToString();
                string img = ds.Tables[0].Rows[0][7].ToString();

                int quantity = 1;

                cmd = new SqlCommand("INSERT INTO Cart_tbl (User_id, Product_id, Product_name, Product_price, Product_quantity, Product_image) values ('" + userid + "','" + prodid + "', '" + prod_name + "','" + prod_price + "','" + quantity + "','" + img + "')", conn);
                cmd.ExecuteNonQuery();

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["Id"] = 0;
                filldatalist();
            }
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
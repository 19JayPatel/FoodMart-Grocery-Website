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
    public partial class Cart : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_grid();
                total();
            }
        }

        void getcon()
        {
            conn = new SqlConnection(s);
            conn.Open();
        }
        void fill_grid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE Email = '" + Session["User"].ToString() + "'", conn);
            ds = new DataSet();
            da.Fill(ds);

            int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

            da = new SqlDataAdapter("SELECT * FROM Cart_tbl WHERE User_id = '" + uid + "'", conn);
            ds = new DataSet();
            da.Fill(ds);
            GridViewCart.DataSource = ds;
            GridViewCart.DataBind();
        }

        void total()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE Email = '" + Session["User"].ToString() + "'", conn);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                da = new SqlDataAdapter("SELECT *, (Product_price * Product_quantity) as TOTAL FROM Cart_tbl WHERE User_id='" + uid + "'", conn);
                ds = new DataSet();
                da.Fill(ds);

                decimal subtotal = 0;
                decimal delivery = 100;  // fixed delivery charge
                decimal total = 0;

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr["TOTAL"] != DBNull.Value)
                    {
                        subtotal += Convert.ToDecimal(dr["TOTAL"]);
                    }
                }

                total = subtotal + delivery;

                // Display values
                lblSubtotal.Text = "₹" + subtotal.ToString("0.00");
                lblTotal.Text = "₹" + total.ToString("0.00");
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            getcon();

            da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE Email = '" + Session["User"].ToString() + "'", conn);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

                foreach (GridViewRow row in GridViewCart.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow && row.RowIndex < GridViewCart.DataKeys.Count)
                    {
                        int cartId = Convert.ToInt16(GridViewCart.DataKeys[row.RowIndex].Value);

                        TextBox txtqty = (TextBox)row.FindControl("txtQty");

                        int quantity = 1;
                        int.TryParse(txtqty.Text, out quantity);

                        if (quantity < 1) quantity = 1;

                        cmd = new SqlCommand("UPDATE Cart_tbl SET Product_quantity = '" + quantity + "' WHERE User_id='" + uid + "' AND Id='" + cartId + "'", conn);
                        cmd.ExecuteNonQuery();
                    }
                }

                fill_grid();
                total();
            }
        }

        protected void btnremove_Click(object sender, EventArgs e)
        {
            getcon();

            Button btn = (Button)sender;
            int cartId = Convert.ToInt16(btn.CommandArgument);

            da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE Email = '" + Session["User"].ToString() + "'", conn);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

                cmd = new SqlCommand("DELETE FROM Cart_tbl WHERE User_id='" + uid + "' AND Id='" + cartId + "'", conn);
                cmd.ExecuteNonQuery();

                fill_grid();
                total();
            }
        }
    }
}
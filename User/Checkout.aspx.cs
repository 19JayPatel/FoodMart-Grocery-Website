using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Security.Cryptography;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;



namespace FoodMart_Pro.User
{
    public partial class Checkout : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        private ReportDocument cr = new ReportDocument();
        static string Crypath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgrid();
                total();
            }
        }

        void getcon()
        {
            conn = new SqlConnection(s);
            conn.Open();
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE Email = '" + Session["User"].ToString() + "'", conn);
            ds = new DataSet();
            da.Fill(ds);

            int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

            da = new SqlDataAdapter("SELECT * FROM Cart_tbl WHERE User_id = '" + uid + "'", conn);
            ds = new DataSet();
            da.Fill(ds);
            GridViewCheckout.DataSource = ds;
            GridViewCheckout.DataBind();
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

                decimal subtotal = 0, delivery = 100, total = 0;

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr["TOTAL"] != DBNull.Value)
                        subtotal += Convert.ToDecimal(dr["TOTAL"]);
                }

                total = subtotal + delivery;

                lblSubtotal.Text = "₹" + subtotal.ToString("0.00");
                lblTotal.Text = "₹" + total.ToString("0.00");
            }
        }

        void generateCrystalReport(int orderId)
        {
            getcon();

            // 1️. Fetch order details
            da = new SqlDataAdapter("SELECT * FROM Order_tbl WHERE Order_Id='" + orderId + "'", conn);
            ds = new DataSet();
            da.Fill(ds, "Order_tbl");

            // 2️. Fetch order items
            da = new SqlDataAdapter("SELECT * FROM OrderItems_tbl WHERE Order_Id='" + orderId + "'", conn);
            da.Fill(ds, "OrderItems_tbl");

            // 3️. Load report
            Crypath = Server.MapPath("~/Reports/OrderReport.rpt");
            cr.Load(Crypath);
            cr.SetDataSource(ds);

            // 4️. Export directly to PDF and send to browser
            Response.ClearContent();
            Response.ClearHeaders();
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Order_" + orderId + "_Bill");

            cr.Close();
            cr.Dispose();
        }


        protected void GridViewCheckout_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_remove")
            {
                getcon();
                int cartId = Convert.ToInt16(e.CommandArgument);

                da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE Email='" + Session["User"].ToString() + "'", conn);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    int uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                    cmd = new SqlCommand("DELETE FROM Cart_tbl WHERE User_id='" + uid + "' AND Id='" + cartId + "'", conn);
                    cmd.ExecuteNonQuery();
                    fillgrid();
                    total();
                }
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            getcon();

            // 1. Get user id
            da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE Email='" + Session["User"].ToString() + "'", conn);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("<script>alert('User not found. Please log in again.');</script>");
                return;
            }

            int userId = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

            // 2. Get cart items
            da = new SqlDataAdapter("SELECT *, (Product_price * Product_quantity) as TOTAL FROM Cart_tbl WHERE User_id='" + userId + "'", conn);
            ds = new DataSet();
            da.Fill(ds);

            DataTable cartItems = ds.Tables[0];

            if (cartItems.Rows.Count == 0)
            {
                Response.Write("<script>alert('Your cart is empty.');</script>");
                return;
            }

            // 3. Calculate total
            decimal subtotal = 0, delivery = 100, totalAmount = 0;
            foreach (DataRow dr in cartItems.Rows)
            {
                if (dr["TOTAL"] != DBNull.Value)
                    subtotal += Convert.ToDecimal(dr["TOTAL"]);
            }
            totalAmount = subtotal + delivery;

            // 4. Shipping + payment
            string shippingAddress = txtAddress.Text.Trim();
            string paymentMethod = rblPayment.SelectedValue;

            if (string.IsNullOrEmpty(shippingAddress))
            {
                Response.Write("<script>alert('Please enter a shipping address.');</script>");
                return;
            }

            // 5. Insert into Order_tbl and get new Order_Id
            cmd = new SqlCommand("INSERT INTO Order_tbl (User_Id, Order_Date, Total_Amount, Order_Status, Shipping_Address, Payment_Method) " +
                                 "VALUES ('" + userId + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "','" + totalAmount + "','Pending','" + shippingAddress + "','" + paymentMethod + "'); " +
                                 "SELECT SCOPE_IDENTITY();", conn);

            int orderId = Convert.ToInt32(cmd.ExecuteScalar());

            // 6. Insert all cart products directly into OrderItems_tbl (no variables)
            foreach (DataRow dr in cartItems.Rows)
            {
                cmd = new SqlCommand("INSERT INTO OrderItems_tbl (Order_Id, Product_Name, Product_Price, Product_Quantity, Product_Image) " +
                                     "VALUES ('" + orderId + "','" + dr["Product_name"] + "','" + dr["Product_price"] + "','" + dr["Product_quantity"] + "','" + dr["Product_image"] + "')", conn);
                cmd.ExecuteNonQuery();
            }

            // 8️. Generate Crystal Report
            generateCrystalReport(orderId);

            Response.Write("<script>alert('Order placed successfully! Generating bill...');</script>");

            // 7. Clear cart
            cmd = new SqlCommand("DELETE FROM Cart_tbl WHERE User_id='" + userId + "'", conn);
            cmd.ExecuteNonQuery();

            fillgrid();
            total();

            Response.Write("<script>alert('Order placed successfully!');</script>");
        }

    }
}
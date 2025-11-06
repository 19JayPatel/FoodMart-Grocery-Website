using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FoodMart_Pro.Admin
{
    public partial class ManageProduct : System.Web.UI.Page
    {
        SqlConnection conn; //Connection
        SqlDataAdapter da; //Container
        DataSet ds;        //Run time container
        SqlCommand cmd;    //Insert,Update,Delete perform 
        String fnm;

        void getcon()
        {
            string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            conn = new SqlConnection(s);
        }

        void fillcategory()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Categories", conn);
            ds = new DataSet();
            da.Fill(ds);

            ddlCategory.Items.Clear();
            ddlCategory.Items.Add("--Select Product Categories--");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlCategory.Items.Add(new ListItem(
                    ds.Tables[0].Rows[i]["CategoryName"].ToString(),
                    ds.Tables[0].Rows[i]["CategoryID"].ToString()
                ));
            }
        }

        void clear()
        {
            txtProductName.Text = "";
            txtWeight.Text = "";
            txtPrice.Text = "";
            txtAboutProduct.Text = "";
            ddlCategory.SelectedIndex = 0;
        }

        void imgupload()
        {
            if (fileUploadImage.HasFile)
            {
                fnm = "../PUImages/" + fileUploadImage.FileName;
                fileUploadImage.SaveAs(Server.MapPath(fnm));
            }
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Products_tbl", conn);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void select()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Products_tbl WHERE ProductID='" + ViewState["id"] + "'", conn);
            ds = new DataSet();
            da.Fill(ds);

            txtProductName.Text = ds.Tables[0].Rows[0][1].ToString();
            txtWeight.Text = ds.Tables[0].Rows[0][2].ToString();
            txtPrice.Text = ds.Tables[0].Rows[0][3].ToString();
            txtAboutProduct.Text = ds.Tables[0].Rows[0][4].ToString();
            ddlCategory.SelectedValue = ds.Tables[0].Rows[0][5].ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fillgrid();

            if (Session["User"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }

            if (!IsPostBack)
            {
                fillcategory();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();

            if (ddlCategory.SelectedIndex == 0)
            {
                lblMsg.Text = "Please select a company!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (btnAddProduct.Text == "Add Product")
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Products_tbl(ProductName, Weight, Price, About, CategoryID, CategoryName, ProductImage) " + "VALUES('" + txtProductName.Text + "', '" + txtWeight.Text + "', '" + txtPrice.Text + "', '" + txtAboutProduct.Text + "', '" + ddlCategory.SelectedValue + "', '" + ddlCategory.SelectedItem.Text + "', '" + fnm + "')", conn);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblMsg.Text = "Product Added Successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                clear();
                fillgrid();
            }
            else
            {
                getcon();
                conn.Open();

                SqlCommand cmd = new SqlCommand("UPDATE Products_tbl SET ProductName='" + txtProductName.Text + "', Weight='" + txtWeight.Text + "', Price='" + txtPrice.Text + "', About='" + txtAboutProduct.Text + "' WHERE ProductID='" + ViewState["id"] + "'", conn);

                cmd.ExecuteNonQuery();
                conn.Close();

                lblMsg.Text = "Product Updated Successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;

                fillgrid();
                clear();
                btnAddProduct.Text = "Add Product";
            }



        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            getcon();
            conn.Open();

            cmd = new SqlCommand("INSERT INTO Categories(CategoryName) VALUES ('" + txtCategoryName.Text + "')", conn);
            cmd.ExecuteNonQuery();
            txtCategoryName.Text = "";
            fillcategory();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "cmd_edit")
            {
                ViewState["id"] = id;
                btnAddProduct.Text = "Update";
                select();
            }
            else if (e.CommandName == "cmd_del")
            {
                getcon();
                conn.Open();
                cmd = new SqlCommand("DELETE FROM Products_tbl WHERE ProductID='" + id + "'", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                fillgrid();
            }
        }


    }
}
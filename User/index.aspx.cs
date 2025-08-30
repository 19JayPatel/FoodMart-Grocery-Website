using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodMart_Pro.User
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    if (Session["User"] != null)
                    {
                        string username = Session["User"].ToString();
                        lblAvatar.Text = username.Substring(0, 1).ToUpper();
                        lblAvatar.Visible = true;
                        btnLogout.Visible = true;
                    }
                    else
                    {
                        // User not logged in → hide avatar + logout
                        lblAvatar.Visible = false;
                        btnLogout.Visible = false;
                    }
                }
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
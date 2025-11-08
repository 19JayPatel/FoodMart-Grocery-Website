using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
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

        // ---------------- SMTP Send Function ----------------
        private void SendEmail(string to, string subject, string body)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(to);
            mail.From = new MailAddress("foodmartfoodmart53@gmail.com");
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;

            // Configure SMTP
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true; // Use SSL
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential("foodmartfoodmart53@gmail.com", "hiyq zkrt oktx cffd\r\n");

            smtp.Send(mail);
        }


        // ---------------- Newsletter Submission ----------------
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (chkSubscribe.Checked)
            {
                string name = txtName.Text.Trim();
                string email = txtEmail.Text.Trim();

                string subject = "New Newsletter Subscription";
                string body = $@"
                <h3>New Newsletter Subscriber</h3>
                <p><strong>Name:</strong> {name}</p>
                <p><strong>Email:</strong> {email}</p>
                <p>They have subscribed to receive updates.</p>
            ";

                // Send to admin
                SendEmail("jsidapara.js@gmail.com", subject, body);

                // Send thank-you email to subscriber
                string thankYouBody = $@"
                <h3>Thank You for Subscribing!</h3>
                <p>Hi {name},</p>
                <p>Welcome to our newsletter! You’ll now receive the latest updates, discounts, and offers.</p>
                <p>Stay tuned!</p>
            ";
                SendEmail(email, "Welcome to Our Newsletter", thankYouBody);

                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
                    "alert('Thank you for subscribing! A confirmation email has been sent.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
                    "alert('Please check the Subscribe box before submitting.');", true);
            }
        }

    }
}
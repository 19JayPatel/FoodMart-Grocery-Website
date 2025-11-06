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
    public partial class Contact : System.Web.UI.Page
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

        // ---------------- Contact Form Submission ----------------
        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            string subject = "New Contact Form Message";
            string body = $@"
            <h3>New Contact Form Submission</h3>
            <p><strong>Name:</strong> {name}</p>
            <p><strong>Email:</strong> {email}</p>
            <p><strong>Message:</strong><br>{message}</p>
        ";

            // Send to admin
            SendEmail("jsidapara.js@gmail.com", subject, body);

            // Auto-reply to user
            string autoReply = $@"
            <h3>Thank You for Contacting Us!</h3>
            <p>Dear {name},</p>
            <p>We’ve received your message and will get back to you soon.</p>
            <p>Best Regards,<br>Foodmart Team</p>
        ";
            SendEmail(email, "We Received Your Message", autoReply);

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
                "alert('Your message has been sent successfully!');", true);
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

            SmtpClient smtp = new SmtpClient();
            smtp.Send(mail);
        }

    }
}
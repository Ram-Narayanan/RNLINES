using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace RN_LINE
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] == null)
            {
                LinkButton7.Visible = false;
                LinkButton5.Visible = false;
                LinkButton6.Visible = false;
            }
            else
            {
                // Access user details from session
                string username = Session["Username"].ToString();
                LinkButton7.Text = "Hello " + username;
                LinkButton7.Visible = true;
                LinkButton5.Visible = true;
                LinkButton6.Visible = true;
                Button1.Visible = false;
                Button2.Visible = false;
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }


        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SchedulePage.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuotePage.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookingPage.aspx");
        }

      

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserprofilePage.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Session["Userid"] = null;
            Session["Username"] = null;

            Session.Abandon();

            Response.Redirect("Homepage.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegistration.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactusPage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }
    }
}
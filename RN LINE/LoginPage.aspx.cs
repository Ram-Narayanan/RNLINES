using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RN_LINE
{
    public partial class LoginPage : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-3KH2IDF;Initial Catalog=Rnlines;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add code here if needed to handle any pre-load functionality
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check if inputs are not empty
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblErrorMessage.Text = "Please enter both email and password.";
                lblErrorMessage.Visible = true;
                return;
            }

            // Query to check user credentials
            string query = "SELECT Userid, Username, Password FROM userprofile WHERE Emailid = @Email AND Password = @Password";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // Normally, you would use a hashed password comparison here

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();

                        // Store Userid and Username in Session
                        Session["Userid"] = reader["Userid"];
                        Session["Username"] = reader["Username"];

                        // Redirect to another page (HomePage.aspx or any other page after login)
                        Response.Redirect("HomePage.aspx");
                    }
                    else
                    {
                        lblErrorMessage.Text = "Invalid email or password.";
                        lblErrorMessage.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "An error occurred: " + ex.Message;
                    lblErrorMessage.Visible = true;
                }
            }
        }
    }
}
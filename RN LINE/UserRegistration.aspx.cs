using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace RN_LINE
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        // Connection string for database
        string con = ConfigurationManager.ConnectionStrings["rnl"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            // Any page load logic if needed
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Ensure password and confirm password match before proceeding with registration
            if (Page.IsValid)
            {
                if (TextBox8.Text == TextBox9.Text)
                {
                    Signup();

                    Response.Redirect("HomePage.aspx");
                    
                }
                else
                {
                    // Password mismatch
                    Response.Write(@"<script>alert('Passwords do not match. Please try again.');</script>");
                }
            }
            else
            {
                // Validation failed
                Response.Write(@"<script>alert('Please correct the errors and try again.');</script>");
            }
        }

        private void Signup()
        {
            try
            {
                using (SqlConnection db = new SqlConnection(con))
                {
                    // Open connection
                    db.Open();

                    if (db.State != ConnectionState.Open)
                    {
                        Response.Write("<script>alert ('Db is not open , try again')</script>");
                        return;
                    }

                    else 
                    {
                        Response.Write("<script>alert ('Db is  open ')</script>");
                    }

                    // SQL Query for inserting user data
                    string insertQuery = @"INSERT INTO userprofile (Username, Dateofbirth, Contact, Emailid, State, City, Pincode, Address, Password)
                                           VALUES(@username, @dob, @mobile, @email, @state, @city, @pincode, @address, @password);";

                    SqlCommand cmd = new SqlCommand(insertQuery, db);
                    cmd.Parameters.AddWithValue("@username", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@mobile", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", TextBox8.Text.Trim()); // Add password hashing here if needed

                    // Execute the insert command
                    int rowsAffected = cmd.ExecuteNonQuery();

                    // Check if insertion was successful
                    if (rowsAffected > 0)
                    {
                        Response.Write(@"<script>alert('Signup successful!');</script>");
                    }
                    else
                    {
                        Response.Write(@"<script>alert('Signup failed. Please try again.');</script>");
                    }

                    // Close the database connection
                    db.Close();
                }
            }
            catch (SqlException sqlEx)
            {
                // Handle SQL exceptions
                Response.Write(@"<script>alert('SQL Error: " + sqlEx.Message + "');</script>");
            }
            catch (Exception ex)
            {
                // Handle general exceptions
                Response.Write(@"<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}

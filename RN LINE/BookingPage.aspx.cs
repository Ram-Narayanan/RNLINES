using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RN_LINE
{
    public partial class BookingPage : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-3KH2IDF;Initial Catalog=Rnlines;Integrated Security=True;TrustServerCertificate=True";  // Update with your actual connection string
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] == null)
            { Response.Redirect("LoginPage.aspx"); }
            else
            {
                if (!IsPostBack && Session["SelectedRoute"] != null)
                {
                    var selectedRoute = (dynamic)Session["SelectedRoute"];

                    // Use the session data to populate initial vessel and port details
                    lblLoadingPort.Text = selectedRoute.PortName;
                    lblETA.Text = selectedRoute.ETA;
                    lblETD.Text = selectedRoute.ETD;
                    lblVesselName.Text = selectedRoute.VesselName;
                    lblVoyage.Text = selectedRoute.Voyage;
                }
            }
        }

        protected void destinationPortSearch_TextChanged(object sender, EventArgs e)
        {
            string portSearch = destinationPortSearch.Text.Trim();
            if (!string.IsNullOrEmpty(portSearch) && !string.IsNullOrEmpty(lblVesselName.Text))
            {
                UpdatePortDetails(portSearch);
                ListBox1.Visible = true;
            }


        }

        protected void PortSelected_indexchanged(object sender, EventArgs e)
        {
            destinationPortSearch.Text = ListBox1.SelectedItem.Text;
            ListBox1.Visible = false;
        }

        private void UpdatePortDetails(string portSearch)
        {


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT PortName, ETA, ETD
                    FROM Route
                    WHERE VesselName = @Vessel AND PortName LIKE @PortSearch";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Vessel", lblVesselName.Text);
                cmd.Parameters.AddWithValue("@PortSearch", "%" + portSearch + "%");

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Clear the ListBox before adding new items
                    ListBox1.Items.Clear();

                    // Check if data exists and populate fields
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            ListBox1.Items.Add(reader["PortName"].ToString());

                            // Update ETA and ETD based on the first match (if multiple matches, you can choose how to handle this)
                            TextBox10.Text = reader["ETA"].ToString();
                            TextBox12.Text = reader["ETD"].ToString();
                        }
                    }
                    else
                    {
                        // If no results are found
                        ListBox1.Items.Add("No matching ports found.");
                        TextBox10.Text = "";
                        TextBox12.Text = "";
                    }


                }
                catch (Exception ex)
                {
                    // Handle potential errors (e.g., database connection issues)
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection db = new SqlConnection(connectionString))
                {
                    string Cargotype = "";
                    if (RadioButton1.Checked)
                    {
                        Cargotype = RadioButton1.Text;
                    }
                    else
                    {
                        Cargotype = RadioButton2.Text;
                    }


                    SqlCommand cmd = new SqlCommand("insertbooking", db);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ShipperName", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@S_Address", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@S_EmailID", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@S_Contact", TextBox13.Text.Trim());
                    cmd.Parameters.AddWithValue("@ConsigneeName", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@C_Address", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@C_EmailID", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@C_Contact", TextBox14.Text.Trim());
                    cmd.Parameters.AddWithValue("@VesselName", lblVesselName.Text.Trim());
                    cmd.Parameters.AddWithValue("@VesselVoyage", lblVoyage.Text.Trim());
                    cmd.Parameters.AddWithValue("@POL", lblLoadingPort.Text.Trim());
                    cmd.Parameters.AddWithValue("@POLETA", lblETA.Text.Trim());
                    cmd.Parameters.AddWithValue("@POLETD", lblETD.Text.Trim());
                    cmd.Parameters.AddWithValue("@POD", destinationPortSearch.Text.Trim());
                    cmd.Parameters.AddWithValue("@PODETA", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@PODETD", TextBox12.Text.Trim());
                    cmd.Parameters.AddWithValue("@Container", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@CargoType", Cargotype);
                    cmd.Parameters.AddWithValue("@Commodity", TextBox17.Text.Trim());
                    cmd.Parameters.AddWithValue("@CargoWeight", TextBox18.Text.Trim());


                    db.Open();

                    int m = cmd.ExecuteNonQuery();

                    db.Close();

                    if (m > 0)
                    {
                        Response.Write("<script>alert('Booking placed successfully')</script>");
                    }

                    else
                    {
                        Response.Write("<script>alert('Booking  unsuccessful, Try again')</script>");
                    }
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

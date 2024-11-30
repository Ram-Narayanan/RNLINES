using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RN_LINE
{
    public partial class QuotePage : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-3KH2IDF;Initial Catalog=Rnlines;Integrated Security=True;TrustServerCertificate=True";  // Update with your actual connection string

        protected void Page_Load(object sender, EventArgs e)
        {
            
           
                if (!IsPostBack)
                {

                if (Session["Userid"] == null)
                { Response.Redirect("LoginPage.aspx"); }
                
                }
            }

           

        // Button click event handler
        protected void searchButton_Click(object sender, EventArgs e)
        {
                using (SqlConnection db = new SqlConnection(connectionString))
                {
                    // Capture the selected values from the dropdowns
                    string LoadingPort = loadingPort.SelectedItem.Text;
                    string DestinationPort = destinationPort.SelectedItem.Text;
                    string EquipmentSize = Equipment.SelectedItem.Value;

                    // Define the SQL query with parameters
                    string query = @"
        SELECT 
            PriceID,
            PortofLoading,
            PortofDicharge,
            CASE 
                WHEN @EquipmentSize = '20SD' THEN SD_20
                WHEN @EquipmentSize = '40SD' THEN SD_40
                WHEN @EquipmentSize = '40HQ' THEN HQ_40
                ELSE NULL
            END AS SelectedContainerPrice,
            LoadingPortID,
            DischargePortID
        FROM 
            Price
        WHERE
            PortofLoading = @LoadingPort AND 
            PortofDicharge = @DestinationPort AND 
            (
                (@EquipmentSize = '20SD' AND SD_20 IS NOT NULL) OR
                (@EquipmentSize = '40SD' AND SD_40 IS NOT NULL) OR
                (@EquipmentSize = '40HQ' AND HQ_40 IS NOT NULL)
            );";
                    db.Open();
                    // Set up the parameters
                    SqlCommand cmd = new SqlCommand(query, db);
                    cmd.Parameters.AddWithValue("@LoadingPort", LoadingPort);
                    cmd.Parameters.AddWithValue("@DestinationPort", DestinationPort);
                    cmd.Parameters.AddWithValue("@EquipmentSize", EquipmentSize);

                    // Execute the query and retrieve the result
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            // Assuming you want to display the price in a label
                            Price.Text = reader["SelectedContainerPrice"].ToString() + "USD";
                        }
                    }
                    else
                    {
                        Price.Text = "No price available for the selected combination.";
                    }
                    db.Close();
                  
                }

           
            }




    }
    
}
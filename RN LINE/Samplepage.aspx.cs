using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace RN_LINE
{
    public partial class Samplepage : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-3KH2IDF;Initial Catalog=Rnlines;Integrated Security=True;TrustServerCertificate=True";  // Update with your actual connection string

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        // Function to load ports from the database into the dropdown lists
        private void LoadPorts()
        {


            // Load Loading Ports
            string query = "SELECT DISTINCT PortofLoading FROM Price";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    loadingPort.DataSource = dt;
                    loadingPort.DataTextField = "PortofLoading";
                    loadingPort.DataValueField = "PortofLoading";
                    loadingPort.DataBind();
                    loadingPort.Items.Insert(0, new ListItem("Select Loading Port", ""));
                }
                else
                {
                    Console.WriteLine("No data found for Loading Ports");
                }
            }

            // Load Destination Ports
            query = "SELECT DISTINCT PortofDicharge FROM Price";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    destinationPort.DataSource = dt;
                    destinationPort.DataTextField = "PortofDicharge";
                    destinationPort.DataValueField = "PortofDicharge";
                    destinationPort.DataBind();
                    destinationPort.Items.Insert(0, new ListItem("Select Destination Port", ""));
                }
                else
                {
                    Console.WriteLine("No data found for Destination Ports");
                }
            }

        }

        // Button click event handler
        protected void SearchButton_Click(object sender, EventArgs e)
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
                        Price.Text = reader["SelectedContainerPrice"].ToString() +"USD";
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

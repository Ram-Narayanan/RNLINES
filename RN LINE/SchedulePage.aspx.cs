using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RN_LINE
{
    public partial class SchedulePage : Page
    {
        string connectionString = "Data Source=DESKTOP-3KH2IDF;Initial Catalog=Rnlines;Integrated Security=True;TrustServerCertificate=True";  // Update with your actual connection string

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial load (optional) - load all ports or something else if needed
            }
        }

        // Method to handle Loading Port search
        protected void loadingPortSearch_TextChanged(object sender, EventArgs e)
        {
            string searchTerm = loadingPortSearch.Text;
            LoadPortSuggestions(searchTerm, "loading");
        }

        // Method to handle Destination Port search
        protected void destinationPortSearch_TextChanged(object sender, EventArgs e)
        {
            string searchTerm = destinationPortSearch.Text;
            LoadPortSuggestions(searchTerm, "destination");
        }

        // General method to load port suggestions based on search term
        private void LoadPortSuggestions(string searchTerm, string portType)
        {
            string query = "SELECT PortId, PortName FROM Ports WHERE PortName LIKE @SearchTerm";  // SQL query for searching port names

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // Clear existing suggestions
                if (portType == "loading")
                {
                    loadingPortSuggestions.Items.Clear();
                }
                else
                {
                    destinationPortSuggestions.Items.Clear();
                }

                // Add matching ports to the ListBox (suggestions list)
                while (reader.Read())
                {
                    string portName = reader["PortName"].ToString();
                    ListItem listItem = new ListItem(portName, reader["PortId"].ToString());

                    if (portType == "loading")
                    {
                        loadingPortSuggestions.Items.Add(listItem);
                    }
                    else
                    {
                        destinationPortSuggestions.Items.Add(listItem);
                    }
                }

                // Show the ListBox if there are suggestions, otherwise hide it
                if (portType == "loading" && loadingPortSuggestions.Items.Count > 0)
                {
                    loadingPortSuggestions.Visible = true;
                }
                else if (portType == "destination" && destinationPortSuggestions.Items.Count > 0)
                {
                    destinationPortSuggestions.Visible = true;
                }
                else
                {
                    if (portType == "loading")
                    {
                        loadingPortSuggestions.Visible = false;
                    }
                    else
                    {
                        destinationPortSuggestions.Visible = false;
                    }
                }

                reader.Close();
            }
        }

        // Handle user selection from loading port suggestions
        protected void loadingPortSuggestions_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Set the selected port name to the TextBox
            loadingPortSearch.Text = loadingPortSuggestions.SelectedItem.Text;

            // Hide the suggestions ListBox
            loadingPortSuggestions.Visible = false;
        }

        // Handle user selection from destination port suggestions
        protected void destinationPortSuggestions_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Set the selected port name to the TextBox
            destinationPortSearch.Text = destinationPortSuggestions.SelectedItem.Text;

            // Hide the suggestions ListBox
            destinationPortSuggestions.Visible = false;
        }

        // Handle search button click to filter routes based on search criteria
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string loadingPort = loadingPortSearch.Text.Trim();
            string destinationPort = destinationPortSearch.Text.Trim();
            string departureDate = departureDatetxt.Text;

            // Query to filter routes based on search criteria
            string query = @"
                SELECT  r.PortName AS PortName, r.ETA, r.ETD, r.VesselName, r.Voyage 
                FROM Route r JOIN Ports d ON r.PortID = d.PortID
                WHERE r.PortName LIKE @LoadingPort or d.PortName LIKE @DestinationPort AND ETD >= @DepartureDate";

            DataTable dtRoutes = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@LoadingPort", "%" + loadingPort + "%");
                cmd.Parameters.AddWithValue("@DestinationPort", "%" + destinationPort + "%");
                cmd.Parameters.AddWithValue("@DepartureDate", departureDate);
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dtRoutes);
            }

            // Bind the routes to the GridView
            gvRoutes.DataSource = dtRoutes;
            gvRoutes.DataBind();
        }

        // Handle Book button click
        protected void gvRoutes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["Userid"] == null)
            { Response.Redirect("LoginPage.aspx"); }
            else 
            { 
                if (e.CommandName == "SelectRow")
            {
                // Get the row index from CommandArgument
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that was clicked
                GridViewRow row = gvRoutes.Rows[index];

                // Extract the details from the row (PortName, ETA, ETD, VesselName, Voyage)
                string portName = row.Cells[0].Text;   // Assuming PortName is in the first column
                string eta = row.Cells[1].Text;        // ETA in second column
                string etd = row.Cells[2].Text;        // ETD in third column
                string vesselName = row.Cells[3].Text; // VesselName in fourth column
                string voyage = row.Cells[4].Text;     // Voyage in fifth column

                // Create a session object to hold the selected row's data
                Session["SelectedRoute"] = new
                {
                    PortName = portName,
                    ETA = eta,
                    ETD = etd,
                    VesselName = vesselName,
                    Voyage = voyage
                };

                // Optionally, you can redirect to another page or refresh the GridView
                Response.Redirect("BookingPage.aspx");
            }
            }
        }

    }
}

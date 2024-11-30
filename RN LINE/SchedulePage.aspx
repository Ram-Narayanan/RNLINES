<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SchedulePage.aspx.cs" Inherits="RN_LINE.SchedulePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2>Liner Shipping Vessel Schedule</h2>

        <!-- Loading Port Search Section -->
        <div class="form-group">
            <asp:Label ID="Label1" for="loadingPort" runat="server" Text="Loading Port"></asp:Label>
            <!-- Search TextBox for Loading Port -->
            <asp:TextBox ID="loadingPortSearch" CssClass="form-control" runat="server"
                AutoPostBack="true" OnTextChanged="loadingPortSearch_TextChanged"
                placeholder="Search Loading Port..."></asp:TextBox>

            <!-- ListBox to display Loading Port Suggestions -->
            <asp:ListBox ID="loadingPortSuggestions" CssClass="form-control" runat="server" Visible="false"
                AutoPostBack="true" OnSelectedIndexChanged="loadingPortSuggestions_SelectedIndexChanged"></asp:ListBox>
        </div>

        <!-- Destination Port Search Section -->
        <div class="form-group">
            <asp:Label ID="Label2" for="destinationPort" runat="server" Text="Destination Port:"></asp:Label>
            <!-- Search TextBox for Destination Port -->
            <asp:TextBox ID="destinationPortSearch" CssClass="form-control" runat="server"
                AutoPostBack="true" OnTextChanged="destinationPortSearch_TextChanged"
                placeholder="Search Destination Port..."></asp:TextBox>

            <!-- ListBox to display Destination Port Suggestions -->
            <asp:ListBox ID="destinationPortSuggestions" CssClass="form-control" runat="server" Visible="false"
                AutoPostBack="true" OnSelectedIndexChanged="destinationPortSuggestions_SelectedIndexChanged"></asp:ListBox>
        </div>
        <div class="row">
            <div class="col-md-4">
                        <div class="form-group">
            <asp:Label ID="Label3" for="departureDate" runat="server" Text="Date of Departure"></asp:Label>

            <!-- HTML input field -->
            <input type="date" id="departureDate" class="form-control" />

            <!-- ASP.NET TextBox to store the selected date -->
            <asp:TextBox ID="departureDatetxt" runat="server" CssClass="form-control" Style ="display:none" />

            <script>
                // Add an event listener to capture changes on the date input field
                document.getElementById("departureDate").addEventListener("change", function () {
                    // Set the value of the ASP.NET TextBox when the date changes
                    document.getElementById("<%= departureDatetxt.ClientID %>").value = this.value;
                });
</script>

        </div>

            </div>
        </div>
       

        <asp:Button ID="btnSearch" Text="Search" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Click" />

        <!-- Display Route Data in GridView -->
     <asp:GridView ID="gvRoutes" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" OnRowCommand="gvRoutes_RowCommand">
    <Columns>
        <asp:BoundField DataField="PortName" HeaderText="Port of Loading" SortExpression="PortName" />
        <asp:BoundField DataField="ETA" HeaderText="ETA" SortExpression="ETA" />
        <asp:BoundField DataField="ETD" HeaderText="ETD" SortExpression="ETD" />
        <asp:BoundField DataField="VesselName" HeaderText="Vessel" SortExpression="VesselName" />
        <asp:BoundField DataField="Voyage" HeaderText="Voyage" SortExpression="Voyage" />

       
        <asp:TemplateField>
            <ItemTemplate>
                <!-- LinkButton that will trigger the RowCommand event -->
                <asp:LinkButton ID="btnSelect" runat="server" Text="Select" CommandName="SelectRow" CommandArgument='<%# Container.DataItemIndex %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
         </asp:GridView>
    </div>
</asp:Content>


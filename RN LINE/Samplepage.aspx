<%@ Page Title="" Language="C#" MasterPageFile="~/Sample.Master" AutoEventWireup="true" CodeBehind="Samplepage.aspx.cs" Inherits="RN_LINE.Samplepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="card">
            <div class="row">
                <div class="col"></div>
                <h2 style="display: flex; justify-content: center;">Instant Quotes</h2>
            </div>
            <div class="row justify-content-around mb-4">
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="loadingPort">Loading Port:</label>
                        <asp:DropDownList ID="loadingPort" runat="server" CssClass="form-control" Style="margin-bottom: 10px;">
                            <asp:ListItem Text="Select Loading Port" Value="" Enabled="False" />
                            <asp:ListItem>Port of Chennai</asp:ListItem>
                            <asp:ListItem>Port of Cochin</asp:ListItem>
                            <asp:ListItem>Port of Colombo</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-md-5">
                    <div class="form-group">
                        <label for="destinationPort">Destination Port:</label>
                        <asp:DropDownList ID="destinationPort" runat="server" CssClass="form-control" Style="margin-bottom: 10px;">
                            <asp:ListItem Text="Select Destination Port" Value="" Enabled="False" />

                            <asp:ListItem>Port of Cochin</asp:ListItem>
                            <asp:ListItem>Port of Colombo</asp:ListItem>
                            <asp:ListItem>Port of Jebel Ali</asp:ListItem>

                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="row justify-content-around mb-4">
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="Equipment">Equipment Size:</label>
                        <asp:DropDownList ID="Equipment" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Equipment Size" Value="" />
                            <asp:ListItem Text="20ft SD" Value="20SD" />
                            <asp:ListItem Text="40ft SD" Value="40SD" />
                            <asp:ListItem Text="40ft HQ" Value="40HQ" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-5">
                    <h1>
                        <label id="PriceLabel" class="form-label">Price:</label>
                        <asp:Label ID="Price" runat="server" CssClass="form-control" /></h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-7 ms-auto">
                    <asp:Button ID="searchButton" runat="server" CssClass="btn btn-primary ms-3" OnClick="SearchButton_Click" Text="Search" />
                </div>
            </div>





        </div>
    </div>
</asp:Content>

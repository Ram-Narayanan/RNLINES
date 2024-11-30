<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Samplepage1.aspx.cs" Inherits="RN_LINE.Samplepage1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sample Page</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- asp content body starts here -->
            <div class="container">
                <div class="row">
                    <div class="card">
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <h2>Shipper Details</h2>
                                <table>
                                    <tr>
                                        <div class="row">
                                            <div class="col">
                                                <td><asp:Label ID="Label1" runat="server" Text="Shipper Name"></asp:Label></td>
                                                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                            </div>
                                        </div>
                                    </tr>
                                    <tr>
                                        <div class="row">
                                            <div class="col">
                                                <td><asp:Label ID="Label2" runat="server" Text="Address"></asp:Label></td>
                                                <td><asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                                            </div>
                                        </div>
                                    </tr>
                                    <tr>
                                        <div class="row">
                                            <div class="col">
                                                <td><asp:Label ID="Label3" runat="server" Text="E-mail"></asp:Label></td>
                                                <td><asp:TextBox ID="TextBox3" runat="server" TextMode="Email"></asp:TextBox></td>
                                            </div>
                                        </div>
                                    </tr>
                                    <tr>
                                        <div class="row">
                                            <div class="col">
                                                <td><asp:Label ID="Label13" runat="server" Text="Contact Number"></asp:Label></td>
                                                <td><asp:TextBox ID="TextBox13" runat="server" TextMode="Number"></asp:TextBox></td>
                                            </div>
                                        </div>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-md-6">
                                <h2>Consignee Details</h2>
                                <table>
                                    <tr>
                                        <div class="row">
                                            <div class="col">
                                                <td><asp:Label ID="Label4" runat="server" Text="Consignee Name"></asp:Label></td>
                                                <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                                            </div>
                                        </div>
                                    </tr>
                                    <tr>
                                        <div class="row">
                                            <div class="col">
                                                <td><asp:Label ID="Label5" runat="server" Text="Address"></asp:Label></td>
                                                <td><asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                                            </div>
                                        </div>
                                    </tr>
                                    <tr>
                                        <div class="row">
                                            <div class="col">
                                                <td><asp:Label ID="Label6" runat="server" Text="Email-id"></asp:Label></td>
                                                <td><asp:TextBox ID="TextBox6" runat="server" TextMode="Email"></asp:TextBox></td>
                                            </div>
                                        </div>
                                    </tr>
                                    <tr>
                                        <div class="row">
                                            <div class="col">
                                                <td><asp:Label ID="Label14" runat="server" Text="Contact Number"></asp:Label></td>
                                                <td><asp:TextBox ID="TextBox14" runat="server" TextMode="Number"></asp:TextBox></td>
                                            </div>
                                        </div>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <br />

                <div class="row">
                    <div class="col">
                        <div class="card">
                            <h2>Vessel Details</h2>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="Label15" runat="server" Text="Vessel Details"></asp:Label>
                                    <asp:TextBox ID="lblVesselName" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="Label16" runat="server" Text="Vessel Voyage     "></asp:Label>
                                    <asp:TextBox ID="lblVoyage" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <table>
                                        <tr>
                                            <td><asp:Label ID="Label7" runat="server" Text="Port of Loading    "></asp:Label></td>
                                            <td><asp:TextBox ID="lblLoadingPort" runat="server" Enabled="False"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="Label9" runat="server" Text="POL ETA"></asp:Label></td>
                                            <td><asp:TextBox ID="lblETA" runat="server" Enabled="False"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="Label11" runat="server" Text="POL ETD"></asp:Label></td>
                                            <td><asp:TextBox ID="lblETD" runat="server" Enabled="False"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </div>

                                <div class="col-md-6">
                                    <table>
                                        <tr>
                                            <td><asp:Label ID="Label8" runat="server" Text="Port of Destination"></asp:Label></td>
                                            <td><asp:ListBox ID="ListBox1" OnSelectedIndexChanged="PortSelected_indexchanged" CssClass="form-control" Visible="false"
                                                runat="server" AutoPostBack="true" ></asp:ListBox>
                                            <asp:TextBox ID="destinationPortSearch" runat="server" AutoPostBack="True" OnTextChanged="destinationPortSearch_TextChanged"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="Label10" runat="server" Text="POD ETA"></asp:Label></td>
                                            <td><asp:TextBox ID="TextBox10" runat="server" Enabled="False"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="Label12" runat="server" Text="POD ETD"></asp:Label></td>
                                            <td><asp:TextBox ID="TextBox12" runat="server" Enabled="False"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br />

                <!-- for pricing -->
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <br />
                            <div class="row">
                                <div class="col-md-4">

                                
                            <asp:Label ID="Label19" runat="server" Text="Container Type : "></asp:Label>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="SD_20">20'SD</asp:ListItem>
                                <asp:ListItem Value="SD_40">40'SD</asp:ListItem>
                                <asp:ListItem Value="HQ_40">40'HQ</asp:ListItem>
                            </asp:DropDownList>
                            <br /><br />
                            <asp:Label ID="Label20" runat="server" Text="Cargo Type : "></asp:Label>
                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="CARGO" Text="DG CARGO" />
                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="CARGO" Text="NON DG CARGO" />
                                </div>
                            </div>
                                </div>
                    </div>
                </div>
                <br />

                <!-- Cargo Details -->
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <br />
                             <div class="row">
     <div class="col-md-4">
         <table>
             <tr>
                 <td>
                            <asp:Label ID="Label17" runat="server" Text="Commodity"></asp:Label>
                     </td>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                 <td>
                            <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                     </td>
                 </tr>
                            <tr>
                                <td>
                            <asp:Label ID="Label18" runat="server" Text="Cargo weight"></asp:Label>
                                    </td>
                                <td>
                            <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
             </table>
         </div>
                                 </div>
                            <br />
                        </div>
                    </div>
                </div>

            

            <br />
            <br />

           <div class="row justify-content-center">
    <!-- Submit Button -->
    <div class="col-md-2 text-center">
        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="Button1_Click" />
    </div>

    <!-- Cancel Button -->
    <div class="col-md-2 text-center">
        <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-danger" />
    </div>
</div>
                </div>

              <!-- asp content body ENDS here -->
        </div>
    </form>
</body>
</html>

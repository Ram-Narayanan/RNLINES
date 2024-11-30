<%@ Page Title="User Registration" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="RN_LINE.UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <!-- Logo -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/loginicon.png" width="150px" />
                                </center>
                            </div>
                        </div>

                        <!-- Title -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>USER REGISTRATION</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <!-- Registration Form -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox4" class="form-label">Full Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Full Name" Style="margin-bottom: 15px"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox5" class="form-label">Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Date of Birth" TextMode="Date" Style="margin-bottom: 15px"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox1" class="form-label">Contact Number</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Contact Number" Style="margin-bottom: 15px" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox2" class="form-label">E-mail ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="E-mail ID" TextMode="Email" Style="margin-bottom: 15px"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="DropDownList1" class="form-label">State</label>
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="Select" />
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                        <asp:ListItem Text="Bihar" Value="Bihar" />
                                        <asp:ListItem Text="Delhi" Value="Delhi" />
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                        
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox6" class="form-label">City</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City" TextMode="SingleLine" Style="margin-bottom: 15px"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox7" class="form-label">Pin Code</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Pin Code" Style="margin-bottom: 15px" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="TextBox3" class="form-label">Full Address</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Address" Style="margin-bottom: 15px" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox8" class="form-label">Password</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Password" TextMode="Password" Style="margin-bottom: 15px"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox9" class="form-label">Confirm Password</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Confirm Password" TextMode="Password" Style="margin-bottom: 15px"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:CompareValidator
                                    ID="CompareValidator1"
                                    runat="server"
                                    ControlToCompare="TextBox8"
                                    ControlToValidate="TextBox9"
                                    ErrorMessage="Passwords do not match."
                                    ForeColor="Red"
                                    Display="Dynamic" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Button CssClass="btn btn-success btn-lg d-block w-100" ID="Button1" runat="server" Text="Sign Up"
                                Style="margin-bottom: 15px" OnClick="Button1_Click" />
                        </div>

                        <a href="homepage.aspx">< Back to Home</a>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

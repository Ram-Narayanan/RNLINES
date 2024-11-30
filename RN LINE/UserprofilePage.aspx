<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserprofilePage.aspx.cs" Inherits="RN_LINE.UserprofilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10 ">
            <div class="card">
                <div class="card-body">

                    <div class="row">
                        <div class="col">
                            <center>
                                <img src="Images/loginicon.png" width="150px"  />
                            </center>
                        </div>
                    </div>

                    <div class="row justify-content-center">
                        <div class="col text-center">

                            <h4>Your Profile</h4>
                            <span>Account Status</span>
                            <asp:Label class="badge text-bg-info" ID="Label1" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr />
                        </div>
                    </div>


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
                                <label for="TextBox4" class="form-label">Contact Number</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Contact Number" Style="margin-bottom: 15px"></asp:TextBox>
                            </div>

                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="TextBox5" class="form-label">E-mail ID</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="E-mail ID" TextMode="Email" Style="margin-bottom: 15px"></asp:TextBox>

                            </div>
                        </div>

                    </div>


                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="TextBox4" class="form-label">State</label>
                                <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="Select" Value="Select" />
                                    <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                    <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                    <asp:ListItem Text="Assam" Value="Assam" />
                                    <asp:ListItem Text="Bihar" Value="Bihar" />
                                    <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                    <asp:ListItem Text="Goa" Value="Goa" />
                                    <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                    <asp:ListItem Text="Haryana" Value="Haryana" />
                                    <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                    <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                    <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                    <asp:ListItem Text="Kerala" Value="Kerala" />
                                    <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                    <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                    <asp:ListItem Text="Manipur" Value="Manipur" />
                                    <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                    <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                    <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                    <asp:ListItem Text="Odisha" Value="Odisha" />
                                    <asp:ListItem Text="Punjab" Value="Punjab" />
                                    <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                    <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                    <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                    <asp:ListItem Text="Telangana" Value="Telangana" />
                                    <asp:ListItem Text="Tripura" Value="Tripura" />
                                    <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                    <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                    <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                    <asp:ListItem Text="Andaman and Nicobar Islands" Value="Andaman and Nicobar Islands" />
                                    <asp:ListItem Text="Chandigarh" Value="Chandigarh" />
                                    <asp:ListItem Text="Dadra and Nagar Haveli and Daman and Diu" Value="Dadra and Nagar Haveli and Daman and Diu" />
                                    <asp:ListItem Text="Lakshadweep" Value="Lakshadweep" />
                                    <asp:ListItem Text="Delhi" Value="Delhi" />
                                    <asp:ListItem Text="Puducherry" Value="Puducherry" />




                                </asp:DropDownList>
                            </div>

                        </div>


                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="TextBox5" class="form-label">City</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City" TextMode="SingleLine" Style="margin-bottom: 15px"></asp:TextBox>

                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="TextBox4" class="form-label">Pin Code</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Pin Code" Style="margin-bottom: 15px" TextMode="Number"></asp:TextBox>
                            </div>

                        </div>

                    </div>



                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="TextBox4" class="form-label">Full Address</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Address" Style="margin-bottom: 15px" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>

                        </div>




                    </div>


                    <div class="row justify-content-center">
                        <div class="col text-center">
                            <span style="margin-bottom: 15px;" class="badge text-bg-info">User Credentials</span>
                        </div>
                    </div>




                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="TextBox4" class="form-label">User ID</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="User ID" Style="margin-bottom: 15px" ReadOnly="True"></asp:TextBox>
                            </div>

                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="TextBox5" class="form-label">Password</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password" Style="margin-bottom: 15px" ReadOnly="True"></asp:TextBox>

                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="TextBox5" class="form-label">New Password</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password" Style="margin-bottom: 15px"></asp:TextBox>

                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-8 mx-auto">

                            <div class="form-group text-center">

                                <asp:Button class="btn btn-primary btn-lg d-block w-100 " ID="Button1" runat="server" Text="Update"
                                    Style="margin-bottom: 15px" />


                            </div>
                        </div>
                    </div>





                </div>







            </div>


            <a href="homepage.aspx">< < Back to Home</a>
        </div>



        
    </div>
</div>

</asp:Content>

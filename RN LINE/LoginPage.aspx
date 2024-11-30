<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="RN_LINE.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container" style="height:100%;"> 
      <div class="row">
          <div class="col-6 mx-auto">
               
                <!-- Email Input -->
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="email@example.com" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" InitialValue="" ErrorMessage="Email is required" ForeColor="Red" />
                </div>
                
                <!-- Password Input -->
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" InitialValue="" ErrorMessage="Password is required" ForeColor="Red" />
                </div>
                
                <!-- Login Button -->
                
                <asp:Button ID="Button1" CssClass="btn btn-primary" OnClick="btnLogin_Click" runat="server" Text="Login1" />
                <asp:Button ID="Button2" CssClass="btn btn-primary" OnClick="btnLogin_Click" runat="server" Text="Login" />
                <!-- Error Message Label -->
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false" Enabled="False"></asp:Label>
              <br />
              <br />
            
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="UserRegistration.aspx">New around here? Sign up</a>
              <a class="dropdown-item" href="#">Forgot password?</a>
          </div>
      </div>
  </div> 
</asp:Content>

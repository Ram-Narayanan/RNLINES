<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactusPage.aspx.cs" Inherits="RN_LINE.ContactusPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="container">
       <div class="card">
    <div class="row my-4 mx-4">
        <!-- Contact Information Section -->
        <div class="col">
            <h1>Contact Us</h1>
            <p>If you have any questions or inquiries, feel free to reach out to us through the contact form below or using the provided contact details.</p>

            <!-- Contact Info -->
            <div class="mb-4">
                <h2>Our Office</h2>
                <h4>Address:</h4> <p>1234 Ocean Avenue, Port City, 56789</p>
                <h4>Email:</h4> <p>support@shippingline.com</p> 
                <h4>Phone:</h4> <p>+1 800 123 4567</p> 
            </div>

            <!-- Social Media Links -->
            <div>
                <h4>Follow Us</h4>
                <a href="#" class="btn btn-outline-primary btn-sm mb-2 mr-2"><i class="fab fa-facebook"></i> Facebook</a>
                <a href="#" class="btn btn-outline-info btn-sm mb-2 mr-2"><i class="fab fa-twitter"></i> Twitter</a>
                <a href="#" class="btn btn-outline-primary btn-sm mb-2"><i class="fab fa-linkedin"></i> LinkedIn</a>
            </div>
        </div>

      
    </div>
           </div>
</div>
 


</asp:Content>

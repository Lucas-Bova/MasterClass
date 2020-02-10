<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MasterClass.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <%-- add log in fields and validators here --%>
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <h1 class="col-sm-12">Log In or Sign Up</h1>
            </div>            
        </div>
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <label class="col-md-4">Email: </label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="col-md-7" TextMode="Email" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required" Text="*" Display="Dynamic" ControlToValidate="txtEmail" CssClass="text-danger" />
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address" Display="Dynamic" Text="*" CssClass="text-danger"
                    ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />--%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <label class="col-md-4">Password: </label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="col-md-7" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" Text="*" Display="Dynamic" ControlToValidate="txtPassword" CssClass="text-danger"/>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password must have a minimum of 8 characters, one number, one upper case letter, one lower case letter, and one special charecter" Text="*" 
                    Display="Dynamic" ControlToValidate="txtPassword" CssClass="text-danger" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$" />--%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" CssClass="btn btn-outline-primary col-4" />
                <asp:Button ID="btnSignup" runat="server" Text="Sign Up" OnClick="btnSignup_Click" CssClass="btn col-4 btn-outline-secondary" CausesValidation="false" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 offset-4">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />
            </div>
        </div>
    </div>  
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>

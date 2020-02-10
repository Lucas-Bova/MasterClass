<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="MasterClass.NewUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="container">
        <div class="row col-md-4 offset-4">
            <h1 class="col-sm-12">Sign Up</h1>
        </div>
        <div class="row">
            <div class="col-md-6 offset-3">
                <label class="col-md-4">First Name: </label>
                <asp:TextBox ID="txtFname" runat="server" CssClass="col-md-7" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Must enter a first name." Text="*"  Display="Dynamic" ControlToValidate="txtFname" CssClass="text-danger"/>
                <label class="col-md-4">Last Name: </label>
                <asp:TextBox ID="txtLname" runat="server" CssClass="col-md-7" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Must enter a last name." Text="*"  Display="Dynamic" ControlToValidate="txtLname" CssClass="text-danger"/>
                <label class="col-md-4">Email: </label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="col-md-7" TextMode="Email" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Must enter a valid email address." Text="*"  Display="Dynamic" ControlToValidate="txtEmail" CssClass="text-danger"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address" Display="Dynamic" Text="*" CssClass="text-danger"
                    ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                <label class="col-md-4">Password: </label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="col-md-7" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password is required." Text="*"  Display="Dynamic" ControlToValidate="txtPassword" CssClass="text-danger"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password must have a minimum of 8 characters, one number, one upper case letter, one lower case letter, and one special charecter" Text="*" 
                    Display="Dynamic" ControlToValidate="txtPassword" CssClass="text-danger" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$" />
                <label class="col-md-4">Confirm Password: </label>
                <asp:TextBox ID="txtConPassword" runat="server" CssClass="col-md-7" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Must confirm password." Text="*"  Display="Dynamic" ControlToValidate="txtConPassword" CssClass="text-danger"/>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match." Text="*" Display="Dynamic" ControlToValidate="txtConPassword" CssClass="text-danger" ControlToCompare="txtPassword" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 offset-3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="col-md-5 btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="col-md-5 btn btn-dark" CausesValidation="false" />
            </div>
        </div> 
        <div class="row">
            <div class="col-md-6 offset-3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>

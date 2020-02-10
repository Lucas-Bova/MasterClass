<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewClass.aspx.cs" Inherits="MasterClass.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavPlaceHolder" runat="server">
    <ul class="nav nav-tabs">
        <li class="nav-item nav-link active"><a href="Default.aspx">Home</a></li>
        <li class="nav-item nav-link"><a href="EditGrid.aspx">Edit Grid</a></li>
        <li class="nav-item nav-link"><a href="Grid.aspx">Grid</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <h1>Set Grid</h1>
    <span>Columns: </span>
    <asp:DropDownList ID="ddlCols" runat="server"></asp:DropDownList>
    <span>Rows: </span>
    <asp:DropDownList ID="ddlRows" runat="server"></asp:DropDownList>
    <br />
    <%-- maybe add a div here to add new students or retrive them from the database
        details view in the select class aspx maybe?--%>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>

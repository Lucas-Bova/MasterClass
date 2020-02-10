<%@ Page Title="EditGrid" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditGrid.aspx.cs" Inherits="MasterClass.EditGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavPlaceHolder" runat="server">
    <ul class="nav nav-tabs">
        <li class="nav-item nav-link"><a href="Default.aspx">Home</a></li>
        <li class="nav-item nav-link active"><a href="EditGrid.aspx">Edit Grid</a></li>
        <li class="nav-item nav-link"><a href="Grid.aspx">Grid</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <h1>Edit Grid</h1>
<%--    <asp:Table ID="tblEditGrid" runat="server" CssClass="table table-bordered table-condensed">
    </asp:Table>--%>
    <br />
    <asp:Button ID="BtnRun" runat="server" Text="Run Grid" OnClick="BtnRun_Click" CssClass="btn btn-primary" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>

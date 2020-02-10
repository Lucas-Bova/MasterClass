<%@ Page Title="Grid" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="MasterClass.Grid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavPlaceHolder" runat="server">
    <ul class="nav nav-tabs">
        <li class="nav-item nav-link"><a href="Default.aspx">Home</a></li>
        <li class="nav-item nav-link"><a href="EditGrid.aspx">Edit Grid</a></li>
        <li class="nav-item nav-link active"><a href="Grid.aspx">Grid</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <h1>Class Grid</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
<%--    <script type="text/javascript">
        function Cell_Clicked(e) {
            alert(e.target.id)
            $(e.target.id).removeClass("btn-primary").addClass("btn-success");
        }
    </script>--%>
</asp:Content>

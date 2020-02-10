<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="newGrid.aspx.cs" Inherits="MasterClass.newGrid" %>

<%@ Register Assembly="Microsoft.AspNet.EntityDataSource" Namespace="Microsoft.AspNet.EntityDataSource" TagPrefix="ef" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
<%--                <asp:GridView ID="grdRun" runat="server" ItemType="MasterClass.Models.Attend" DataKeyNames="Class_ID" AutoGenerateColumns="false" CssClass="table"
                    SelectMethod="grdRun_GetData">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnItem" runat="server" Text="<%# Item.Student.Stu_Lname + '-' + Item.Att_Interactions %>" CommandName="Select" 
                                    CssClass="btn btn-primary btn-round" OnClick="btnItem_Click" CustomProp="<%# Item.Stu_ID %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>--%>
            </div>
        </div>
        <div class="row">
            <asp:Panel ID="pnlCards" runat="server" CssClass="d-inline-block col-md-12" EnableViewState="true">
            </asp:Panel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>

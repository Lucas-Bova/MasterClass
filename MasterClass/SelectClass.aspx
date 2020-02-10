<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectClass.aspx.cs" Inherits="MasterClass.SelectClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="grdClass" runat="server" ItemType="MasterClass.Models.Class" SelectMethod="grdClass_GetData" AutoGenerateColumns="false" DataKeyNames="Class_ID" 
                    CssClass="table table-bordered table-condensed" OnSelectedIndexChanged="grdClass_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Class_ID" HeaderText="Class Number" />
                        <asp:BoundField DataField="Class_Name" HeaderText="Class Name" />
                        <asp:TemplateField HeaderText="Teacher">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text="<%# Item.Teacher.Teach_Lname + ',' + ' ' + Item.Teacher.Teach_Fname %>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnClassSelect" runat="server" Text="Select" CommandName="Select" CssClass="btn btn-secondary col-md-4" CustomProp="<%# Item.Class_ID %>" OnClick="btnClassSelect_Click"/>
                                <asp:Button ID="btnClassRun" runat="server" Text="Run" CssClass="btn btn-primary col-md-4" OnClick="btnClassRun_Click" CustomProp="<%# Item.Class_ID %>"/>
                            </ItemTemplate>
                        </asp:TemplateField>    
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <div class="container-fluid h-50">
        <div class="row">
            <div class="col-md-12 d-flex align-items-stretch">
                <div class="card bg-light col-md-3 h-75 d-md-inline-block p-0 overflow-auto">
                    <asp:DetailsView ID="dvClass" runat="server" AutoGenerateRows="false" DataKeyNames="Class_ID" CssClass="table table-bordered" ItemType="MasterClass.Models.Class"
                        SelectMethod="dvClass_GetItem" UpdateMethod="dvClass_UpdateItem" InsertMethod="dvClass_InsertItem" DeleteMethod="dvClass_DeleteItem" >
                        <Fields>
                            <asp:BoundField DataField="Class_ID" HeaderText="Class Number" ReadOnly="true" />
                            <asp:BoundField DataField="Class_Name" HeaderText="Class Name" />
                            <asp:TemplateField HeaderText="Teacher" >
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# Item.Teacher.Teach_Lname %>"></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlInsertTeacher" runat="server" SelectMethod="ddlInsertTeacher_GetData"
                                        DataValueField="Teach_ID" DataTextField="Teach_Lname" SelectedValue="<%# Bind('TeachID') %>"></asp:DropDownList>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditTeacher" runat="server" SelectMethod="ddlInsertTeacher_GetData"
                                        DataValueField="Teach_ID" DataTextField="Teach_Lname" SelectedValue="<%# Bind('TeachID') %>"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="true" ShowEditButton="true" ShowDeleteButton="true" />
                        </Fields>
                    </asp:DetailsView>
                </div>
                <div class="card bg-light col-md-3 h-75 d-md-inline-block p-0 overflow-auto">
                    <asp:GridView ID="grdAttend" runat="server" ItemType="MasterClass.Models.Attend" DataKeyNames="Stu_ID" AutoGenerateColumns="false"
                        SelectMethod="grdAttend_GetData" DeleteMethod="grdAttend_DeleteItem" CssClass="table table-bordered">
                        <Columns>
                            <asp:TemplateField HeaderText="Selected">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text="<%# Item.Student.Stu_Lname + ',' + ' ' + Item.Student.Stu_Fname + ' ' + '-' + ' ' + Item.Att_Interactions %>"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="dltBtn" runat="server" Text="Remove" CommandName="delete" CssClass="btn btn-outline-primary col-md-12" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:CommandField ShowDeleteButton="true" />--%>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="card bg-light col-md-6 h-75 table-responsive table-body d-md-inline-block p-0">
                    <asp:ListView ID="lvStudents" runat="server" ItemType="MasterClass.Models.Student" DataKeyNames="Stu_ID" InsertItemPosition="LastItem"
                            SelectMethod="lvStudent_GetItem" UpdateMethod="lvStudent_UpdateItem" InsertMethod="lvStudent_InsertItem" DeleteMethod="lvStudent_DeleteItem" 
                        OnItemUpdated="lvStudents_ItemUpdated" OnItemInserted="lvStudents_ItemInserted" OnItemInserting="lvStudents_ItemInserting">
                        <ItemTemplate>
                            <tr style="" class="col-md-12">
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="<%# Item.Stu_Lname %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="<%# Item.Stu_Fname %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# $"~\\Images\\{Item.Stu_Pic}" %>' CssClass="img-thumbnail col-md-8 img-cover-small" />
                                </td>
                                <td>
                                    <div class="btn-group" role="group">
                                        <asp:Button ID="Button3" runat="server" Text="Add" CommandName="Select" CssClass="btn btn-primary" OnClick="lvSelectBtn_Click" CustomProp="<%# Item.Stu_ID %>"/>
                                        <asp:Button ID="Button2" runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-secondary" />
                                        <asp:Button ID="Button1" runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-danger" />
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" class="d-md-inline-block table col-md-12">
                                <tr><td><table id="itemPlaceHolderContainer" class="table table-bordered table-condensed">
                                    <thead>
                                        <tr style="">
                                            <th>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Sort" CommandArgument="Stu_Lname">Last Name</asp:LinkButton>
                                            </th>
                                            <th>
                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Sort" CommandArgument="Stu_Fname">First Name</asp:LinkButton>
                                            </th>
                                            <th>
                                                <asp:Label ID="Label5" runat="server" Text="Picture"></asp:Label>                                            
                                            </th>
                                            <th> </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr runat="server" id="itemPlaceholder"></tr>
                                    </tbody>
                                        </table></td></tr>
                            </table>
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-primary col-md-3" 
                                        ShowFirstPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true"/>
                                    <asp:NumericPagerField ButtonCount="5" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-primary col-md-3"
                                        ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                </Fields>
                            </asp:DataPager>
                        </LayoutTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:TextBox ID="lvInsertLname" runat="server" Text='<%# Bind("Stu_Lname") %>' ></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="lvInsertFname" runat="server" Text='<%# Bind("Stu_Fname") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload2" runat="server" ToolTip="Upload Image" />
                                </td>
                                <td>
                                    <asp:Button ID="InsertBtn" runat="server" Text="Insert" CommandName="Insert" CssClass="btn btn-dark" />
                                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-dark" />
                                </td
                            </tr>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Stu_Lname") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Stu_Fname") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" ToolTip="Upload Image" CustomProp='<%# Item.Stu_ID %>' />
                                </td>
                                <td>
                                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-dark" />
                                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-dark" />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        
                    </asp:ListView>
                </div>               
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
</asp:Content>

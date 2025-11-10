<%@ Page Title="ManageCustomers" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="ManageCustomers.aspx.cs" Inherits="FoodMart_Pro.Admin.ManageCustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid-container {
            background-color: #fff;
            border-radius: 15px;
            padding-left: 250px;
            width: 95%;
            margin-top: 25px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="grid-container">
        <h3 class="mb-3 text-primary">Manage Customers</h3>

        <asp:GridView ID="GridView1"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="table table-bordered table-hover text-center align-middle shadow-sm rounded"
            HeaderStyle-CssClass="table-primary"
            AlternatingRowStyle-CssClass="table-light"
            OnRowCommand="GridView1_RowCommand">

            <Columns>
                <asp:TemplateField HeaderText="Customer ID">
                    <ItemTemplate><%# Eval("Id") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Full Name">
                    <ItemTemplate><%# Eval("FullName") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate><%# Eval("Email") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Phone Number">
                    <ItemTemplate><%# Eval("PNumber") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server"
                            CommandName="cmd_del"
                            CommandArgument='<%# Eval("Id") %>'
                            CssClass="btn btn-sm btn-danger"
                            OnClientClick="return confirm('Are you sure you want to delete this user?');">
                            <i class="bi bi-trash"></i> Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

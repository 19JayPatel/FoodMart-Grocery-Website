<%@ Page Title="Manage Orders" Language="C#" MasterPageFile="~/Admin/admin.Master"
    AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs"
    Inherits="FoodMart_Pro.Admin.ManageOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Fix layout under sidebar */
        .page-wrapper {
            margin-left: 250px;
            padding: 30px;
            background-color: #f8f9fa;
            min-height: 100vh;
        }

        .grid-box {
            background: #fff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }

        .table thead {
            background-color: #0d6efd;
            color: #fff;
        }

        .table th {
            font-weight: 600;
            text-transform: uppercase;
        }

        .table td {
            vertical-align: middle;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="grid-box">
                <h4 class="section-title">
                    <i class="bi bi-bag-check-fill text-primary"></i>Manage Orders
                </h4>

                <asp:GridView ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered table-hover text-center align-middle"
                    HeaderStyle-CssClass="bg-primary text-white"
                    AlternatingRowStyle-CssClass="table-light"
                    OnRowCommand="GridView1_RowCommand">

                    <Columns>
                        <asp:TemplateField HeaderText="Order ID">
                            <ItemTemplate><%# Eval("Order_Id") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="User ID">
                            <ItemTemplate><%# Eval("User_Id") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Order Date">
                            <ItemTemplate><%# String.Format("{0:dd-MMM-yyyy hh:mm tt}", Eval("Order_Date")) %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Amount (₹)">
                            <ItemTemplate><%# String.Format("{0:N2}", Eval("Total_Amount")) %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class="badge bg-warning text-dark">Pending</span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Payment">
                            <ItemTemplate><%# Eval("Payment_Method") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkView" runat="server"
                                    CommandName="cmd_view"
                                    CommandArgument='<%# Eval("Order_Id") %>'
                                    CssClass="btn btn-sm btn-info me-2 text-white">
                                    <i class="bi bi-eye"></i> View
                                </asp:LinkButton>

                                <asp:LinkButton ID="lnkDelete" runat="server"
                                    CommandName="cmd_del"
                                    CommandArgument='<%# Eval("Order_Id") %>'
                                    CssClass="btn btn-sm btn-danger"
                                    OnClientClick="return confirm('Are you sure you want to delete this order?');">
                                    <i class="bi bi-trash"></i> Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <!-- SECOND GRID FOR ORDER ITEMS -->
                <div id="divOrderItems" runat="server" visible="false" class="sub-grid">
                    <div class="section-title"><i class="bi bi-bag"></i>Order Items</div>
                    <asp:GridView ID="GridView2" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-bordered table-hover text-center align-middle rounded"
                        HeaderStyle-CssClass="table-info">

                        <Columns>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate><%# Eval("Product_Name") %></ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Price (₹)">
                                <ItemTemplate><%# String.Format("{0:N2}", Eval("Product_Price")) %></ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate><%# Eval("Product_Quantity") %></ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <img src='<%# Eval("Product_Image") %>' style="width: 60px; height: 60px; border-radius: 8px;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

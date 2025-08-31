<%@ Page Title="Manage Products" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="FoodMart_Pro.Admin.ManageProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card-custom {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 30px;
            margin-top: 30px;
        }

        h2 {
            font-size: 28px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 25px;
            text-align: center;
        }

        .form-label {
            font-weight: 600;
            color: #444;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #ced4da;
        }

            .form-control:focus {
                border-color: #0d6efd;
                box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.2);
            }

        .btn {
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
        }

            .btn i {
                margin-right: 6px;
            }

        .btn-primary {
            background-color: #0d6efd;
            border: none;
        }

            .btn-primary:hover {
                background-color: #084298;
            }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

            .btn-danger:hover {
                background-color: #bb2d3b;
            }

        .table {
            border-radius: 10px;
            overflow: hidden;
        }

            .table thead th {
                background-color: #0d6efd;
                color: #fff;
                text-align: center;
                font-weight: 600;
            }

            .table tbody tr:hover {
                background-color: #f1f5ff;
                transition: background 0.2s;
            }

        .img-thumbnail {
            border-radius: 6px;
            max-height: 80px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main>
        <div class="container">
            <div class="card-custom">
                <h2><i class="bi bi-box-seam"></i>&nbsp;Manage Products</h2>

                <!-- Add Product Form -->
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="txtProductName" class="form-label">Product Full Name</label>
                        <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" Placeholder="Enter full name of product" />
                    </div>

                    <div class="col-md-6">
                        <label for="txtWeight" class="form-label">Weight / Size</label>
                        <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" Placeholder="e.g., 750g Bottle" />
                    </div>

                    <div class="col-md-6">
                        <label for="txtPrice" class="form-label">Price</label>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Enter price" />
                    </div>

                    <div class="col-md-6">
                        <label for="ddlCategory" class="form-label">Category</label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>

                    <div class="col-md-12">
                        <label for="fileUploadImage" class="form-label">Product Image</label>
                        <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-control" />
                    </div>

                    <div class="col-md-12 text-center mt-3">
                        <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-primary" OnClick="btnAddProduct_Click" />
                    </div>
                </div>

                <asp:Label ID="lblMsg" runat="server" CssClass="mt-3 d-block text-center fw-bold" ForeColor="Green"></asp:Label>

                <!-- Product Grid -->
                <div class="grid-container mt-4">
                    <asp:GridView ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-bordered table-hover text-center align-middle shadow-sm rounded"
                        HeaderStyle-CssClass="table-primary"
                        AlternatingRowStyle-CssClass="table-light"
                        OnRowCommand="GridView1_RowCommand">

                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <%# Eval("ProductID") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <%# Eval("ProductName") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Weight">
                                <ItemTemplate>
                                    <%# Eval("Weight") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    ₹ <%# String.Format("{0:N2}", Eval("Price")) %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <%# Eval("CategoryName") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="imgProduct" runat="server"
                                        ImageUrl='<%# Eval("ProductImage") %>'
                                        CssClass="img-thumbnail" Width="80px" Height="80px" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server"
                                        CommandName="cmd_edit"
                                        CommandArgument='<%# Eval("ProductID") %>'
                                        CssClass="btn btn-sm btn-primary me-2">
                                        <i class="bi bi-pencil-square"></i> Edit
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="lnkDelete" runat="server"
                                        CommandName="cmd_del"
                                        CommandArgument='<%# Eval("ProductID") %>'
                                        CssClass="btn btn-sm btn-danger"
                                        OnClientClick="return confirm('Are you sure you want to delete this product?');">
                                        <i class="bi bi-trash"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

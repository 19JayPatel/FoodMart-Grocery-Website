<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FoodMart_Pro.User.Cart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Cart - FoodMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background-color: #f8f9fa;">
    <form id="form1" runat="server">
        <div class="container py-5">
            <h2 class="mb-4 text-center">Your Shopping Cart</h2>

            <!-- CART TABLE -->
            <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False"
                CssClass="table table-bordered table-striped text-center align-middle"
                DataKeyNames="Id">
                <Columns>
                    <asp:TemplateField HeaderText="Product Image">
                        <ItemTemplate>
                            <img src='<%# Eval("Product_image") %>' alt="Product"
                                style="width: 80px; height: 80px; border-radius: 10px;" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Product Name">
                        <ItemTemplate>
                            <%# Eval("Product_name") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server"
                                Text='<%# Eval("Product_quantity") %>'
                                CssClass="form-control text-center" Width="70px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price (₹)">
                        <ItemTemplate>
                            <%# Eval("Product_price") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <!-- Update Button -->
                            <asp:Button ID="btnupdate" runat="server" Text="Update"
                                CssClass="btn btn-success btn-sm text-white me-1"
                                CommandName="cmd_update"
                                CommandArgument='<%# Eval("Id") %>'
                                OnClick="btnupdate_Click" />

                            <!-- Remove Button -->
                            <asp:Button ID="btnremove" runat="server" Text="Remove"
                                CssClass="btn btn-danger btn-sm"
                                CommandName="cmd_remove"
                                CommandArgument='<%# Eval("Id") %>'
                                OnClick="btnremove_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

                <HeaderStyle CssClass="table-dark" />
            </asp:GridView>

            <!-- SUMMARY SECTION -->
            <div class="row mt-4">
                <div class="col-lg-4 ms-auto">
                    <div class="card shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="card-title mb-3">Order Summary</h5>
                            <hr />
                            <div class="d-flex justify-content-between mb-2">
                                <span>Subtotal</span>
                                <asp:Label ID="lblSubtotal" runat="server" Text="₹0.00"></asp:Label>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Delivery</span>
                                <span>₹100.00</span>
                            </div>
                            <hr />
                            <div class="d-flex justify-content-between mb-3">
                                <strong>Total</strong>
                                <strong>
                                    <asp:Label ID="lblTotal" runat="server" Text="₹0.00"></asp:Label>
                                </strong>
                            </div>
                            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping"
                                CssClass="btn btn-warning w-100 fw-bold"
                                PostBackUrl="~/User/DisplayProduct.aspx" />
                            <asp:Button ID="btnCheckout" runat="server" Text="Check Out"
                                CssClass="btn btn-primary w-100 fw-bold mt-2"
                                PostBackUrl="~/User/Checkout.aspx" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>

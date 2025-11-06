<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Checkout.aspx.cs"
    Inherits="FoodMart_Pro.User.Checkout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />
</head>
<body style="background-color: #f8f9fa;">
    <form id="form1" runat="server" class="container py-4">
        <asp:ScriptManager runat="server" ID="sm" />
        <div class="row g-4">

            <!-- CART ITEMS -->
            <div class="col-lg-8">
                <asp:GridView ID="GridViewCheckout" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered table-striped text-center align-middle"
                    DataKeyNames="Id"
                    OnRowCommand="GridViewCheckout_RowCommand">
                    <Columns>

                        <asp:TemplateField HeaderText="Product Image">
                            <ItemTemplate>
                                <img src='<%# Eval("Product_image") %>' alt="Product"
                                    style="width: 80px; height: 80px; border-radius: 10px;" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Product_name" HeaderText="Product Name" />

                        <asp:BoundField DataField="Product_quantity" HeaderText="Quantity" />

                        <asp:BoundField DataField="Product_price" HeaderText="Price (₹)" DataFormatString="{0:N2}" />

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnRemove" runat="server"
                                    CssClass="btn btn-danger btn-sm"
                                    CommandName="cmd_remove"
                                    CommandArgument='<%# Eval("Id") %>'>
                                    Remove
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <HeaderStyle CssClass="table-dark" />
                </asp:GridView>

                <!-- SHIPPING ADDRESS SECTION -->
                <div class="card mt-4 shadow-sm border-0">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Shipping Address</h5>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3"
                            CssClass="form-control" placeholder="Enter your full shipping address..."></asp:TextBox>
                    </div>
                </div>

                <!-- PAYMENT METHOD SECTION -->
                <div class="card mt-4 shadow-sm border-0">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Select Payment Method</h5>

                        <asp:RadioButtonList ID="rblPayment" runat="server" CssClass="list-group">
                            <asp:ListItem CssClass="list-group-item">Credit / Debit Card</asp:ListItem>
                            <asp:ListItem CssClass="list-group-item">UPI / Net Banking</asp:ListItem>
                            <asp:ListItem CssClass="list-group-item">Cash on Delivery</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>

            <!-- ORDER SUMMARY -->
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

                        <asp:Button ID="btnGoCart" runat="server" Text="Go Cart"
                            CssClass="btn btn-warning w-100 fw-bold"
                            PostBackUrl="~/User/Cart.aspx" />

                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order"
                            CssClass="btn btn-primary w-100 fw-bold mt-2"
                            OnClick="btnPlaceOrder_Click" />
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>

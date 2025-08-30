<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Admin/Admin.master"
    AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="FoodMart_Pro.Admin.AdminDashboard" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <div class="row g-4">
        <!-- Orders -->
        <div class="col-md-3">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="fw-semibold"><i class="bi bi-cart-fill text-primary"></i>&nbsp;Orders</h5>
                    <h3 class="fw-bold mb-0">111</h3>
                    <small class="text-muted">This Month</small>
                </div>
            </div>
        </div>

        <!-- Revenue -->
        <div class="col-md-3">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="fw-semibold"><i class="bi bi-currency-rupee text-success"></i>&nbsp;Revenue</h5>
                    <h3 class="fw-bold mb-0">₹11,111</h3>
                    <small class="text-muted">This Month</small>
                </div>
            </div>
        </div>

        <!-- Products -->
        <div class="col-md-3">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="fw-semibold"><i class="bi bi-box-seam" style="color: #FFC43F;"></i>&nbsp;Products</h5>
                    <h3 class="fw-bold mb-0">80</h3>
                    <small class="text-muted">Active Items</small>
                </div>
            </div>
        </div>

        <!-- Customers -->
        <div class="col-md-3">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="fw-semibold"><i class="bi bi-people-fill text-danger"></i>&nbsp;Customers</h5>
                    <h3 class="fw-bold mb-0">100</h3>
                    <small class="text-muted">Total Users</small>
                </div>
            </div>
        </div>
    </div>

</asp:Content>


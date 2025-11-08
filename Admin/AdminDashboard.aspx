<%@ Page Title="FoodMart Dashboard" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="FoodMart_Pro.Admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Chart.js for charts -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main>
        <!-- ====== Welcome Header with Logout ====== -->
        <div class="d-flex justify-content-between align-items-center mb-4 mt-2">
            <div>
                <asp:Label ID="lblWelcome" runat="server" CssClass="fs-4 fw-semibold text-dark"></asp:Label>
            </div>
            <div>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger btn-sm px-4" OnClick="btnLogout_Click" />
            </div>
        </div>

        <!-- ===== Dashboard Summary Cards ===== -->
        <div class="row g-4 mb-4">
            <!-- Orders -->
            <div class="col-md-3">
                <div class="card shadow-sm h-100 border-0">
                    <div class="card-body">
                        <h5 class="fw-semibold"><i class="bi bi-cart-fill text-primary"></i>&nbsp;Orders</h5>
                        <h3 class="fw-bold mb-0">111</h3>
                        <small class="text-muted">This Month</small>
                    </div>
                </div>
            </div>

            <!-- Revenue -->
            <div class="col-md-3">
                <div class="card shadow-sm h-100 border-0">
                    <div class="card-body">
                        <h5 class="fw-semibold"><i class="bi bi-currency-rupee text-success"></i>&nbsp;Revenue</h5>
                        <h3 class="fw-bold mb-0">₹11,111</h3>
                        <small class="text-muted">This Month</small>
                    </div>
                </div>
            </div>

            <!-- Products -->
            <div class="col-md-3">
                <div class="card shadow-sm h-100 border-0">
                    <div class="card-body">
                        <h5 class="fw-semibold"><i class="bi bi-box-seam" style="color: #FFC43F;"></i>&nbsp;Products</h5>
                        <h3 class="fw-bold mb-0">80</h3>
                        <small class="text-muted">Active Items</small>
                    </div>
                </div>
            </div>

            <!-- Customers -->
            <div class="col-md-3">
                <div class="card shadow-sm h-100 border-0">
                    <div class="card-body">
                        <h5 class="fw-semibold"><i class="bi bi-people-fill text-danger"></i>&nbsp;Customers</h5>
                        <h3 class="fw-bold mb-0">100</h3>
                        <small class="text-muted">Total Users</small>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== Extra Cards (New Sections) ===== -->
        <div class="row g-4 mb-4">
            <!-- Pending Orders -->
            <div class="col-md-3">
                <div class="card h-100 border-start border-warning border-4 shadow-sm">
                    <div class="card-body">
                        <h6 class="fw-semibold text-warning"><i class="bi bi-hourglass-split"></i>&nbsp;Pending Orders</h6>
                        <h3 class="fw-bold mb-0">15</h3>
                    </div>
                </div>
            </div>

            <!-- Low Stock Items -->
            <div class="col-md-3">
                <div class="card h-100 border-start border-danger border-4 shadow-sm">
                    <div class="card-body">
                        <h6 class="fw-semibold text-danger"><i class="bi bi-exclamation-triangle"></i>&nbsp;Low Stock</h6>
                        <h3 class="fw-bold mb-0">5</h3>
                    </div>
                </div>
            </div>

            <!-- New Feedback -->
            <div class="col-md-3">
                <div class="card h-100 border-start border-info border-4 shadow-sm">
                    <div class="card-body">
                        <h6 class="fw-semibold text-info"><i class="bi bi-chat-left-text"></i>&nbsp;New Feedback</h6>
                        <h3 class="fw-bold mb-0">12</h3>
                    </div>
                </div>
            </div>

            <!-- Active Offers -->
            <div class="col-md-3">
                <div class="card h-100 border-start border-success border-4 shadow-sm">
                    <div class="card-body">
                        <h6 class="fw-semibold text-success"><i class="bi bi-percent"></i>&nbsp;Active Offers</h6>
                        <h3 class="fw-bold mb-0">3</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== Charts Section ===== -->
        <div class="row g-4">
            <!-- Orders Chart -->
            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-light">
                        <h6 class="fw-semibold mb-0">Monthly Orders Overview</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="ordersChart" height="120"></canvas>
                    </div>
                </div>
            </div>

            <!-- Top Selling Product -->
            <div class="col-md-4">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-light">
                        <h6 class="fw-semibold mb-0">Top Selling Products</h6>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center">Basmati Rice (5kg) <span class="badge bg-success rounded-pill">320 sold</span></li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">Fresh Milk (1L) <span class="badge bg-success rounded-pill">280 sold</span></li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">Wheat Flour (10kg) <span class="badge bg-success rounded-pill">250 sold</span></li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">Cooking Oil (5L) <span class="badge bg-success rounded-pill">210 sold</span></li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">Sugar (1kg) <span class="badge bg-success rounded-pill">190 sold</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <script>
        // === Simple Orders Chart ===
        const ctx = document.getElementById('ordersChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Orders',
                    data: [50, 75, 100, 125, 90, 150],
                    backgroundColor: '#0d6efd'
                }]
            },
            options: {
                plugins: { legend: { display: false } },
                scales: { y: { beginAtZero: true } }
            }
        });
    </script>

</asp:Content>

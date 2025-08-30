<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FoodMart_Pro.User.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up - FoodMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" />
    <style>
        body {
            background: #f8f9fa;
        }

        .signup-container {
            max-width: 450px;
            margin: auto;
            margin-top: 50px;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

            .signup-container h3 {
                font-weight: bold;
                margin-bottom: 10px;
            }

            .signup-container p {
                color: #6c757d;
                font-size: 14px;
            }

        .form-control:focus {
            border-color: #FFC43F;
            box-shadow: none;
        }

        .btn-signup {
            background: #28a745;
            border: none;
        }

            .btn-signup:hover {
                background: #218838;
            }

        .input-group-text {
            background: #f8f9fa;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
            <defs>
                <symbol xmlns="http://www.w3.org/2000/svg" id="link" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M12 19a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0-4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm-5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm7-12h-1V2a1 1 0 0 0-2 0v1H8V2a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V6a3 3 0 0 0-3-3Zm1 17a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-9h16Zm0-11H4V6a1 1 0 0 1 1-1h1v1a1 1 0 0 0 2 0V5h8v1a1 1 0 0 0 2 0V5h1a1 1 0 0 1 1 1ZM7 15a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0 4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-right" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M17.92 11.62a1 1 0 0 0-.21-.33l-5-5a1 1 0 0 0-1.42 1.42l3.3 3.29H7a1 1 0 0 0 0 2h7.59l-3.3 3.29a1 1 0 0 0 0 1.42a1 1 0 0 0 1.42 0l5-5a1 1 0 0 0 .21-.33a1 1 0 0 0 0-.76Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="category" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M19 5.5h-6.28l-.32-1a3 3 0 0 0-2.84-2H5a3 3 0 0 0-3 3v13a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3v-10a3 3 0 0 0-3-3Zm1 13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-13a1 1 0 0 1 1-1h4.56a1 1 0 0 1 .95.68l.54 1.64a1 1 0 0 0 .95.68h7a1 1 0 0 1 1 1Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="calendar" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M19 4h-2V3a1 1 0 0 0-2 0v1H9V3a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V7a3 3 0 0 0-3-3Zm1 15a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-7h16Zm0-9H4V7a1 1 0 0 1 1-1h2v1a1 1 0 0 0 2 0V6h6v1a1 1 0 0 0 2 0V6h2a1 1 0 0 1 1 1Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="heart" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M20.16 4.61A6.27 6.27 0 0 0 12 4a6.27 6.27 0 0 0-8.16 9.48l7.45 7.45a1 1 0 0 0 1.42 0l7.45-7.45a6.27 6.27 0 0 0 0-8.87Zm-1.41 7.46L12 18.81l-6.75-6.74a4.28 4.28 0 0 1 3-7.3a4.25 4.25 0 0 1 3 1.25a1 1 0 0 0 1.42 0a4.27 4.27 0 0 1 6 6.05Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="plus" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="minus" viewBox="0 0 24 24">
                    <path fill="currentColor" d="M19 11H5a1 1 0 0 0 0 2h14a1 1 0 0 0 0-2Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="cart" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M8.5 19a1.5 1.5 0 1 0 1.5 1.5A1.5 1.5 0 0 0 8.5 19ZM19 16H7a1 1 0 0 1 0-2h8.491a3.013 3.013 0 0 0 2.885-2.176l1.585-5.55A1 1 0 0 0 19 5H6.74a3.007 3.007 0 0 0-2.82-2H3a1 1 0 0 0 0 2h.921a1.005 1.005 0 0 1 .962.725l.155.545v.005l1.641 5.742A3 3 0 0 0 7 18h12a1 1 0 0 0 0-2Zm-1.326-9l-1.22 4.274a1.005 1.005 0 0 1-.963.726H8.754l-.255-.892L7.326 7ZM16.5 19a1.5 1.5 0 1 0 1.5 1.5a1.5 1.5 0 0 0-1.5-1.5Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="check" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M18.71 7.21a1 1 0 0 0-1.42 0l-7.45 7.46l-3.13-3.14A1 1 0 1 0 5.29 13l3.84 3.84a1 1 0 0 0 1.42 0l8.16-8.16a1 1 0 0 0 0-1.47Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="trash" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M10 18a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1ZM20 6h-4V5a3 3 0 0 0-3-3h-2a3 3 0 0 0-3 3v1H4a1 1 0 0 0 0 2h1v11a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3V8h1a1 1 0 0 0 0-2ZM10 5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v1h-4Zm7 14a1 1 0 0 1-1 1H8a1 1 0 0 1-1-1V8h10Zm-3-1a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="star-outline" viewBox="0 0 15 15">
                    <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                        d="M7.5 9.804L5.337 11l.413-2.533L4 6.674l2.418-.37L7.5 4l1.082 2.304l2.418.37l-1.75 1.793L9.663 11L7.5 9.804Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="star-solid" viewBox="0 0 15 15">
                    <path fill="currentColor"
                        d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="search" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="user" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M15.71 12.71a6 6 0 1 0-7.42 0a10 10 0 0 0-6.22 8.18a1 1 0 0 0 2 .22a8 8 0 0 1 15.9 0a1 1 0 0 0 1 .89h.11a1 1 0 0 0 .88-1.1a10 10 0 0 0-6.25-8.19ZM12 12a4 4 0 1 1 4-4a4 4 0 0 1-4 4Z" />
                </symbol>
                <symbol xmlns="http://www.w3.org/2000/svg" id="close" viewBox="0 0 15 15">
                    <path fill="currentColor"
                        d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
                </symbol>
            </defs>
        </svg>

        <!-- Preloader Code-->
        <div class="preloader-wrapper">
            <div class="preloader">
            </div>
        </div>

        <%--        <section class="vh-100 d-flex align-items-center bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-7">
                        <div class="card shadow-lg border-0 rounded-4">
                            <div class="card-body p-5">
                                <h3 class="text-center mb-4">
                                    <i class="bi bi-person-circle text-primary"></i>Login
                                </h3>

                                <!-- Email -->
                                <div class="mb-3">
                                    <label class="form-label">
                                        <i class="bi bi-envelope-fill text-primary"></i>Email address
                                    </label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-lg" TextMode="Email" placeholder="Enter your email" required></asp:TextBox>
                                </div>

                                <!-- Password -->
                                <div class="mb-3">
                                    <label class="form-label">
                                        <i class="bi bi-lock-fill text-primary"></i>Password
                                    </label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" placeholder="Enter your password" required></asp:TextBox>
                                </div>

                                <!-- Remember Me & Forgot Password -->
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <div class="form-check">
                                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" />
                                        <label class="form-check-label" for="chkRememberMe">Remember me</label>
                                    </div>
                                    <a href="#" class="text-decoration-none">Forgot Password?</a>
                                </div>

                                <!-- Login Button -->
                                <div class="d-grid">
                                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary btn-lg" Text="Login" />
                                </div>

                                <!-- Divider -->
                                <div class="text-center my-3">
                                    <span class="text-muted">or</span>
                                </div>

                                <!-- Google Login -->
                                <div class="d-flex justify-content-center">
                                    <a href="#" class="btn"
                                        style="background-color: #fff; border: 1px solid #dadce0; color: #3c4043; font-weight: 500; padding: 8px 16px; border-radius: 4px; display: flex; align-items: center; gap: 8px; text-decoration: none;">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/225px-Google_%22G%22_logo.svg.png"
                                            alt="Google Logo" style="width: 20px; height: 20px;">
                                        Sign in with Google
                                    </a>
                                </div>

                                <!-- Login Link -->
                                <p class="mt-4 text-center">
                                    New here? <a href="signup.aspx" class="text-decoration-none">Create an account</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>

        <section class="vh-100 d-flex align-items-center bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-7">
                        <div class="card shadow-lg border-0 rounded-4">
                            <div class="card-body p-5">
                                <h3 class="text-center mb-4">
                                    <i class="bi bi-person-circle text-primary"></i>&nbsp;Login
                                </h3>

                                <asp:Label ID="lblMsg" runat="server" CssClass="error"></asp:Label><br />
                                <br />
                                <!-- Email -->
                                <div class="mb-3">
                                    <label class="form-label">
                                        <i class="bi bi-envelope-fill text-primary"></i>&nbsp;Email address
                                    </label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-lg" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                                    <!-- Validation -->
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                        ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                        ErrorMessage="Enter a valid email" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
                                </div>

                                <!-- Password -->
                                <div class="mb-3">
                                    <label class="form-label">
                                        <i class="bi bi-lock-fill text-primary"></i>&nbsp;Password
                                    </label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                                    <!-- Validation -->
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                        ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic" />
                                </div>

                                <!-- Remember Me & Forgot Password -->
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <div class="form-check">
                                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" />
                                        <label class="form-check-label" for="chkRememberMe">Remember me</label>
                                    </div>
                                    <a href="#" class="text-decoration-none">Forgot Password?</a>
                                </div>

                                <!-- Login Button -->
                                <div class="d-grid">
                                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary btn-lg" Text="Login" OnClick="btnLogin_Click" />
                                </div>

                                <!-- Divider -->
                                <div class="text-center my-3 d-flex align-items-center">
                                    <hr class="flex-grow-1">
                                    <span class="mx-2 text-muted">OR</span>
                                    <hr class="flex-grow-1">
                                </div>



                                <!-- Google Login -->
                                <div class="d-flex justify-content-center">
                                    <a href="#" class="btn"
                                        style="background-color: #fff; border: 1px solid #dadce0; color: #3c4043; font-weight: 500; padding: 8px 16px; border-radius: 4px; display: flex; align-items: center; gap: 8px; text-decoration: none;">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/225px-Google_%22G%22_logo.svg.png"
                                            alt="Google Logo" style="width: 20px; height: 20px;">
                                        Sign in with Google
                                    </a>
                                </div>

                                <!-- Login Link -->
                                <p class="mt-4 text-center">
                                    New here? <a href="signup.aspx" class="text-decoration-none">Create an account</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="FoodMart_Pro.User.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up - FoodMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" />
    <style>
        body {
            background: #f8f9fa;
            background-image: url("/images/login-bg.png");
            background-size: cover;
            background-position: center;
            position: relative;
        }

            body::before {
                content: "";
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                background: inherit;
                background-image: inherit;
                background-size: cover;
                background-position: center;
                z-index: 0;
                filter: blur(10px);
            }

        .signup-container {
            max-width: 450px;
            margin: auto;
            margin-top: 50px;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
            /* No scrolling or height limits! */
        }

        .text-danger {
            display: block;
            min-height: 18px;
            margin-top: 4px;
            font-size: 0.875rem;
            line-height: 1.2;
        }

        body, html {
            height: auto;
            min-height: 100%;
            overflow-y: auto;
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
            background-color: #FFC43F !important;
            margin-left: 115px;
            border: none;
            padding: 0;
            font-size: 1.15rem;
            width: 150px;
            height: 50px;
            border-radius: 8px;
            font-weight: 600;
            text-align: center;
            box-shadow: none;
            transition: background 0.2s;
            display: inline-block;
            vertical-align: middle;
        }

            .btn-signup:hover {
                background-color: #e9b72f !important;
            }


        .input-group-text {
            background: #f8f9fa;
        }

        .signup-container p.text-center.mt-3 {
            position: relative;
            z-index: 1;
            margin-bottom: 0;
        }

        .text-danger {
            display: block;
            min-height: 18px;
            margin-top: 4px;
            font-size: 0.875rem;
            line-height: 1.2;
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

        <div class="signup-container">
            <h3 class="text-center">Create Your Account</h3>
            <p class="text-center">"Join FoodMart and get groceries delivered to your door"</p>

            <!-- Full Name -->
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-person"></i></span>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="John Doe"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                    ControlToValidate="txtFullName"
                    ErrorMessage="* Full Name is required"
                    CssClass="text-danger"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Email -->
            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="you@example.com"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="* Email is required"
                    CssClass="text-danger"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="* Invalid email format"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    CssClass="text-danger"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <!-- Phone -->
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+91 9876543210"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                    ControlToValidate="txtPhone"
                    ErrorMessage="* Phone number is required"
                    CssClass="text-danger"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhone" runat="server"
                    ControlToValidate="txtPhone"
                    ErrorMessage="* Invalid phone number"
                    ValidationExpression="^[0-9]{10}$"
                    CssClass="text-danger"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label class="form-label">Password</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-lock"></i></span>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                        TextMode="Password" placeholder="********"></asp:TextBox>
                </div>

                <!-- Required Field Validator -->
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtPassword"
                    ErrorMessage="* Password is required"
                    CssClass="text-danger"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>

                <!-- Regular Expression Validator -->
                <asp:RegularExpressionValidator ID="revPassword" runat="server"
                    ControlToValidate="txtPassword"
                    ErrorMessage="* Password must be 6-8 characters and include a number & special character"
                    ValidationExpression="^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,8}$"
                    CssClass="text-danger"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>


            <!-- Confirm Password -->
            <div class="mb-3">
                <label class="form-label">Confirm Password</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="********"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                    ControlToValidate="txtConfirmPassword"
                    ErrorMessage="* Confirm password is required"
                    CssClass="text-danger"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvPassword" runat="server"
                    ControlToValidate="txtConfirmPassword"
                    ControlToCompare="txtPassword"
                    ErrorMessage="* Passwords do not match"
                    CssClass="text-danger"
                    Display="Dynamic"></asp:CompareValidator>
            </div>

            <!-- Terms -->
            <div class="form-check mb-3">
                <asp:CheckBox ID="chkTerms" runat="server" CssClass="form-check-input" />
                <label class="form-check-label" for="chkTerms">
                    I agree to the <a href="#">Terms & Conditions</a>
                </label>
            </div>

            <!-- Button -->
            <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-signup text-white" Text="Sign Up" OnClick="btnSignUp_Click" />

            <!-- Login Redirect -->
            <p class="text-center mt-3">Already have an account? <a href="login.aspx">Login</a></p>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script src="js/plugins.js"></script>
        <script src="js/script.js"></script>
    </form>
</body>
</html>

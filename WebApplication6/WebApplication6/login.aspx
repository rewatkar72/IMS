<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication6.login" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-ix0K1bjjvuj8aMfbqVr0teAsMjBLxvW7qOQuR6K2r4k3zU5j4RMIZtSL9vuK+0+5" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.1/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <!-- Custom CSS -->
    <style>
        /* Custom styles for login page */
        body {
            background-color: #f8f9fa; /* Light gray background */
            font-family: Arial, sans-serif; /* Set default font */
        }

        .navbar {
            /*background-color: #4b8ea3 !important;*/ /* Custom navbar color */
            background-image: linear-gradient(to bottom, #051937, #113453, #20506f, #346e89, #4b8ea3);
        }

        .navbar-brand {
            color: #ffffff !important; /* White color for navbar brand */
            font-weight: bold; /* Bold font weight */
        }

        .card {
            border: none; /* Remove border from card */
            border-radius: 10px; /* Add border radius to card */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow */
        }

        .card-body {
            padding: 40px; /* Increase padding */
        }

        .btn-primary {
            background-color: #346e89; /* Custom button color */
            border-color: #346e89; /* Custom button border color */
            color: #ffffff; /* White text color */
            font-weight: bold; /* Bold font weight */
            transition: all 0.3s ease; /* Add transition for smoother hover effect */
        }

        .btn-primary:hover {
            background-color: #20506f; /* Darker button color on hover */
            border-color: #20506f; /* Darker button border color on hover */
        }

        .btn-forgot-password {
            color: #346e89; /* Custom color for forgot password link */
        }
    </style>
</head>
<body>
    <!-- Navigation bar -->
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container justify-content-center">
            <!-- Centered text with mail icon -->
            <a class="navbar-brand" href="login.aspx">
                <i class='fas fa-envelope' style='font-size:36px'></i>
                CubeMail
            </a> 
        </div>
    </nav>


    <!-- Login section -->
     <section class="vh-100">
    
         <div class="row align-items-center justify-content-center h-100">
             <div class="col-md-6">
                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
             </div>
             <div class="col-md-6">
                 <div class="row justify-content-center">
                     <div class="col-md-8 col-lg-7 col-xl-6">
                        <form id="loginForm" runat="server" method="post">
                             <div class="form-group">
                                 <label for="username">Username</label>
                                 <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox><br />
                             </div>
                             <div class="form-group">
                                 <label for="password">Password</label>
                                 <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox><br />
                             </div>
                             <div class="form-group">
                                 <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" Checked />
                                 <label class="form-check-label" for="chkRememberMe"> Remember me </label>
                             </div>
                             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" CssClass="btn btn-primary btn-lg btn-block" Width="105px" /><br />
                             <div class="form-group text-center">
                                 <br /><asp:HyperLink ID="myLink" runat="server" Text="Forgot password" NavigateUrl="~/PasswordRecovery.aspx"></asp:HyperLink>
                             </div>
                             <div class="form-group text-center">
                                 <asp:Label ID="errorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                             </div>
                             <div class="form-group text-center">
                                 <ul class="navbar-nav ms-auto">
                                     <li class="nav-item">
                                         <a class="nav-link" href="help.html">Help</a>
                                     </li>
                                 </ul>
                             </div>
                         </form>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </section>

    <!-- Bootstrap and jQuery JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.1/js/bootstrap.min.js"></script>

    <script>
        function btnLogin_Click() {
            var username = $("#username").val();
            var password = $("#password").val();

            // Replace with your actual validation and redirection logic
            if (username === "admin" && password === "password") {
                // Login successful
                window.location.href = "Home.aspx";
            } else {
                // Login failed
                $("#errorMessage").text("Invalid username or password.");
            }
        }
    </script>
</body>
</html>
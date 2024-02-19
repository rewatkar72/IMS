<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="WebApplication6.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>

    <hr>
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10 text-center center-block "><h1>User Profile</h1></div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <div class="text-center">
                    <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                    <h6>Upload a different photo...</h6>
                    <input type="file" class="text-center center-block file-upload">
                </div>
                <br />
            </div>
            <div class="col-sm-9">
                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <hr>
                        <form class="form" action="##" method="post" id="registrationForm">
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="first_name"><h4>First name</h4></label>
                                    <asp:TextBox ID="first_name" runat="server" CssClass="form-control" placeholder="first name" title="enter your first name if any."></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="last_name"><h4>Last name</h4></label>
                                    <asp:TextBox ID="last_name" runat="server" CssClass="form-control" placeholder="last name" title="enter your last name if any."></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="phone"><h4>Phone</h4></label>
                                    <asp:TextBox ID="phone" runat="server" CssClass="form-control" placeholder="enter phone" title="enter your phone number if any."></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="mobile"><h4>Mobile</h4></label>
                                    <asp:TextBox ID="mobile" runat="server" CssClass="form-control" placeholder="enter mobile number" title="enter your mobile number if any."></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6"> 
                                    <label for="email"><h4>Email</h4></label>
                                    <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="you@email.com" title="enter your email."></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="location"><h4>Location</h4></label>
                                    <asp:TextBox ID="location" runat="server" CssClass="form-control" placeholder="somewhere" title="enter a location"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="password"><h4>Password</h4></label>
                                    <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" placeholder="password" title="enter your password."></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="password2"><h4>Verify</h4></label>
                                    <asp:TextBox ID="password2" runat="server" CssClass="form-control" TextMode="Password" placeholder="password2" title="enter your password2."></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <br />
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-lg btn-success" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-lg" OnClientClick="return confirm('Are you sure you want to reset?');" />
                                </div>
                            </div>
                        </form>
                        <hr>
                    </div>
                    <div class="tab-pane" id="messages">
                        <h2></h2>
                        <hr>
                        <!-- Message Tab Content -->
                    </div>
                    <div class="tab-pane" id="settings">
                        <hr>
                        <!-- Settings Tab Content -->
                    </div>
                </div><!--/tab-content-->
            </div><!--/col-9-->
        </div><!--/row-->
    </div><!--/container-->
</asp:Content>

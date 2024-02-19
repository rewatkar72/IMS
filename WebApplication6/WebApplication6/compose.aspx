<%@ Page Title="Compose" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="compose.aspx.cs" Inherits="WebApplication6.compose" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom styles */
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .card-body {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-send {
            background-color: #28a745; /* Green background color */
            color: white; /* White text color */
            border: none;
            padding: 5px 10px; /* Adjust padding for smaller button */
            cursor: pointer;
            text-decoration: underline; /* Underline */
        }

        .btn-send:hover {
            background-color: #218838; /* Darker green background color on hover */
            color: white; /* White text color on hover */
        }

        .error-message {
            font-size: 14px;
        }

        /* Adjustments to prevent overflow */
        html, body {
            height: 100%;
        }

        .container {
            min-height: 100%;
            display: flex;
            flex-direction: column;
        }

        .card {
            flex: 1;
        }

        /* Styling for the title */
        .compose-title {
            text-align: center;
            /*font-style: italic;*/ /* Italic */
            text-decoration: underline; /* Underline */
            color: #28a745; /* Green color */
        }
    </style>

    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h3 class="compose-title">Compose Email</h3> <!-- Apply the compose-title class to the title -->
                <form>
                    <div class="form-row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="toEmail">To:</label>
                                <asp:TextBox ID="toEmail" runat="server" CssClass="form-control" placeholder="Enter recipient email"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="subject">Subject:</label>
                                <asp:TextBox ID="txtsubject" runat="server" CssClass="form-control" placeholder="Enter subject"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="toCC">CC:</label>
                                <asp:TextBox ID="toCC" runat="server" CssClass="form-control" placeholder="Enter recipient email"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="toBCC">BCC:</label>
                                <asp:TextBox ID="toBCC" runat="server" CssClass="form-control" placeholder="Enter recipient email"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="message">Message:</label>
                        <asp:TextBox ID="txtmessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Write your message here"></asp:TextBox>
                    </div>

                    <div class="form-group text-center">
                        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-send" Text="Send Mail" OnClick="btnSend_Click" />
                    </div>

                    <div class="form-group text-center">
                        <asp:Label ID="errorMessage" runat="server" Text="" CssClass="error-message" ForeColor="Red"></asp:Label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

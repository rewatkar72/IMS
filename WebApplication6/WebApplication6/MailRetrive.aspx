<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MailRetrive.aspx.cs" Inherits="WebApplication6.MailRetrive" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compose Email</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.1/css/bootstrap.min.css">
</head>--%>
<body>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.1/css/bootstrap.min.css">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">Mail</h3>
                        <form >

                             <div class="form-group text-center">
                                <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary btn-block" Text="Back" OnClick="btnBack_Click" />
                                </div>
                             <div class="form-group text-center">
                           <asp:Button ID="btnReply" runat="server" CssClass="btn btn-primary btn-block" Text="Reply" OnClick="btnReply_Click" />
                            </div>
                             <div class="form-group text-center">
                                 <asp:Button ID="btnforward" runat="server" CssClass="btn btn-primary btn-block" Text="Forward" OnClick="btnForward_Click" />
                        </div>
                             <div class="form-group">
                             <label for="toEmail">From:</label>
                                  <asp:TextBox ID="txtfromEmail" Enabled="false" runat="server" CssClass="form-control" placeholder="Enter recipient email" cols="50"></asp:TextBox>
                             </div>
                            <div class="form-group">
                                <label for="toEmail">To:</label>
                                <asp:TextBox ID="txttoEmail" Enabled="false" runat="server" CssClass="form-control" placeholder="Enter recipient email" cols="50"></asp:TextBox>
                            </div>

                             <div class="form-group">
     <label for="toCC">CC:</label>
     <asp:TextBox ID="txttoCC" runat="server" Enabled="false" CssClass="form-control" placeholder="Enter recipient email" cols="50"></asp:TextBox>
 </div>
                             <div class="form-group">
     <label for="toBCC">BCC:</label>
     <asp:TextBox ID="txttoBCC" runat="server" Enabled="false" CssClass="form-control" placeholder="Enter recipient email" cols="50"></asp:TextBox>
 </div>

                            <div class="form-group">
                                <label for="subject">Subject:</label>
                                <asp:TextBox ID="txtsubject" Enabled="false" runat="server" CssClass="form-control" placeholder="Enter subject"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="message">Message:</label>
                                <asp:TextBox ID="txtmessage" runat="server" Enabled="false" TextMode="MultiLine" Rows="20" Columns="20" CssClass="form-control" placeholder="Write your message here"></asp:TextBox>
                            </div>
                           
                            <div class="form-group text-center">
                                <asp:Label ID="errorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</asp:Content>
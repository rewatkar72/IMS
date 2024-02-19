﻿<%@ Page Title="Starred" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="starred.aspx.cs" Inherits="WebApplication6.starred" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        th.action {
            display: none;
        }

        /* CSS for row hover effect */
        tbody tr:hover {
            background-color: #f5f5f5; /* Change the background color as desired */
        }
    </style>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h3>Inbox</h3>
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>From</th>
                            <th>Subject</th>
                            <th>Date</th>
                            <th class="action">Action</th>
                        </tr>
                    </thead>
                    <tbody runat="server" id="mailsContainer">
                        <!-- Dynamic table rows will be added here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="SelectedMailId" runat="server" />
</asp:Content>
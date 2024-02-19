<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="WebApplication6.admin" %>

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
                <h3>Admin Portal</h3>
                <asp:LinkButton ID="myLinkButton" runat="server" Text="Employee Registration!" OnClick="OnClick" />
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>EmployeeID</th>
                            <th>Name</th>
                            <th>Number</th>
                             <th>Email</th>
                             <th>Gender</th>
                             <th>Occupation</th>
                             <th>DOB</th>
                             <th>Joining</th>
                             <th>Admin</th>
                             <th>Active</th>
                             <th>LastLogin</th>
                            <th class="action">Action</th>
                        </tr>
                    </thead>
                    <tbody runat="server" id="EmployeeContainer">
                        <!-- Dynamic table rows will be added here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="SelectedMailId" runat="server" />
</asp:Content>

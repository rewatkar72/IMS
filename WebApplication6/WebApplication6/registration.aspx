<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="WebApplication6.registration" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style></style>
    <div class="container">
        <h3 class="text-center mt-5 mb-4">Registration</h3>
        <div class="row justify-content-center">
            <!-- First Partition -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Account Information</h5>
                        
                        <div class="form-group">
                            <label for="TextBox2">Name</label>
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="TextBox3">Phone Number</label>
                            <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="TextBox4">Email</label>
                            <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="TextBox8">Password</label>
                            <asp:TextBox ID="TextBox8" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Second Partition -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Personal Information</h5>
                        <div class="form-group">
                            <label for="DropDownList1">Occupation</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                <asp:ListItem>--Select Here---</asp:ListItem>
                                <asp:ListItem>Human Resource</asp:ListItem>
                                <asp:ListItem>Development Operation</asp:ListItem>
                                <asp:ListItem>Finance</asp:ListItem>
                                <asp:ListItem>IT-HelpDesk</asp:ListItem>
                                <asp:ListItem>Software Tester</asp:ListItem>
                                <asp:ListItem>Manager</asp:ListItem>
                                <asp:ListItem>Software Developer</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="TextBox5">DOB</label>
                            <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>
                        </div><br /><br />
                        <div class="form-group">
                            <label for="RadioButtonList1">Gender</label>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-check-inline">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Third Partition -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Additional Information</h5>
                        <div class="form-group">
                            <label for="TextBox6">Joining Date</label>
                            <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="RadioButtonList2">Is Admin?</label>
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" CssClass="form-check-inline">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="form-group">
                            <label for="RadioButtonList3">IsActive?</label>
                            <asp:RadioButtonList ID="RadioButtonList3" runat="server" CssClass="form-check-inline">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="form-group">
                            <label for="TextBox7">Last Login</label>
                            <asp:TextBox ID="TextBox7" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-center mt-4">
           <!-- Submit Button -->
<div class="form-group text-center mt-4">
    <div class="col-md-12">
        <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" CssClass="btn btn-primary" />
    </div>
    <asp:Label ID="errorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
</div>

        </div>
    </div>
</asp:Content>

<%@ Page Title="Login" Language="vb" AutoEventWireup="false" MasterPageFile="~/Data/Login.Master" CodeBehind="A_Login.aspx.vb" Inherits="HRM.A_Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="list-group">
        <div class="list-group-item list-group-item-success" style="text-align: center">
            ĐĂNG NHẬP HỆ THỐNG QUẢN TRỊ
        </div>
        <div class="list-group-item">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Login ID="Login1" runat="server" TextLayout="TextOnTop" CssClass="col-md-12 col-sm-12 col-xs-12" Width="100%" TitleText="" RememberMeSet="True" PasswordLabelText="Mật Khẩu:" LoginButtonText="Đăng Nhập" RememberMeText="Ghi Nhớ." UserNameLabelText="Tài Khoản:">
                        <LoginButtonStyle CssClass="btn btn-block maureu" />
                        <TextBoxStyle CssClass="form-control input-sm" />
                    </asp:Login>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Default.aspx.vb" Inherits="HRM._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row well" style="margin-top: 75px;">
            <marquee>
        Chào mừng bạn đã đến với hệ thống thông tin quản lý doanh nghiệp trực tuyến.</marquee>
        <a href="/Login.aspx" class="btn btn-lg btn-warning">Trang Quản Lý Nhân Sự</a>
        <a href="/Data/Admin/A_Login.aspx" class="btn btn-lg btn-success">Trang Admin</a>
        <a href="/Data/STAFF/staffLogin.aspx" class="btn btn-lg btn-info">Trang Nhân Viên</a>
    </div>
</asp:Content>

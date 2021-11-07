<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../Login.Master" CodeBehind="staffLogin.aspx.vb" Inherits="HRM.staffLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    <style type="text/css">
       
    </style>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            HỆ THỐNG QUẢN LÝ NHÂN SỰ TRỰC TUYẾN
        </div>
        <div class="list-group-item">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Login ID="Login1" runat="server" TextLayout="TextOnTop" CssClass="col-md-12 col-sm-12 col-xs-12" Width="100%" TitleText="" RememberMeSet="True" PasswordLabelText="Mật Khẩu:" LoginButtonText="Đăng Nhập" RememberMeText="Ghi Nhớ." UserNameLabelText="Tài Khoản:">
                        <LoginButtonStyle CssClass="btn btn-sm btn-primary btn-block" />
                        <TextBoxStyle CssClass="form-control input-sm" />
                    </asp:Login>
                </div>
            </div>
        </div>        
    </div>
</asp:Content>

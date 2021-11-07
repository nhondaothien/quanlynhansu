<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="./Data/Login.Master" CodeBehind="Login.aspx.vb" Inherits="HRM.Login" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success" style="text-align: center">
            QUẢN LÝ NHÂN SỰ CÔNG TY
        </div>
        <div class="list-group-item">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Login ID="Login1" runat="server" TextLayout="TextOnTop" CssClass="col-md-12 col-sm-12 col-xs-12" Width="100%" TitleText="" RememberMeSet="True" PasswordLabelText="Mật Khẩu:" LoginButtonText="Đăng Nhập" RememberMeText="Ghi Nhớ." UserNameLabelText="Tài Khoản:">
                        <LoginButtonStyle CssClass="btn btn-block mauxanh" />
                        <TextBoxStyle CssClass="form-control input-sm" />
                    </asp:Login>
                </div>
            </div>
        </div>
        <div class="list-group-item">
            <a href="#myModal" role="button" class="btn btn-block maureu" data-toggle="modal"><i class="fe-flag"></i> Công Ty</a>
        </div>
    </div>

    <div class="row">
        <div id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Công Ty</h4>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Công Ty:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="ddlMaCongTy" runat="server" DataSourceID="SqlDataSource1" DataTextField="TenCongTy" DataValueField="MaCongTy">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-9">
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn mauxam" data-dismiss="modal"> Đóng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT [MaCongTy], [TenCongTy] FROM [hr_CongTy]"></asp:SqlDataSource>
    </div>

</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrM07_DaoTao.aspx.vb" Inherits="HRM.hrM07_DaoTao" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            QUẢN LÝ QUÁ TRÌNH ĐÀO TẠO
        </div>

        <div class="list-group-item">
            <table class="table table-responsive">
                <tr>
                    <td>Phân Loại:</td>
                    <td>
                        <asp:DropDownList ID="cbSearch" runat="server">
                            <asp:ListItem Value="1" Selected="True">Mã Yêu Cầu</asp:ListItem>
                            <asp:ListItem Value="2">Nội Dung</asp:ListItem>
                            <asp:ListItem Value="3">Tên Khóa Học</asp:ListItem>
                            <asp:ListItem Value="4">Địa Điểm</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập từ khóa cần tìm."></asp:TextBox>
                    </td>
                    <td>
                        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn mauxanh"><i class="remixicon-file-search-line"></i> Tìm Kiếm</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
        <div class="list-group-item document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gv_DaoTao" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1_DaoTao" Width="1200px" DataKeyNames="MaYeuCau">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-xs maureu" CausesValidation="False" CommandName="Select" Text='<i class="glyphicon glyphicon-list"></i>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MaYeuCau" HeaderText="Mã Yêu Cầu" SortExpression="MaYeuCau" ReadOnly="True" />
                            <asp:BoundField DataField="NoiDungDaoTao" HeaderText="Nội Dung Đào Tạo" SortExpression="NoiDungDaoTao" />
                            <asp:BoundField DataField="TenKhoaHoc" HeaderText="Tên Khóa Học" SortExpression="TenKhoaHoc" />
                            <asp:BoundField DataField="DonViToChuc" HeaderText="Đơn Vị Tổ Chức" SortExpression="DonViToChuc"></asp:BoundField>
                            <asp:BoundField DataField="ThoiGian" HeaderText="Thời Gian" SortExpression="ThoiGian" />
                            <asp:BoundField DataField="ChiPhiDuKien" HeaderText="Chi Phí Dự Kiến" SortExpression="ChiPhiDuKien" />
                            <asp:BoundField DataField="DiaDiem" HeaderText="Địa Điểm" SortExpression="DiaDiem" />
                            <asp:BoundField DataField="DonVi" HeaderText="Đơn Vị" SortExpression="DonVi" />
                        </Columns>
                        <PagerSettings PageButtonCount="20" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1_DaoTao" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT hr_YeuCauDaoTao.MaYeuCau, hr_YeuCauDaoTao.NoiDungDaoTao, hr_YeuCauDaoTao.TenKhoaHoc, hr_YeuCauDaoTao.DonViToChuc, hr_YeuCauDaoTao.ThoiGian, hr_YeuCauDaoTao.ChiPhiDuKien, hr_YeuCauDaoTao.DiaDiem, hr_YeuCauDaoTao.DonVi, hr_ChiNhanh.MaCongTy FROM hr_YeuCauDaoTao INNER JOIN hr_ChiNhanh ON hr_YeuCauDaoTao.MaChiNhanh = hr_ChiNhanh.MaChiNhanh WHERE (hr_ChiNhanh.MaCongTy = @MaCongTy)">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrM09_HopDongLaoDong.aspx.vb" Inherits="HRM.hrM09_HopDongLaoDong" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            QUẢN LÝ HỢP ĐỒNG LAO ĐỘNG
        </div>

        <div class="list-group-item">
            <div class="form-horizontal" role="form">
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Phân Loại:" CssClass="col-md-2 control-label"></asp:Label>
                    <div class="col-md-2">
                        <asp:DropDownList ID="cbSearch" runat="server">
                            <asp:ListItem Value="1">Mã Hợp Đồng</asp:ListItem>
                            <asp:ListItem Value="2">Số Hợp Đồng</asp:ListItem>
                            <asp:ListItem Value="3">Mã Nhân Viên</asp:ListItem>
                            <asp:ListItem Value="4" Selected="True">Họ Tên</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập từ khóa cần tìm."></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn mauxanh"><i class="remixicon-file-search-line"></i> Tìm Kiếm</asp:LinkButton>
                    </div>
                    <div class="col-md-2">
                        <asp:LinkButton ID="btnRefesh" runat="server" CssClass="btn maureu"><i class="mdi mdi-refresh"></i> Refresh</asp:LinkButton>

                    </div>
                </div>
            </div>
        </div>

        <div class="list-group-item document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gv_HopDongLaoDong" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1_HopDongLaoDong" Width="100%">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-xs maureu" CausesValidation="False" CommandName="Select" Text='<i class="fe-list"></i>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MaHopDong" HeaderText="Mã Hợp Đồng" SortExpression="MaHopDong"></asp:BoundField>
                            <asp:BoundField DataField="SoHopDong" HeaderText="Số Hợp Đồng" SortExpression="SoHopDong"></asp:BoundField>
                            <asp:BoundField DataField="TenHopDong" HeaderText="Tên Hợp Đồng" SortExpression="TenHopDong" />
                            <asp:BoundField DataField="MaNhanVien" HeaderText="Mã N.Viên" SortExpression="MaNhanVien"></asp:BoundField>
                            <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" ReadOnly="True" SortExpression="HoTen"></asp:BoundField>
                            <asp:BoundField DataField="TuNgay" HeaderText="Từ Ngày" SortExpression="TuNgay" DataFormatString="{0:MM/dd/yyyy}"></asp:BoundField>
                            <asp:BoundField DataField="DenNgay" HeaderText="Đến Ngày" SortExpression="DenNgay" DataFormatString="{0:MM/dd/yyyy}"></asp:BoundField>
                        </Columns>
                        <PagerSettings PageButtonCount="20" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1_HopDongLaoDong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaNhanVien, HoTen, MaHopDong, SoHopDong, TenHopDong, TuNgay, DenNgay, MaCongTy FROM vhr_HopDongLaoDong WHERE (MaCongTy = @MaCongTy) ORDER BY TuNgay DESC">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

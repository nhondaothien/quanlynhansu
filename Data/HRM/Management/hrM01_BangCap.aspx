<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrM01_BangCap.aspx.vb" Inherits="HRM.hrM01_BangCap" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            QUẢN LÝ BẰNG CẤP
        </div>

        <div class="list-group-item">
            <div class="form-horizontal" role="form">
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Phân Loại:" CssClass="col-md-2 control-label"></asp:Label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="cbSearch" runat="server">
                            <asp:ListItem Selected="True" Value="1">Số Bằng</asp:ListItem>
                            <asp:ListItem Value="2">Tên Bằng</asp:ListItem>
                            <asp:ListItem Value="3">Loại Bằng</asp:ListItem>
                            <asp:ListItem Value="4">Họ Tên</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập từ khóa cần tìm."></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-sm btn-primary"><i class="remixicon-file-search-line"></i> Tìm Kiếm</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-group-item document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gv_BangCap" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1_BangCap" Width="100%" DataKeyNames="MaLoai,MaNhanVien,MaBang">
                        <Columns>
                            <asp:TemplateField HeaderText="Số Bằng" SortExpression="SoBang">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Bind("SoBang") %>' NavigateUrl='<%# Bind("DinhKem") %>' Target="_blank"></asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="120px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenBang" HeaderText="Tên Bằng" SortExpression="TenBang" />
                            <asp:BoundField DataField="NgayCap" HeaderText="Ngày Cấp" SortExpression="NgayCap" DataFormatString="{0:MM/dd/yyyy}">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DonViCap" HeaderText="Đơn Vị Cấp" SortExpression="DonViCap">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MaNhanVien" HeaderText="Mã N.Viên" ReadOnly="True" SortExpression="MaNhanVien">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" ReadOnly="True" SortExpression="HoTen">
                                <ItemStyle Width="180px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LoaiBangCap" HeaderText="Loại Bằng" SortExpression="LoaiBangCap">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                        </Columns>
                        <PagerSettings PageButtonCount="20" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1_BangCap" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaLoai, LoaiBangCap, MaNhanVien, HoLot, Ten, HoTen, MaBang, SoBang, TenBang, NgayCap, DonViCap, DinhKem, TenBoPhan, MaChiNhanh, ChiNhanh, MaCongTy FROM vhr_BangCap WHERE (MaCongTy = @MaCongTy)">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

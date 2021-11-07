<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrM03_ChungChi.aspx.vb" Inherits="HRM.hrM03_ChungChi" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            QUẢN LÝ CHỨNG CHỈ
        </div>

        <div class="list-group-item">
            <div class="form-horizontal" role="form">
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Phân Loại:" CssClass="col-md-2 control-label"></asp:Label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="cbSearch" runat="server">
                            <asp:ListItem Selected="True" Value="1">Số Chứng Chỉ</asp:ListItem>
                            <asp:ListItem Value="2">Tên Chứng Chỉ</asp:ListItem>
                            <asp:ListItem Value="3">Loại Chứng Chỉ</asp:ListItem>
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
                    <asp:GridView ID="gv_ChungChi" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_ChungChi" Width="1500px" DataKeyNames="MaNhanVien,MaLoai,MaChungChi,MaBoPhan,MaChiNhanh">
                        <Columns>
                            <asp:TemplateField HeaderText="Số Chứng Chỉ" SortExpression="SoChungChi">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SoChungChi") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("DinhKem") %>' Target="_blank" Text='<%# Bind("SoChungChi") %>'></asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="120px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenChungChi" HeaderText="Tên Chứng Chỉ" SortExpression="TenChungChi">
                                <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CapBac" HeaderText="Bậc" SortExpression="CapBac">
                                <ItemStyle Width="75px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NgayCap" HeaderText="Ngày Cấp" SortExpression="NgayCap" DataFormatString="{0:MM/dd/yyyy}">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThoiHan" HeaderText="Thời Hạn" SortExpression="ThoiHan" DataFormatString="{0:MM/dd/yyyy}">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MaNhanVien" HeaderText="Mã N.Viên" ReadOnly="True" SortExpression="MaNhanVien">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" SortExpression="HoTen" ReadOnly="True">
                                <ItemStyle Width="180px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LoaiChungChi" HeaderText="Loại Chứng Chỉ" SortExpression="LoaiChungChi">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DonViCap" HeaderText="Đơn Vị Cấp" SortExpression="DonViCap">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />
                        </Columns>
                        <PagerSettings PageButtonCount="20" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource_ChungChi" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaNhanVien, HoLot, Ten, HoTen, NgaySinh, MaLoai, LoaiChungChi, MaChungChi, SoChungChi, TenChungChi, CapBac, NgayCap, ThoiHan, DonViCap, GhiChu, DinhKem, MaBoPhan, TenBoPhan, MaChiNhanh, ChiNhanh, MaCongTy FROM vhr_ChungChi WHERE (MaCongTy = @MaCongTy)">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

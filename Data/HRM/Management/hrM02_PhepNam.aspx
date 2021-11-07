<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrM02_PhepNam.aspx.vb" Inherits="HRM.hrM02_PhepNam" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            QUẢN LÝ PHÉP NĂM
        </div>

        <div class="list-group-item">
            <div class="form-horizontal" role="form">
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Nhân Viên:" CssClass="col-md-2 control-label"></asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="cbNhanVien" runat="server" DataSourceID="SqlDataSource2_NhanSu" DataTextField="HoTen" DataValueField="MaNhanVien" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-group-item document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gv_PhepNam" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1_PhepNam" Width="100%" DataKeyNames="MaPhepNam">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-xs maureu" CausesValidation="False" CommandName="Select" Text='<i class="fe-list"></i>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MaPhepNam" HeaderText="Mã Phép" SortExpression="MaPhepNam" InsertVisible="False" ReadOnly="True">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NgayXinPhep" HeaderText="Ngày Xin" SortExpression="NgayXinPhep" DataFormatString="{0:MM/dd/yyyy}">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LyDoNghi" HeaderText="Lý Do Nghỉ" SortExpression="LyDoNghi"></asp:BoundField>
                            <asp:BoundField DataField="BanGiao" HeaderText="Bàn Giao" SortExpression="BanGiao"></asp:BoundField>
                            <asp:BoundField DataField="LienLac" HeaderText="Liên Lạc" SortExpression="LienLac"></asp:BoundField>
                        </Columns>
                        <PagerSettings PageButtonCount="20" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1_PhepNam" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaPhepNam, NgayXinPhep, LyDoNghi, BanGiao, LienLac FROM hr_PhepNam WHERE (MaNhanVien = @MaNhanVien) ORDER BY NgayXinPhep">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbNhanVien" Name="MaNhanVien" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2_NhanSu" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT hr_NhanVien.MaNhanVien, hr_NhanVien.MaNhanVien + '_' + hr_NhanVien.HoLot + ' ' + hr_NhanVien.Ten AS HoTen, hr_ChiNhanh.MaCongTy FROM hr_NhanVien INNER JOIN hr_BoPhanLamViec ON hr_NhanVien.BoPhanLamViecID = hr_BoPhanLamViec.MaBoPhan INNER JOIN hr_ChiNhanh ON hr_BoPhanLamViec.MaChiNhanh = hr_ChiNhanh.MaChiNhanh WHERE (hr_ChiNhanh.MaCongTy = @MaCongTy)">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

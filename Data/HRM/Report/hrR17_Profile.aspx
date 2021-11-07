<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrR17_Profile.aspx.vb" Inherits="HRM.hrR17_Profile" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
     
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            LÝ LỊCH NHÂN SỰ
        </div>

        <div class="list-group-item">
            <div class="form-horizontal" role="form">
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Nhân Viên:" CssClass="col-md-2 control-label"></asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="cbNhanVien" runat="server" DataSourceID="SqlDataSource1" DataTextField="HoTen" DataValueField="MaNhanVien">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT hr_NhanVien.MaNhanVien, hr_NhanVien.MaNhanVien + '_' + hr_NhanVien.HoLot + ' ' + hr_NhanVien.Ten AS HoTen FROM hr_NhanVien INNER JOIN hr_BoPhanLamViec ON hr_NhanVien.BoPhanLamViecID = hr_BoPhanLamViec.MaBoPhan INNER JOIN hr_ChiNhanh ON hr_BoPhanLamViec.MaChiNhanh = hr_ChiNhanh.MaChiNhanh WHERE (hr_ChiNhanh.MaCongTy = @MaCongTy)">
                            <SelectParameters>
                                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>

        <div class="list-group-item" style="height: 1500px">
            <rsweb:ReportViewer ID="rpvReport" runat="server" Height="100%" Width="1011" BackColor="LightBlue"
                BorderColor="LightBlue" InternalBorderColor="DarkGray" SplitterBackColor="LightPink" ToolBarItemBorderColor="LightBlue" ToolBarItemHoverBackColor="LightGreen">
                <LocalReport ReportPath="Report\HRM\hrR17_Profile.rdlc" EnableExternalImages="True"></LocalReport>
                <LocalReport ReportEmbeddedResource="HRM.hrR17_Profile.rdlc" EnableExternalImages="True">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsProfile" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataByMaNhanVien" TypeName="HRM.dsHRMTableAdapters.vhr_NhanSuTableAdapter" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbNhanVien" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

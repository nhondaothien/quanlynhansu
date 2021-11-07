<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrR14_NgayVaoLamViec.aspx.vb" Inherits="HRM.hrR14_NgayVaoLamViec" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
       
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            DANH SÁCH NHÂN SỰ MỚI VÀO LÀM VIỆC
        </div>

        <div class="list-group-item">
            <div class="form-horizontal" role="form">
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Từ Ngày:" CssClass="col-md-2 control-label"></asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtTuNgay" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="Đến Ngày:" CssClass="col-md-2 control-label"></asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtDenNgay" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-group-item" style="height: 1000px">
            <rsweb:ReportViewer ID="rpvReport" runat="server" Height="100%" Width="1011" BackColor="LightBlue"
                BorderColor="LightBlue" InternalBorderColor="DarkGray" SplitterBackColor="LightPink" ToolBarItemBorderColor="LightBlue" ToolBarItemHoverBackColor="LightGreen">
                <LocalReport ReportPath="Report\HRM\hrR15_NgayVaoLamViec.rdlc" ReportEmbeddedResource="HRM.hrR15_NgayVaoLamViec.rdlc" EnableExternalImages="True">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="R_NgayVaoLamViec" />
                    </DataSources>
                </LocalReport>


            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataByMaChiNhanhVaNgayVaoLamViec" TypeName="HRM.dsHRMTableAdapters.vhr_NhanSuTableAdapter" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:SessionParameter Name="MaChiNhanh" SessionField="MaChiNhanh" Type="String" />
                    <asp:ControlParameter ControlID="txtTuNgay" Name="TuNgay" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtDenNgay" Name="DenNgay" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

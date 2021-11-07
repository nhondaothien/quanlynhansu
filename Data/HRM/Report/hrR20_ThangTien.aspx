<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrR20_ThangTien.aspx.vb" Inherits="HRM.hrR20_ThangTien" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            DANH SÁCH QUÁ TRÌNH THĂNG TIẾN
        </div>

        <div class="list-group-item" style="height: 1000px">
            <rsweb:ReportViewer ID="rpvReport" runat="server" Height="100%" Width="1011" BackColor="LightBlue"
                BorderColor="LightBlue" InternalBorderColor="DarkGray" SplitterBackColor="LightPink" ToolBarItemBorderColor="LightBlue" ToolBarItemHoverBackColor="LightGreen">
                <LocalReport ReportPath="Report\HRM\hrR20_ThangTien.rdlc" ReportEmbeddedResource="HRM.hrR20_ThangTien.rdlc" EnableExternalImages="True">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsThangTien" />
                    </DataSources>
                </LocalReport>

            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataByMaCongTy" TypeName="HRM.dsHRMTableAdapters.vhr_ThangTienTableAdapter" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>

</asp:Content>

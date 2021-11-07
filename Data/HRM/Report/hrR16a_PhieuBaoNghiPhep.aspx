<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrR16a_PhieuBaoNghiPhep.aspx.vb" Inherits="HRM.hrR16a_PhieuBaoNghiPhep" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            PHIẾU BÁO NGHỈ PHÉP
        </div>

        <div class="list-group-item" style="height: 1000px">
            <rsweb:ReportViewer ID="rpvReport" runat="server" Height="100%" Width="1011" BackColor="LightBlue"
                BorderColor="LightBlue" InternalBorderColor="DarkGray" SplitterBackColor="LightPink" ToolBarItemBorderColor="LightBlue" ToolBarItemHoverBackColor="LightGreen">
                <LocalReport ReportPath="Report\HRM\hrR16a_PhieuBaoNghiPhep.rdlc" ReportEmbeddedResource="HRM.hrR16a_PhieuBaoNghiPhep.rdlc" EnableExternalImages="True">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsPhieuBaoNghiPhep" />
                    </DataSources>
                </LocalReport>

            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataByMaPhepNam" TypeName="HRM.dsHRMTableAdapters.vhr_PhepNamTableAdapter" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:SessionParameter Name="MaPhepNam" SessionField="MaPhepNam1" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <div class="row">
    </div>
</asp:Content>

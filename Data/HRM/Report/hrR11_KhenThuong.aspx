<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrR11_KhenThuong.aspx.vb" Inherits="HRM.R_KhenThuong" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            DANH SÁCH QUÁ TRÌNH KHEN THƯỞNG
        </div>
        <div class="list-group-item" style="height: 1000px">
            <rsweb:ReportViewer ID="rpvReport" runat="server" Height="100%" Width="1011" BackColor="LightBlue"
                BorderColor="LightBlue" InternalBorderColor="DarkGray" SplitterBackColor="LightPink" ToolBarItemBorderColor="LightBlue" ToolBarItemHoverBackColor="LightGreen">
                <LocalReport
                    ReportPath="Report\HRM\hrR11_KhenThuong.rdlc" ReportEmbeddedResource="HRM.hrR11_KhenThuong.rdlc" EnableExternalImages="True">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsKhenThuong" />
                    </DataSources>
                </LocalReport>

            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataByMaCongTy" TypeName="HRM.dsHRMTableAdapters.vhr_KhenThuongTableAdapter" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

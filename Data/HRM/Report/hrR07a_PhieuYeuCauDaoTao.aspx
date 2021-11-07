<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrR07a_PhieuYeuCauDaoTao.aspx.vb" Inherits="HRM.hrR07a_PhieuYeuCauDaoTao" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            PHIẾU YÊU CẦU ĐÀO TẠO
        </div>

        <div class="list-group-item" style="height: 1000px">
            <rsweb:ReportViewer ID="rpvReport" runat="server" Height="100%" Width="1011" BackColor="LightBlue"
                BorderColor="LightBlue" InternalBorderColor="DarkGray" SplitterBackColor="LightPink" ToolBarItemBorderColor="LightBlue" ToolBarItemHoverBackColor="LightGreen">
                <LocalReport ReportPath="Report\HRM\hrR07a_PhieuYeuCauDaoTao.rdlc" ReportEmbeddedResource="HRM.hrR07a_PhieuYeuCauDaoTao.rdlc" EnableExternalImages="True">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="hrR07a_PhieuYeuCauDaoTao" />
                    </DataSources>
                </LocalReport>

            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataByMaYeuCau" TypeName="HRM.dsHRMTableAdapters.vhr_DaoTaoTableAdapter" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:SessionParameter Name="MaYeuCau" SessionField="MaYeuCauDaoTao1" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

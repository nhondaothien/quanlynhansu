<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrR02_ChamCong.aspx.vb" Inherits="HRM.hrR02_ChamCong" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
            
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            BẢNG CHẤM CÔNG
        </div>

        <div class="list-group-item">
            <table class="table table-responsive">
                <tr>
                    <td>
                        Mã Nhân Viên:
                    </td>
                    <td>
                        <asp:Label ID="lblMaNhanVien" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Từ Ngày:
                    </td>
                    <td>
                        <asp:TextBox ID="txtTuNgay" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Đến Ngày:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDenNgay" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="list-group-item" style="height: 1000px">
            <rsweb:ReportViewer ID="rpvReport" runat="server" Height="100%" Width="1011" BackColor="LightBlue"
                BorderColor="LightBlue" InternalBorderColor="DarkGray" SplitterBackColor="LightPink" ToolBarItemBorderColor="LightBlue" ToolBarItemHoverBackColor="LightGreen">
                <LocalReport ReportPath="Report\HRM\hrR02_ChamCong.rdlc" ReportEmbeddedResource="HRM.hrR02_ChamCong.rdlc" EnableExternalImages="True">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="R_ChamCong" />
                    </DataSources>
                </LocalReport>

            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataByMaNhanVienvaNgayCong" TypeName="HRM.dsHRMTableAdapters.vhr_ChamCongTableAdapter" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
                    <asp:ControlParameter ControlID="txtTuNgay" Name="TuNgay" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtDenNgay" Name="DenNgay" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>

    </asp:Content>


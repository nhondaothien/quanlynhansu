<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrR23_TongHopTienLuong.aspx.vb" Inherits="HRM.hrR23_TongHopTienLuong" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
      
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            TỔNG HỢP TIỀN LƯƠNG
        </div>
        
        <div class="list-group-item" style="height: 1000px">
            <table class="table table-responsive">
                <tr>
                    <td>Tháng:</td>
                    <td>
                        <asp:DropDownList ID="ddlThang" runat="server">
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>Năm:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlNam" runat="server">
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2016</asp:ListItem>
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem>2025</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <rsweb:ReportViewer ID="rpvReport" runat="server" Height="100%" Width="1011" BackColor="LightBlue"
                BorderColor="LightBlue" InternalBorderColor="DarkGray" SplitterBackColor="LightPink" ToolBarItemBorderColor="LightBlue" ToolBarItemHoverBackColor="LightGreen">                <LocalReport ReportPath="Report\HRM\hrR23_TongHopTienLuong.rdlc" ReportEmbeddedResource="HRM.hrR23_TongHopTienLuong.rdlc" EnableExternalImages="True">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="R_TongHopTienLuong" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataByMaCongTyThangNam" TypeName="HRM.dsHRMTableAdapters.vhr_TienLuongTableAdapter" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" Type="String" />
                    <asp:ControlParameter ControlID="ddlThang" Name="Thang" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ddlNam" Name="Nam" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

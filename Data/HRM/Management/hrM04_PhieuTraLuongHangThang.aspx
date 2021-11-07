<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrM04_PhieuTraLuongHangThang.aspx.vb" Inherits="HRM.hrM04_PhieuTraLuongHangThang" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
     </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item list-group-item-success">
            QUẢN LÝ PHIẾU TRẢ LƯƠNG
        </div>

        <div class="list-group-item document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gv_PhieuTraLuong" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1_TienLuong" Width="100%" DataKeyNames="MaLuong">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-xs maureu" CausesValidation="False" CommandName="Select" Text='<i class="fe-list"></i>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MaLuong" HeaderText="MaLuong" SortExpression="MaLuong" InsertVisible="False" ReadOnly="True">
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Ngay" SortExpression="Ngay">
                            </asp:BoundField>
                        </Columns>
                        <PagerSettings PageButtonCount="20" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1_TienLuong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT [MaLuong], [Ngay] FROM [hr_Luong]">
        </asp:SqlDataSource>
    </div>
</asp:Content>


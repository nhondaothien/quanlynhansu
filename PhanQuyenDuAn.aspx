<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/HRM.Master" CodeBehind="PhanQuyenDuAn.aspx.vb" Inherits="HRM.PhanQuyenDuAn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="list-group margin-top70">
        <div class="list-group-item list-group-item-success">
            PHÂN QUYỀN
        </div>

        <div class="list-group-item">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>                    
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaDuAn">
                        <Columns>
                            <asp:ButtonField CommandName="selectRecord" ButtonType="Link" Text='<i class="mdi mdi-skip-next-circle"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs mauxanh"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaDuAn" HeaderText="Mã Dự Án" SortExpression="MaDuAn" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="TenDuAn" HeaderText="Tên Dự Án" SortExpression="TenDuAn" />
                            <asp:BoundField DataField="pms" HeaderText="Quyền" SortExpression="pms"/>                           
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [v00_PhanQuyenDuAn] WHERE ([MaCongTy] = @MaCongTy)">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

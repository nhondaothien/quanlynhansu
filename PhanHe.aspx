<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="PhanHe.aspx.vb" Inherits="HRM.PhanHe" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="list-group margin-top70">
        <div class="list-group-item list-group-item-success">
            PHÂN HỆ   
        </div>

        <div class="list-group-item">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>                    
                    <asp:GridView ID="GridView1" CssClass="table table-condensed" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaPhanHe">
                        <Columns>
                            <asp:ButtonField CommandName="selectRecord" ButtonType="Link" Text='<i class="remixicon-briefcase-line"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs mauxanh" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaPhanHe" HeaderText="Mã Phân hệ" SortExpression="MaPhanHe" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="TenPhanHe" HeaderText="Tên Phân hệ" SortExpression="TenPhanHe" />
                            <asp:BoundField DataField="Quyen" HeaderText="Quyền" SortExpression="Quyen"/>
                            <asp:BoundField DataField="MaCongTy" HeaderText="Mã Công Ty" SortExpression="MaCongTy" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT [MaPhanHe], [TenPhanHe], [Quyen], [MaCongTy] FROM [v00_PhanQuyenCongTy] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:SessionParameter Name="Email" SessionField="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

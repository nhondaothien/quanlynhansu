<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU26_NhanSuDuAn.aspx.vb" Inherits="HRM.hrU26_NhanSuDuAn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT NHÂN SỰ THAM GIA DỰ ÁN
        </div>
        <div class="list-group-item">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table class="table">
                        <tr>
                            <td>Mã Nhân Viên:</td>
                            <td>
                                <asp:Label ID="lblMaNhanVien" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click" CausesValidation="False"><i class="fe-plus-square"></i> Thêm Mới</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaSo" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="selectRecord" ButtonType="Link" HeaderText="Chọn" Text='<i class="fe-list"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maureu" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs mauvang" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maudo" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaSo" HeaderText="Mã Số" SortExpression="MaSo" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="MaDuAn" HeaderText="Mã Dự Án" SortExpression="MaDuAn" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="row">
        <%--Start Add--%>
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Thêm Mới</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upAdd" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <%--[MaNhanVien], [MaDuAn]--%>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Dự Án: (*)</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaDuAn" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenDuAn" DataValueField="MaDuAn"></asp:DropDownList>
                                        </td>
                                    </tr>                                                               
                                </table>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><i class="fe-save"></i> Lưu</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Đóng</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddRecord" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%--End Add--%>

        <%--Start Edit--%>
        <div id="editModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Sửa</h4>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Mã Số: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtMaSo1" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Dự Án: (*)</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaDuAn1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenDuAn" DataValueField="MaDuAn"></asp:DropDownList>
                                        </td>
                                    </tr>                                                               
                                </table>
                                <div class="modal-footer">
                        <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                        <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><i class="fe-save"></i> Cập nhật</asp:LinkButton>
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Đóng</button>
                    </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <%--End Edit--%>

        <%--Start Delete--%>
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upDel" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <table>
                                    <tr>
                                        <td>Bạn có chắc xóa dữ liệu này?
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="hfCode" runat="server" />
                            </div>
                            <div class="modal-footer">
                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn maudo" OnClick="btnDelete_Click"><i class="fe-trash-2"></i> Xóa</asp:LinkButton>
                            <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Hủy</button>
                        </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%--End Delete--%>
    </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [dts00_ChiTietNhanSuDuAn] WHERE ([MaNhanVien] = @MaNhanVien)"
            InsertCommand="INSERT INTO [dts00_ChiTietNhanSuDuAn] ([MaNhanVien], [MaDuAn]) VALUES (@MaNhanVien, @MaDuAn)"
            UpdateCommand="UPDATE [dts00_ChiTietNhanSuDuAn] SET [MaNhanVien] = @MaNhanVien, [MaDuAn] = @MaDuAn WHERE [MaSo] = @MaSo"
            DeleteCommand="DELETE FROM [dts00_ChiTietNhanSuDuAn] WHERE [MaSo] = @MaSo">
            <DeleteParameters>
                <asp:Parameter Name="MaSo" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="MaDuAn" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="MaDuAn" Type="String" />
                <asp:Parameter Name="MaSo" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT dts00_DuAn.MaDuAn, dts00_DuAn.MaDuAn + N'_' + dts00_DuAn.TenDuAn AS TenDuAn FROM dts00_DuAn INNER JOIN mkt_KhachHang ON dts00_DuAn.MaKhachHang = mkt_KhachHang.MaKhachHang WHERE (mkt_KhachHang.MaCongTy = @MaCongTy)">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

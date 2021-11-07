<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU11_ThangTien.aspx.vb" Inherits="HRM.hrU11_ThangTien" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT THĂNG TIẾN
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
                                 <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" ToolTip="Thêm mới" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" DataSourceID="SqlDataSource1" DataKeyNames="MaThangTien" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaThangTien" HeaderText="Mã Thăng Tiến" SortExpression="MaThangTien" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="MaChucVu" HeaderText="Mã Chức Vụ" SortExpression="MaChucVu" />
                            <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay" />
                            <asp:BoundField DataField="DinhKem" HeaderText="Đính Kèm" SortExpression="DinhKem" />
                            <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" SortExpression="NoiDung" />
                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />
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
                                <%--[MaChucVu], [Ngay], [DinhKem], [NoiDung], [GhiChu]--%>
                                <table class="table table-responsive margin-top20">
                                    <tr>
                                        <td>Mã Chức Vụ:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaChucVu" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenChucVu" DataValueField="MaChucVu"></asp:DropDownList>                                        

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgay" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgay_CalendarExtender" TargetControlID="txtNgay" ID="txtNgay_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Đính Kèm:</td>
                                        <td>
                                           <asp:TextBox ID="txtDinhKem" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>                                    
                                    <tr>
                                        <td>Nội Dung:</td>
                                        <td>
                                           <asp:TextBox ID="txtNoiDung" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Ghi Chú:</td>
                                        <td>
                                           <asp:TextBox ID="txtGhiChu" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>                                                             
                                </table>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><i class="fe-save"></i> Lưu</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Đóng</button>
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
                               <%--[MaChucVu], [Ngay], [DinhKem], [NoiDung], [GhiChu]--%>
                                <table class="table table-responsive margin-top20">
                                    <tr>
                                        <td>Mã Thăng Tiến: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtMaThangTien1" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Mã Chức Vụ:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaChucVu1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenChucVu" DataValueField="MaChucVu"></asp:DropDownList>                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgay1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgay1_CalendarExtender" TargetControlID="txtNgay1" ID="txtNgay1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Đính Kèm:</td>
                                        <td>
                                           <asp:TextBox ID="txtDinhKem1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>                                    
                                    <tr>
                                        <td>Nội Dung:</td>
                                        <td>
                                           <asp:TextBox ID="txtNoiDung1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Ghi Chú:</td>
                                        <td>
                                           <asp:TextBox ID="txtGhiChu1" runat="server"></asp:TextBox>
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
                            <div class="modal-body margin-top20">
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
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Đóng</button>
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
            SelectCommand="SELECT * FROM [hr_ThangTien] WHERE ([MaNhanVien] = @MaNhanVien)"
            InsertCommand="INSERT INTO [hr_ThangTien] ([MaNhanVien], [MaChucVu], [Ngay], [DinhKem], [NoiDung], [GhiChu]) VALUES (@MaNhanVien, @MaChucVu, @Ngay, @DinhKem, @NoiDung, @GhiChu)"
            UpdateCommand="UPDATE [hr_ThangTien] SET [MaNhanVien] = @MaNhanVien, [MaChucVu] = @MaChucVu, [Ngay] = @Ngay, [DinhKem] = @DinhKem, [NoiDung] = @NoiDung, [GhiChu] = @GhiChu WHERE [MaThangTien] = @MaThangTien"
            DeleteCommand="DELETE FROM [hr_ThangTien] WHERE [MaThangTien] = @MaThangTien">
            <DeleteParameters>
                <asp:Parameter Name="MaThangTien" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="MaChucVu" Type="String" />
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="DinhKem" Type="String" />
                <asp:Parameter Name="NoiDung" Type="String" />
                <asp:Parameter Name="GhiChu" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVIen" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="MaChucVu" Type="String" />
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="DinhKem" Type="String" />
                <asp:Parameter Name="NoiDung" Type="String" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaThangTien" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_ChucVu]">
        </asp:SqlDataSource>
    </div>

</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU03_KyNang.aspx.vb" Inherits="HRM.hrU03_KyNang" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">


        <div class="list-group mt-5">
            <div class="list-group-item active">
                CẬP NHẬT KỸ NĂNG
            </div>
            <div class="list-group-item">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <td>
                                    Mã Nhân Viên
                                </td>
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
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaKyNang" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaKyNang" HeaderText="Mã Kỹ Năng" ReadOnly="True" SortExpression="MaKyNang" InsertVisible="False" />
                                <asp:BoundField DataField="LoaiKyNang" HeaderText="Loại Kỹ Năng" SortExpression="LoaiKyNang"/>
                                <asp:BoundField DataField="KyNang" HeaderText="Kỹ Năng" SortExpression="KyNang" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>


        <!--Bắt đầu Thêm -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Add</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><b>&times;</b></span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upAdd" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <%-- ([LoaiKyNang], [KyNang], [MaNhanVien]) --%>
                                <table class="table margin-top20">
                                    <tr>
                                        <td>Loại Kỹ Năng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtLoaiKyNang" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Kỹ Năng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtKyNang" CssClass="form-control" runat="server"></asp:TextBox>

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
        <!--Kết thúc thêm-->


        <!--Bắt đầu Sửa -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upEdit" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">

                                <%-- ([LoaiKyNang], [KyNang], [MaNhanVien]) --%>
                                <table class="table margin-top20">
                                    <tr>
                                        <td>Loại Kỹ Năng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtMaKyNang1" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Loại Kỹ Năng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtLoaiKyNang1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Kỹ Năng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtKyNang1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                </table>
                            </div>
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
        <!-- Kết thúc sửa -->


        <!--Bắt đầu Xóa-->
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
                                Bạn có chắc xóa dữ liệu này?
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
        <!--Kết thúc xóa -->


        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                SelectCommand="SELECT * FROM [hr_KyNang] WHERE ([MaNhanVien] = @MaNhanVien)"
                DeleteCommand="DELETE FROM [hr_KyNang] WHERE [MaKyNang] = @MaKyNang"
                InsertCommand="INSERT INTO [hr_KyNang] ([LoaiKyNang], [KyNang], [MaNhanVien]) VALUES (@LoaiKyNang, @KyNang, @MaNhanVien)"
                UpdateCommand="UPDATE [hr_KyNang] SET [LoaiKyNang] = @LoaiKyNang, [KyNang] = @KyNang, [MaNhanVien] = @MaNhanVien WHERE [MaKyNang] = @MaKyNang">
                <DeleteParameters>
                    <asp:Parameter Name="MaKyNang" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="LoaiKyNang" Type="String" />
                    <asp:Parameter Name="KyNang" Type="String" />
                    <asp:Parameter Name="MaNhanVien" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LoaiKyNang" Type="String" />
                    <asp:Parameter Name="KyNang" Type="String" />
                    <asp:Parameter Name="MaNhanVien" Type="String" />
                    <asp:Parameter Name="MaKyNang" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>


    </asp:Panel>
    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
    <asp:Panel ID="panelError" runat="server" Visible="True">
        <h4 class="alert alert-warning" role="alert">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label></h4>
    </asp:Panel>
</asp:Content>


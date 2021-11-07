<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Data/Admin/Admin.Master" CodeBehind="A_TaiKhoanCongTy.aspx.vb" Inherits="HRM.A_TaiKhoanCongTy" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                TÀI KHOẢN DỰ ÁN
            </div>

            <div class="list-group-item">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="cbPhanHe" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1_TaiKhoanPhanHe" DataTextField="TenPhanHe" DataValueField="MaPhanHe" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" ToolTip="Thêm mới" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-responsive" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataSourceID="SqlDataSource2_PhanQuyenCongTy" DataKeyNames="Id">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField HeaderText="Mã Số" DataField="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField HeaderText="Email" DataField="Email" SortExpression="Email"></asp:BoundField>
                                <asp:BoundField HeaderText="Mã Phân Hệ" DataField="MaPhanHe" SortExpression="MaPhanHe" />
                                <asp:BoundField HeaderText="Quyền" DataField="Quyen" SortExpression="Quyen" />
                                <asp:BoundField DataField="MaCongTy" HeaderText="Mã Công Ty" SortExpression="MaCongTy" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>

        <!--Bắt đầu Thêm -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Add</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><b>&times;</b></span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upAdd" runat="server">
                        <ContentTemplate>
                            <div class="modal-body p-4">
                                <%--[Email], [MaPhanHe], [Quyen], [MaCongTy] --%>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Email (*)</label>
                                            <asp:DropDownList ID="cbEmail" CssClass="form-control" runat="server" DataSourceID="SqlDataSource4_TaiKhoanNguoiDung" DataTextField="HoTen" DataValueField="Email" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Quyền (*)</label>
                                            <asp:DropDownList ID="cbPhanQuyen" CssClass="form-control" runat="server" DataSourceID="SqlDataSource5_QuyenCongTy" DataTextField="DienGiai" DataValueField="Quyen" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Công Ty (*)</label>
                                            <asp:DropDownList ID="cbCongTy" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3_CongTy" DataTextField="TenCongTy" DataValueField="MaCongTy" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
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

        <!--Kết thúc thêm-->

        <!--Bắt đầu Sửa -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upEdit" runat="server">
                        <ContentTemplate>
                            <div class="modal-body p-4">
                                <%--[Email], [MaPhanHe], [Quyen], [MaCongTy] --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Mã số (*)</label>
                                            <asp:TextBox ID="txtId1" runat="server" CssClass="form-control"  Enabled="false"></asp:TextBox>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Email (*)</label>
                                            <asp:DropDownList ID="cbEmail1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource4_TaiKhoanNguoiDung" DataTextField="HoTen" DataValueField="Email" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Quyền (*)</label>
                                            <asp:DropDownList ID="cbPhanQuyen1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource5_QuyenCongTy" DataTextField="DienGiai" DataValueField="Quyen" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Công Ty (*)</label>
                                            <asp:DropDownList ID="cbCongTy1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3_CongTy" DataTextField="TenCongTy" DataValueField="MaCongTy" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><i class="fe-save"></i> Cập nhật</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Đóng</button>
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
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Đóng</button>
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

        <div class="row">
            <asp:SqlDataSource ID="SqlDataSource1_TaiKhoanPhanHe" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [A00_PhanHe]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2_PhanQuyenCongTy" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [A00_PhanQuyenCongTy] WHERE ([MaPhanHe] = @MaPhanHe)" DeleteCommand="DELETE FROM [A00_PhanQuyenCongTy] WHERE [Id] = @Id" InsertCommand="INSERT INTO [A00_PhanQuyenCongTy] ([Email], [MaPhanHe], [Quyen], [MaCongTy]) VALUES (@Email, @MaPhanHe, @Quyen, @MaCongTy)" UpdateCommand="UPDATE [A00_PhanQuyenCongTy] SET [Email] = @Email, [MaPhanHe] = @MaPhanHe, [Quyen] = @Quyen, [MaCongTy] = @MaCongTy WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="MaPhanHe" Type="String" />
                    <asp:Parameter Name="Quyen" Type="String" />
                    <asp:Parameter Name="MaCongTy" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbPhanHe" Name="MaPhanHe" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="MaPhanHe" Type="String" />
                    <asp:Parameter Name="Quyen" Type="String" />
                    <asp:Parameter Name="MaCongTy" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3_CongTy" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT [MaCongTy], [TenCongTy] FROM [hr_CongTy]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4_TaiKhoanNguoiDung" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT Email, HoTen + '-' + Email AS HoTen FROM A00_TaiKhoanNguoiDung"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5_QuyenCongTy" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [A_QuyenCongTy] WHERE ([PhanHe] = @PhanHe)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbPhanHe" Name="PhanHe" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
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


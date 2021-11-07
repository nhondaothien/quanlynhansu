<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Admin.Master" CodeBehind="A_TaiKhoanDuAn.aspx.vb" Inherits="HRM.A_TaiKhoanDuAn" %>

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
                                    <asp:DropDownList ID="cbTaiKhoan" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1_TaiKhoan" DataTextField="Email" DataValueField="Email" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" ToolTip="Thêm mới" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-responsive" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataKeyNames="MaSo" DataSourceID="SqlDataSource2_ChiTietTaiKhoanDuAn">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField HeaderText="Mã Số" DataField="MaSo" ReadOnly="True" SortExpression="MaSo" InsertVisible="False"></asp:BoundField>
                                <asp:BoundField HeaderText="Email" DataField="Email" SortExpression="Email"></asp:BoundField>
                                <asp:BoundField HeaderText="Mã Dự Án" DataField="MaDuAn" SortExpression="MaDuAn" />
                                <asp:BoundField HeaderText="pms" DataField="pms" SortExpression="pms" />
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
                                <%--([Email], [MaDuAn], [pms]) --%>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Tên Dự Án (*)</label>
                                            <asp:DropDownList ID="cbTenDuAn" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3_DuAn" DataTextField="DuAn" DataValueField="MaDuAn" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Quyền (*)</label>
                                            <asp:DropDownList ID="cbPhanQuyen" CssClass="form-control" runat="server" DataSourceID="SqlDataSource4_PhanQuyenDuAn" DataTextField="DienGiai" DataValueField="MaSo" AutoPostBack="True">
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
                                <%--([Email], [MaDuAn], [pms]) --%>
                                <asp:TextBox ID="txtMaSo1" runat="server" Visible="False"></asp:TextBox>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Tên Dự Án (*)</label>
                                            <asp:DropDownList ID="cbTenDuAn1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3_DuAn" DataTextField="DuAn" DataValueField="MaDuAn" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Quyền (*)</label>
                                            <asp:DropDownList ID="cbPhanQuyen1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource4_PhanQuyenDuAn" DataTextField="DienGiai" DataValueField="MaSo" AutoPostBack="True">
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
            <asp:SqlDataSource ID="SqlDataSource1_TaiKhoan" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [A00_TaiKhoanNguoiDung]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2_ChiTietTaiKhoanDuAn" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" DeleteCommand="DELETE FROM [A00_ChiTietTaiKhoanNguoiDung] WHERE [MaSo] = @MaSo" InsertCommand="INSERT INTO [A00_ChiTietTaiKhoanNguoiDung] ([Email], [MaDuAn], [pms]) VALUES (@Email, @MaDuAn, @pms)" SelectCommand="SELECT * FROM [A00_ChiTietTaiKhoanNguoiDung] WHERE ([Email] = @Email)" UpdateCommand="UPDATE [A00_ChiTietTaiKhoanNguoiDung] SET [Email] = @Email, [MaDuAn] = @MaDuAn, [pms] = @pms WHERE [MaSo] = @MaSo">
                <DeleteParameters>
                    <asp:Parameter Name="MaSo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="MaDuAn" Type="String" />
                    <asp:Parameter Name="pms" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbTaiKhoan" Name="Email" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="MaDuAn" Type="String" />
                    <asp:Parameter Name="pms" Type="String" />
                    <asp:Parameter Name="MaSo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3_DuAn" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaDuAn, MaDuAn + '_' + TenDuAn AS DuAn FROM dts00_DuAn"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4_PhanQuyenDuAn" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [A00_PhanQuyenDuAn]"></asp:SqlDataSource>
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


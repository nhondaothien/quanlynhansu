<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Admin.Master" CodeBehind="A_TaiKhoanNguoiDung.aspx.vb" Inherits="HRM.A_TaiKhoanNguoiDung" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="CKFinder" Assembly="CKFinder" TagPrefix="CKFinder" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .hidden-col{
            display : none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                TÀI KHOẢN NGƯỜI DÙNG
            </div>
            <div class="list-group-item">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" ToolTip="Thêm mới" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                                    <asp:LinkButton ID="btnImport" runat="server" CssClass="btn btn-success" ToolTip="Thêm mới bằng excel" OnClick="btnImport_Click"><i class="fe-upload-cloud"></i> Import</asp:LinkButton>
                                    
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="Email" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                                <asp:BoundField DataField="MatKhau" HeaderText="Mật Khẩu" SortExpression="MatKhau"/>
                                <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" SortExpression="HoTen" />
                                <asp:BoundField DataField="NgayTao" HeaderText="Ngày Tạo" SortExpression="NgayTao" DataFormatString="{0:MM/dd/yyyy}" />
                                <asp:BoundField DataField="TinhTrang" HeaderText="Tình Trạng" SortExpression="TinhTrang" />
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
            <div class="modal-dialog ">
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
                                <%-- ([Email], [MatKhau], [HoTen], [NgayTao], [TinhTrang]) --%>
                                <table class="table margin-top20">
                                    <tr>
                                        <td>Email: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Mật khẩu: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtMaKhau" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Họ và tên: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtHoTen" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ngày Tạo: </td>
                                        <td>
                                            <asp:TextBox ID="txtNgayTao" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayTao_CalendarExtender" TargetControlID="txtNgayTao" ID="txtNgayTao_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tình Trạng: </td>
                                        <td>
                                            <asp:DropDownList ID="cbTinhTrang" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_TinhTrang" DataTextField="Ten" DataValueField="ID" AutoPostBack="True">
                                            </asp:DropDownList>
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

        <%--Import Modal--%>
        <div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle2" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle2">Import</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <tr>
                                <td>Upload File: (*)</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnImportRecord" runat="server" CssClass="btn mauxanh" OnClick="btnImportRecord_Click"><i class="fe-save"></i> Import</asp:LinkButton>
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Kết thúc thêm-->

        <!--Bắt đầu Sửa -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
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

                                <%-- ([Email], [MatKhau], [HoTen], [NgayTao], [TinhTrang]) --%>
                                <table class="table">
                                    <tr>
                                        <td>Email: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtEmail1" CssClass="form-control" runat="server" ReadOnly="True" BackColor="Gray"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Mật khẩu: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtMaKhau1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Họ và tên: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtHoTen1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ngày Tạo: </td>
                                        <td>
                                            <asp:TextBox ID="txtNgayTao1" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayTao1_CalendarExtender" TargetControlID="txtNgayTao1" ID="txtNgayTao1_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tình Trạng: </td>
                                        <td>
                                            <asp:DropDownList ID="cbTinhTrang1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2_TinhTrang" DataTextField="Ten" DataValueField="ID" AutoPostBack="True">
                                            </asp:DropDownList>
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
                SelectCommand="SELECT * FROM [A00_TaiKhoanNguoiDung]"
                DeleteCommand="DELETE FROM [A00_TaiKhoanNguoiDung] WHERE [Email] = @Email"
                InsertCommand="INSERT INTO [A00_TaiKhoanNguoiDung] ([Email], [MatKhau], [HoTen], [NgayTao], [TinhTrang]) VALUES (@Email, @MatKhau, @HoTen, @NgayTao, @TinhTrang)"
                UpdateCommand="UPDATE [A00_TaiKhoanNguoiDung] SET [MatKhau] = @MatKhau, [HoTen] = @HoTen, [NgayTao] = @NgayTao, [TinhTrang] = @TinhTrang WHERE [Email] = @Email">
                <DeleteParameters>
                    <asp:Parameter Name="Email" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="MatKhau" Type="String" />
                    <asp:Parameter Name="HoTen" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayTao" />
                    <asp:Parameter Name="TinhTrang" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MatKhau" Type="String" />
                    <asp:Parameter Name="HoTen" Type="String" />
                    <asp:Parameter Name="NgayTao" DbType="Date" />
                    <asp:Parameter Name="TinhTrang" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2_TinhTrang" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                SelectCommand="SELECT * FROM [A00_TinhTrangTaiKhoan]">
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

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>

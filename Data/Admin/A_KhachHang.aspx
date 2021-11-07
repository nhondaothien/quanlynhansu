<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Admin.Master" CodeBehind="A_KhachHang.aspx.vb" Inherits="HRM.A_KhachHang" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="CKFinder" Assembly="CKFinder" TagPrefix="CKFinder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                KHÁCH HÀNG
            </div>

            <div class="list-group-item">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" ToolTip="Thêm mới" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                                    <asp:LinkButton ID="btnImport" runat="server" CssClass="btn btn-success" ToolTip="Thêm mới bằng excel" OnClick="btnImport_Click"><i class="fe-upload-cloud"></i> Import</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <div class="form-horizontal" role="form">
                            <div class="form-group">
                                <div class="col-md-12 mt-2">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập từ khóa Tên Khách Hàng cần tìm!"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnSearch" runat="server" Text="Tìm!" CausesValidation="False" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-responsive" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataKeyNames="MaKhachHang" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:CommandField ShowSelectButton="True" HeaderText="Chi Tiết" SelectText="&lt;i class=&quot;fe-list&quot;&gt;&lt;/i&gt;" ItemStyle-Width="40px">
                                    <ControlStyle CssClass=" btn btn-xs maureu" />
                                    <ItemStyle Width="40px" />
                                </asp:CommandField>
                                <asp:BoundField HeaderText="Mã Khách Hàng" DataField="MaKhachHang" ReadOnly="True" SortExpression="MaKhachHang" InsertVisible="False"></asp:BoundField>
                                <asp:BoundField HeaderText="Tên Khách Hàng" DataField="TenKhachHang" SortExpression="TenKhachHang"></asp:BoundField>
                                <asp:TemplateField HeaderText="Địa Chỉ" SortExpression="DiaChi">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DiaChi") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DiaChi") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="SĐT" DataField="DienThoai" SortExpression="DienThoai" />
                                <asp:BoundField HeaderText="Email" DataField="Email" SortExpression="Email" />
                                <asp:BoundField HeaderText="Website" DataField="Website" SortExpression="Website"></asp:BoundField>
                                <asp:BoundField HeaderText="Hồ Sơ" DataField="HoSo" SortExpression="HoSo"></asp:BoundField>
                                <asp:BoundField HeaderText="Mã Công Ty" DataField="MaCongTy" SortExpression="MaCongTy"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="list-group-item">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-condensed table-hover" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaKhachHang" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <Fields>
                                <asp:BoundField HeaderText="Mã Khách Hàng" DataField="MaKhachHang" ReadOnly="True" SortExpression="MaKhachHang" InsertVisible="False"></asp:BoundField>
                                <asp:BoundField HeaderText="Tên Khách Hàng" DataField="TenKhachHang" SortExpression="TenKhachHang"></asp:BoundField>
                                <asp:TemplateField HeaderText="Địa Chỉ" SortExpression="DiaChi">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("DiaChi") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("DiaChi") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DiaChi") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="SĐT" DataField="DienThoai" SortExpression="DienThoai" />
                                <asp:BoundField HeaderText="Email" DataField="Email" SortExpression="Email" />
                                <asp:BoundField HeaderText="Website" DataField="Website" SortExpression="Website"></asp:BoundField>
                                <asp:BoundField HeaderText="Hồ Sơ" DataField="HoSo" SortExpression="HoSo"></asp:BoundField>
                                <asp:BoundField HeaderText="Mã Công Ty" DataField="MaCongTy" SortExpression="MaCongTy"></asp:BoundField>
                            </Fields>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                        </asp:DetailsView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <!--Bắt đầu Thêm -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-full">
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
                                <%--([TenKhachHang], [DiaChi], [DienThoai],
                                    [Email], [Website], [HoSo], [MaCongTy])--%>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Tên Khách Hàng (*)</label>
                                            <asp:TextBox ID="txtTenKhachHang" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-3" class="control-label">Hồ Sơ URL</label>
                                            <asp:TextBox ID="txtHoSo" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Tên Công Ty</label>
                                            <asp:DropDownList ID="cbCongTy" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3_CongTy" DataTextField="TenCongTy" DataValueField="MaCongTy">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-7" class="control-label">Điện Thoại (*)</label>
                                            <asp:TextBox ID="txtDienThoai" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-8" class="control-label">Website</label>
                                            <asp:TextBox ID="txtWebsite" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-9" class="control-label">Email</label>
                                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Địa Chỉ (*)</label>
                                            <CKEditor:CKEditorControl ID="txtDiaChi" Height="100" runat="server"></CKEditor:CKEditorControl>

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
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Kết thúc thêm-->

        <!--Bắt đầu Sửa -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-full">
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
                                <%--([TenKhachHang], [DiaChi], [DienThoai],
                                    [Email], [Website], [HoSo], [MaCongTy])--%>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Mã Khách Hàng (*)</label>
                                            <asp:TextBox ID="txtMaKhachHang1" CssClass="form-control" runat="server" ReadOnly="True" BackColor="Gray"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Tên Khách Hàng (*)</label>
                                            <asp:TextBox ID="txtTenKhachHang1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-3" class="control-label">Hồ Sơ URL</label>
                                            <asp:TextBox ID="txtHoSo1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Tên Công Ty</label>
                                            <asp:DropDownList ID="cbCongTy1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3_CongTy" DataTextField="TenCongTy" DataValueField="MaCongTy">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-7" class="control-label">Điện Thoại</label>
                                            <asp:TextBox ID="txtDienThoai1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-8" class="control-label">Website</label>
                                            <asp:TextBox ID="txtWebsite1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-9" class="control-label">Email</label>
                                            <asp:TextBox ID="txtEmail1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Địa Chỉ (*)</label>
                                            <CKEditor:CKEditorControl ID="txtDiaChi1" Height="100" runat="server"></CKEditor:CKEditorControl>
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
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [mkt_KhachHang]" DeleteCommand="DELETE FROM [mkt_KhachHang] WHERE [MaKhachHang] = @MaKhachHang" InsertCommand="INSERT INTO [mkt_KhachHang] ([TenKhachHang], [DiaChi], [DienThoai], [Email], [Website], [HoSo], [MaCongTy]) VALUES (@TenKhachHang, @DiaChi, @DienThoai, @Email, @Website, @HoSo, @MaCongTy)" UpdateCommand="UPDATE [mkt_KhachHang] SET [TenKhachHang] = @TenKhachHang, [DiaChi] = @DiaChi, [DienThoai] = @DienThoai, [Email] = @Email, [Website] = @Website, [HoSo] = @HoSo, [MaCongTy] = @MaCongTy WHERE [MaKhachHang] = @MaKhachHang">
                <DeleteParameters>
                    <asp:Parameter Name="MaKhachHang" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TenKhachHang" Type="String" />
                    <asp:Parameter Name="DiaChi" Type="String" />
                    <asp:Parameter Name="DienThoai" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Website" Type="String" />
                    <asp:Parameter Name="HoSo" Type="String" />
                    <asp:Parameter Name="MaCongTy" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenKhachHang" Type="String" />
                    <asp:Parameter Name="DiaChi" Type="String" />
                    <asp:Parameter Name="DienThoai" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Website" Type="String" />
                    <asp:Parameter Name="HoSo" Type="String" />
                    <asp:Parameter Name="MaCongTy" Type="String" />
                    <asp:Parameter Name="MaKhachHang" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [mkt_KhachHang] WHERE ([MaKhachHang] = @MaKhachHang)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="MaKhachHang" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource3_CongTy" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT [MaCongTy], [TenCongTy] FROM [hr_CongTy]"></asp:SqlDataSource>
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

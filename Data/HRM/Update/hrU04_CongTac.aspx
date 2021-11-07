<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU04_CongTac.aspx.vb" Inherits="HRM.hrU04_CongTac" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">


        <div class="list-group mt-5">
            <div class="list-group-item active">
                CẬP NHẬT CÔNG TÁC
            </div>
            <div class="list-group-item">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <td>Mã Nhân Viên
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
                            DataKeyNames="MaCongTac" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaCongTac" HeaderText="Mã Công Tác" ReadOnly="True" SortExpression="MaCongTac" InsertVisible="False" />
                                <asp:BoundField DataField="ThoiGian" HeaderText="Thời Gian" SortExpression="ThoiGian" DataFormatString="{0:MM/dd/yyyy}" />
                                <asp:BoundField DataField="CongTy" HeaderText="Công Ty" SortExpression="CongTy" />
                                <asp:BoundField DataField="ViTri" HeaderText="Vị Trí" SortExpression="ViTri" />
                                <asp:TemplateField HeaderText="Mô Tả Công Việc" SortExpression="MoTaCongViec">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MoTaCongViec") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("MoTaCongViec") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="NgayBatDau" HeaderText="Ngày Bắt Đầu" SortExpression="NgayBatDau" DataFormatString="{0:MM/dd/yyyy}" />
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
                                <%--[ThoiGian], [CongTy], [ViTri], [MoTaCongViec], [MaNhanVien], [NgayBatDau]--%>
                                <table class="table margin-top20">
                                    <tr>
                                        <td>Thời Gian: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtThoiGian" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtThoiGian_CalendarExtender" TargetControlID="txtThoiGian" ID="txtThoiGian_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Công Ty: </td>
                                        <td>
                                            <asp:TextBox ID="txtCongTy" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vị Trí: </td>
                                        <td>
                                            <asp:TextBox ID="txtViTri" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mô Tả Công Việc: </td>
                                        <td>
                                            <CKEditor:CKEditorControl ID="txtMoTaCongViec" Height="100" runat="server"></CKEditor:CKEditorControl>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ngày Bắt Đầu: </td>
                                        <td>
                                            <asp:TextBox ID="txtNgayBatDau" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayBatDau_CalendarExtender" TargetControlID="txtNgayBatDau" ID="txtNgayBatDau_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>

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

                                <%--[ThoiGian], [CongTy], [ViTri], [MoTaCongViec], [MaNhanVien], [NgayBatDau]--%>
                                <table class="table margin-top20">
                                    <tr>
                                        <td>Mã Công Tác: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtMaCongTac1" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Thời Gian: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtThoiGian1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtThoiGian1_CalendarExtender" TargetControlID="txtThoiGian1" ID="txtThoiGian1_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Công Ty: </td>
                                        <td>
                                            <asp:TextBox ID="txtCongTy1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vị Trí: </td>
                                        <td>
                                            <asp:TextBox ID="txtViTri1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mô Tả Công Việc: </td>
                                        <td>
                                            <CKEditor:CKEditorControl ID="txtMoTaCongViec1" Height="100" runat="server"></CKEditor:CKEditorControl>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ngày Bắt Đầu: </td>
                                        <td>
                                            <asp:TextBox ID="txtNgayBatDau1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayBatDau1_CalendarExtender" TargetControlID="txtNgayBatDau1" ID="txtNgayBatDau1_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>

                                        </td>
                                    </tr>
                                </table>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                SelectCommand="SELECT * FROM [hr_CongTac] WHERE ([MaNhanVien] = @MaNhanVien)"
                DeleteCommand="DELETE FROM [hr_CongTac] WHERE [MaCongTac] = @MaCongTac"
                InsertCommand="INSERT INTO [hr_CongTac] ([ThoiGian], [CongTy], [ViTri], [MoTaCongViec], [MaNhanVien], [NgayBatDau]) VALUES (@ThoiGian, @CongTy, @ViTri, @MoTaCongViec, @MaNhanVien, @NgayBatDau)"
                UpdateCommand="UPDATE [hr_CongTac] SET [ThoiGian] = @ThoiGian, [CongTy] = @CongTy, [ViTri] = @ViTri, [MoTaCongViec] = @MoTaCongViec, [MaNhanVien] = @MaNhanVien, [NgayBatDau] = @NgayBatDau WHERE [MaCongTac] = @MaCongTac">
                <DeleteParameters>
                    <asp:Parameter Name="MaCongTac" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ThoiGian" Type="String" />
                    <asp:Parameter Name="CongTy" Type="String" />
                    <asp:Parameter Name="ViTri" Type="String" />
                    <asp:Parameter Name="MoTaCongViec" Type="String" />
                    <asp:Parameter Name="MaNhanVien" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayBatDau" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ThoiGian" Type="String" />
                    <asp:Parameter Name="CongTy" Type="String" />
                    <asp:Parameter Name="ViTri" Type="String" />
                    <asp:Parameter Name="MoTaCongViec" Type="String" />
                    <asp:Parameter Name="MaNhanVien" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayBatDau" />
                    <asp:Parameter Name="MaCongTac" Type="Int32" />
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


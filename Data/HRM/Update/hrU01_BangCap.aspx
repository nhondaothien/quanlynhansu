<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU01_BangCap.aspx.vb" Inherits="HRM.hrU01_BangCap" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                CẬP NHẬT BẰNG CẤP
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
                            DataKeyNames="MaBang" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaBang" HeaderText="Mã Bằng" ReadOnly="True" SortExpression="MaBang" InsertVisible="False" />
                                <asp:BoundField DataField="SoBang" HeaderText="Số Bằng" SortExpression="SoBang"/>
                                <asp:BoundField DataField="TenBang" HeaderText="Tên Bằng" SortExpression="TenBang" />
                                <asp:BoundField DataField="NgayCap" HeaderText="Ngày Cấp" SortExpression="NgayCap" DataFormatString="{0:MM/dd/yyyy}"  />
                                <asp:BoundField DataField="DonViCap" HeaderText="Đơn Vị Cấp" SortExpression="DonViCap" />
                                <asp:BoundField DataField="DinhKem" HeaderText="Đính Kèm" SortExpression="DinhKem" />
                                <asp:BoundField DataField="MaLoai" HeaderText="Mã Loại" SortExpression="MaLoai" />
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
                                <%-- ([SoBang], [TenBang], [NgayCap], [DonViCap], [DinhKem], [MaNhanVien], [MaLoai]) --%>
                                <table class="table margin-top20">
                                    <tr>
                                        <td>Số Bằng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtSoBang" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Tên Bằng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtTenBang" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ngày Cấp: </td>
                                        <td>
                                            <asp:TextBox ID="txtNgayCap" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayCap_CalendarExtender" TargetControlID="txtNgayCap" ID="txtNgayCap_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Đơn Vị Cấp: </td>
                                        <td>
                                            <asp:TextBox ID="txtDonViCap" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Đính Kèm: </td>
                                        <td>
                                            <asp:TextBox ID="txtDinhKem" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mã Loại:</td>
                                        <td>
                                            <asp:DropDownList ID="cbMaLoaiBangCap" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="LoaiBangCap" DataValueField="MaLoai"></asp:DropDownList>

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

                                <%-- ([SoBang], [TenBang], [NgayCap], [DonViCap], [DinhKem], [MaNhanVien], [MaLoai]) --%>
                                <table class="table margin-top20">
                                    <tr>
                                        <td>Số Bằng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtMaBang1" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Số Bằng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtSoBang1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Tên Bằng: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtTenBang1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ngày Cấp: </td>
                                        <td>
                                            <asp:TextBox ID="txtNgayCap1" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayCap1_CalendarExtender" TargetControlID="txtNgayCap1" ID="txtNgayCap1_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Đơn Vị Cấp: </td>
                                        <td>
                                            <asp:TextBox ID="txtDonViCap1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Đính Kèm: </td>
                                        <td>
                                            <asp:TextBox ID="txtDinhKem1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mã Loại:</td>
                                        <td>
                                            <asp:DropDownList ID="cbMaLoaiBangCap1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="LoaiBangCap" DataValueField="MaLoai"></asp:DropDownList>

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
                            <div class="modal-body margin-top20">
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
                SelectCommand="SELECT * FROM [hr_BangCap] WHERE ([MaNhanVien] = @MaNhanVien)"
                DeleteCommand="DELETE FROM [hr_BangCap] WHERE [MaBang] = @MaBang"
                InsertCommand="INSERT INTO [hr_BangCap] ([SoBang], [TenBang], [NgayCap], [DonViCap], [DinhKem], [MaNhanVien], [MaLoai]) VALUES (@SoBang, @TenBang, @NgayCap, @DonViCap, @DinhKem, @MaNhanVien, @MaLoai)"
                UpdateCommand="UPDATE [hr_BangCap] SET [SoBang] = @SoBang, [TenBang] = @TenBang, [NgayCap] = @NgayCap, [DonViCap] = @DonViCap, [DinhKem] = @DinhKem, [MaNhanVien] = @MaNhanVien, [MaLoai] = @MaLoai WHERE [MaBang] = @MaBang">
                <DeleteParameters>
                    <asp:Parameter Name="MaBang" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SoBang" Type="String" />
                    <asp:Parameter Name="TenBang" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayCap" />
                    <asp:Parameter Name="DonViCap" Type="String" />
                    <asp:Parameter Name="DinhKem" Type="String" />
                    <asp:Parameter Name="MaNhanVien" Type="String" />
                    <asp:Parameter Name="MaLoai" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SoBang" Type="String" />
                    <asp:Parameter Name="TenBang" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayCap" />
                    <asp:Parameter Name="DonViCap" Type="String" />
                    <asp:Parameter Name="DinhKem" Type="String" />
                    <asp:Parameter Name="MaNhanVien" Type="String" />
                    <asp:Parameter Name="MaLoai" Type="String" />
                    <asp:Parameter Name="MaBang" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_LoaiBangCap]"></asp:SqlDataSource>
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

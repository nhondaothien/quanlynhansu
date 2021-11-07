<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU08_DieuChinhLuong.aspx.vb" Inherits="HRM.hrU08_DieuChinhLuong" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT TIỀN LƯƠNG
        </div>
        <div class="list-group-item document">
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
                    <asp:GridView ID="GridView1" runat="server" Width="100%" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaDieuChinh" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs mauvang" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maudo" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaDieuChinh" HeaderText="Mã Điều Chỉnh" SortExpression="MaDieuChinh" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="LuongCoBan" HeaderText="Lương Cơ Bản" SortExpression="LuongCoBan" DataFormatString="{0:#,0.00;(#,0.00)}" />
                            <asp:BoundField DataField="LuongGross" HeaderText="Lương Gross" SortExpression="LuongGross" DataFormatString="{0:#,0.00;(#,0.00)}" />
                            <asp:BoundField DataField="LyDoDieuChinh" HeaderText="Lý Do Điều Chỉnh" SortExpression="LyDoDieuChinh" />
                            <asp:BoundField DataField="DinhKem" HeaderText="Đính Kèm" SortExpression="DinhKem" />
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
                            <div class="modal-body margin-top20">
                                <%--[Ngay], [LuongCoBan], [LuongGross], [LyDoDieuChinh], 
                                    [DinhKem], [MaNhanVien]--%>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgay" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgay_CalendarExtender" TargetControlID="txtNgay" ID="txtNgay_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lương Cơ Bản:</td>
                                        <td>
                                            <asp:TextBox ID="txtLuongCoBan" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Lương Gross:</td>
                                        <td>
                                            <asp:TextBox ID="txtLuongGross" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lý Do Điều Chỉnh:</td>
                                        <td>
                                            <asp:TextBox ID="txtLyDoDieuChinh" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Đính Kèm:</td>
                                        <td>
                                            <asp:TextBox ID="txtDinhKem" runat="server"></asp:TextBox>
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
                    <div class="modal-body margin-top20">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <%--[Ngay], [LuongCoBan], [LuongGross], [LyDoDieuChinh], 
                                    [DinhKem], [MaNhanVien]--%>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Mã Điều Chỉnh:</td>
                                        <td>
                                            <asp:TextBox ID="txtMaDieuChinh1" runat="server" ReadOnly="true"></asp:TextBox>
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
                                        <td>Lương Cơ Bản:</td>
                                        <td>
                                            <asp:TextBox ID="txtLuongCoBan1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Lương Gross:</td>
                                        <td>
                                            <asp:TextBox ID="txtLuongGross1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lý Do Điều Chỉnh:</td>
                                        <td>
                                            <asp:TextBox ID="txtLyDoDieuChinh1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Đính Kèm:</td>
                                        <td>
                                            <asp:TextBox ID="txtDinhKem1" runat="server"></asp:TextBox>
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
            SelectCommand="SELECT * FROM [hr_DieuChinhLuong] WHERE ([MaNhanVien] = @MaNhanVien)"
            InsertCommand="INSERT INTO [hr_DieuChinhLuong] ([Ngay], [LuongCoBan], [LuongGross], [LyDoDieuChinh], [DinhKem], [MaNhanVien]) VALUES (@Ngay, @LuongCoBan, @LuongGross, @LyDoDieuChinh, @DinhKem, @MaNhanVien)"
            UpdateCommand="UPDATE [hr_DieuChinhLuong] SET [Ngay] = @Ngay, [LuongCoBan] = @LuongCoBan, [LuongGross] = @LuongGross, [LyDoDieuChinh] = @LyDoDieuChinh, [DinhKem] = @DinhKem, [MaNhanVien] = @MaNhanVien WHERE [MaDieuChinh] = @MaDieuChinh"
            DeleteCommand="DELETE FROM [hr_DieuChinhLuong] WHERE [MaDieuChinh] = @MaDieuChinh">
            <DeleteParameters>
                <asp:Parameter Name="MaDieuChinh" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="LuongCoBan" Type="Double" />
                <asp:Parameter Name="LuongGross" Type="Double" />
                <asp:Parameter Name="LyDoDieuChinh" Type="String" />
                <asp:Parameter Name="DinhKem" Type="String"></asp:Parameter>
                <asp:Parameter Name="MaNhanVien" Type="String"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="lblMaNhanVien" Name="MaNhanVien" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="LuongCoBan" Type="Double" />
                <asp:Parameter Name="LuongGross" Type="Double" />
                <asp:Parameter Name="LyDoDieuChinh" Type="String" />
                <asp:Parameter Name="DinhKem" Type="String"></asp:Parameter>
                <asp:Parameter Name="MaNhanVien" Type="String"></asp:Parameter>
                <asp:Parameter Name="MaDieuChinh" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

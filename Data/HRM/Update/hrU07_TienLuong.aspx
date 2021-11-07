<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU07_TienLuong.aspx.vb" Inherits="HRM.hrU07_TienLuong" %>

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
                    <asp:GridView ID="GridView1" runat="server" Width="100%" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaLuong" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs mauvang" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maudo" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaLuong" HeaderText="Mã Lương" SortExpression="MaLuong" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay" />
                            <asp:BoundField DataField="GioCongChuan" HeaderText="Giờ Công Chuẩn" SortExpression="GioCongChuan" />
                            <asp:BoundField DataField="GioCongThucTe" HeaderText="Giờ Công Thục Tế" SortExpression="GioCongThucTe" />
                            <asp:BoundField DataField="LuongCoBan" HeaderText="Lương Cơ bản" SortExpression="LuongCoBan" DataFormatString="{0:#,0.00;(#,0.00)}" />
                            <asp:BoundField DataField="HeSo" HeaderText="Hệ Số" SortExpression="HeSo" />
                            <asp:BoundField DataField="PhuCap" HeaderText="Phụ Cấp" SortExpression="PhuCap" />
                            <asp:BoundField DataField="HoTroKhac" HeaderText="Hỗ Trợ Khác" SortExpression="HoTroKhac" />
                            <asp:BoundField DataField="BaoHiemBatBuoc" HeaderText="Bảo Hiểm Bắc Buộc" SortExpression="BaoHiemBatBuoc" />
                            <asp:BoundField DataField="ThueTNCN" HeaderText="Thuế TNCN" SortExpression="ThueTNCN" />
                            <asp:BoundField DataField="TangCa" HeaderText="Tăng Ca" SortExpression="TangCa" />
                            <asp:BoundField DataField="Khac" HeaderText="Khác" SortExpression="Khac" />
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
                            <div class="modal-body margin-top20">
                                <%--[Ngay], [GioCongChuan], [GioCongThucTe], [LuongCoBan], [HeSo], [PhuCap], [HoTroKhac], [BaoHiemBatBuoc], 
                                    [ThueTNCN], [TangCa], [Khac], [GhiChu], [MaNhanVien]]--%>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgay" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgay_CalendarExtender" TargetControlID="txtNgay" ID="txtNgay_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Giờ Công Chuẩn:</td>
                                        <td>
                                            <asp:TextBox ID="txtGioCongChuan" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Giờ Công Thực Tế:</td>
                                        <td>
                                            <asp:TextBox ID="txtGioCongThucTe" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lương Cơ Bản:</td>
                                        <td>
                                            <asp:TextBox ID="txtLuongCoBan" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hệ Số:</td>
                                        <td>
                                            <asp:TextBox ID="txtHeSo" runat="server">1</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phụ Cấp:</td>
                                        <td>
                                            <asp:TextBox ID="txtPhuCap" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Hỗ Trợ Khác:</td>
                                        <td>
                                            <asp:TextBox ID="txtHoTroKhac" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Bảo Hiểm Bắc Buộc:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlBaoHiemBatBuoc" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="HeSo" DataValueField="HeSo"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Thuế TNCN:</td>
                                        <td>
                                            <asp:TextBox ID="txtThueTNCN" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tăng Ca:</td>
                                        <td>
                                            <asp:TextBox ID="txtTangCa" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Khác:</td>
                                        <td>
                                            <asp:TextBox ID="txtKhac" runat="server">0</asp:TextBox>
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
                    <div class="modal-body margin-top20">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Mã Lương:</td>
                                        <td>
                                            <asp:TextBox ID="txtMaLuong1" runat="server" ReadOnly="true"></asp:TextBox>
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
                                        <td>Giờ Công Chuẩn:</td>
                                        <td>
                                            <asp:TextBox ID="txtGioCongChuan1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Giờ Công Thực Tế:</td>
                                        <td>
                                            <asp:TextBox ID="txtGioCongThucTe1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lương Cơ Bản:</td>
                                        <td>
                                            <asp:TextBox ID="txtLuongCoBan1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hệ Số:</td>
                                        <td>
                                            <asp:TextBox ID="txtHeSo1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phụ Cấp:</td>
                                        <td>
                                            <asp:TextBox ID="txtPhuCap1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Hỗ Trợ Khác:</td>
                                        <td>
                                            <asp:TextBox ID="txtHoTroKhac1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Bảo Hiểm Bắc Buộc:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlBaoHiemBatBuoc1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="HeSo" DataValueField="HeSo"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Thuế TNCN:</td>
                                        <td>
                                            <asp:TextBox ID="txtThueTNCN1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tăng Ca:</td>
                                        <td>
                                            <asp:TextBox ID="txtTangCa1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Khác:</td>
                                        <td>
                                            <asp:TextBox ID="txtKhac1" runat="server"></asp:TextBox>
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
            SelectCommand="SELECT * FROM [hr_Luong] WHERE ([MaNhanVien] = @MaNhanVien)"
            InsertCommand="INSERT INTO [hr_Luong] ([Ngay], [GioCongChuan], [GioCongThucTe], [LuongCoBan], [HeSo], [PhuCap], [HoTroKhac], [BaoHiemBatBuoc], [ThueTNCN], [TangCa], [Khac], [GhiChu], [MaNhanVien]) VALUES (@Ngay, @GioCongChuan, @GioCongThucTe, @LuongCoBan, @HeSo, @PhuCap, @HoTroKhac, @BaoHiemBatBuoc, @ThueTNCN, @TangCa, @Khac, @GhiChu, @MaNhanVien)"
            UpdateCommand="UPDATE [hr_Luong] SET [Ngay] = @Ngay, [GioCongChuan] = @GioCongChuan, [GioCongThucTe] = @GioCongThucTe, [LuongCoBan] = @LuongCoBan, [HeSo] = @HeSo, [PhuCap] = @PhuCap, [HoTroKhac] = @HoTroKhac, [BaoHiemBatBuoc] = @BaoHiemBatBuoc, [ThueTNCN] = @ThueTNCN, [TangCa] = @TangCa, [Khac] = @Khac, [GhiChu] = @GhiChu, [MaNhanVien] = @MaNhanVien WHERE [MaLuong] = @MaLuong"
            DeleteCommand="DELETE FROM [hr_Luong] WHERE [MaLuong] = @MaLuong">
            <DeleteParameters>
                <asp:Parameter Name="MaLuong" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="GioCongChuan" Type="Int32" />
                <asp:Parameter Name="GioCongThucTe" Type="Double" />
                <asp:Parameter Name="LuongCoBan" Type="Double" />
                <asp:Parameter Name="HeSo" Type="Double"></asp:Parameter>
                <asp:Parameter Name="PhuCap" Type="Double"></asp:Parameter>
                <asp:Parameter Name="HoTroKhac" Type="Double" />
                <asp:Parameter Name="BaoHiemBatBuoc" Type="Double" />
                <asp:Parameter Name="ThueTNCN" Type="Double" />
                <asp:Parameter Name="TangCa" Type="Double" />
                <asp:Parameter Name="Khac" Type="Double" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="GioCongChuan" Type="Int32" />
                <asp:Parameter Name="GioCongThucTe" Type="Double" />
                <asp:Parameter Name="LuongCoBan" Type="Double" />
                <asp:Parameter Name="HeSo" Type="Double"></asp:Parameter>
                <asp:Parameter Name="PhuCap" Type="Double"></asp:Parameter>
                <asp:Parameter Name="HoTroKhac" Type="Double"></asp:Parameter>
                <asp:Parameter Name="BaoHiemBatBuoc" Type="Double" />
                <asp:Parameter Name="ThueTNCN" Type="Double" />
                <asp:Parameter Name="TangCa" Type="Double" />
                <asp:Parameter Name="Khac" Type="Double" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="MaLuong" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_HeSoBaoHiemBatBuoc]"></asp:SqlDataSource>

    </div>
    <div class="row">
    </div>

</asp:Content>

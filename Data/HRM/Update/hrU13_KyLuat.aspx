<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU13_KyLuat.aspx.vb" Inherits="HRM.hrU13_KyLuat" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT KỶ LUẬT
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
                    <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaKyLuat" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaKyLuat" HeaderText="Mã Kỷ Luật" SortExpression="MaKyLuat" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay"/>
                            <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" SortExpression="NoiDung" />
                            <asp:BoundField DataField="HinhThucKyLuat" HeaderText="Hình Thức Kỷ Luật" SortExpression="HinhThucKyLuat" />
                            <asp:BoundField DataField="ThoiHan" HeaderText="Thời Hạn" SortExpression="ThoiHan" />
                            <asp:BoundField DataField="DinhKem" HeaderText="Đính Kèm" SortExpression="DinhKem" />
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
                                <%--[Ngay], [NoiDung], [HinhThucKyLuat], [ThoiHan], [DinhKem], [GhiChu], [MaNhanVien]--%>
                                <table class="table table-responsive margin-top20">
                                    <tr>
                                        <td>Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgay" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgay_CalendarExtender" TargetControlID="txtNgay" ID="txtNgay_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Nội Dung:</td>
                                        <td>
                                           <asp:TextBox ID="txtNoiDung" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Hình Thức Kỷ Luật:</td>
                                        <td>
                                           <asp:TextBox ID="txtHinhThucKyLuat" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Thời Hạn: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtThoiHan" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtThoiHan_CalendarExtender" TargetControlID="txtThoiHan" ID="txtThoiHan_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>                                     
                                    <tr>
                                        <td>Đính Kèm:</td>
                                        <td>
                                           <asp:TextBox ID="txtDinhKem" runat="server"></asp:TextBox>
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
                           <%-- [Ngay], [NoiDung], [HinhThucKyLuat], [ThoiHan], [DinhKem], [GhiChu], [MaNhanVien]--%>
                            <ContentTemplate>
                                <table class="table table-responsive margin-top20">
                                    <tr>
                                        <td>Mã Kỷ Luật: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtMaKyLuat1" runat="server" ReadOnly="true"></asp:TextBox>
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
                                        <td>Nội Dung:</td>
                                        <td>
                                           <asp:TextBox ID="txtNoiDung1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Hình Thức Kỷ Luật:</td>
                                        <td>
                                           <asp:TextBox ID="txtHinhThucKyLuat1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Thời Hạn: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtThoiHan1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtThoiHan1_CalendarExtender" TargetControlID="txtThoiHan1" ID="txtThoiHan1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>                                     
                                    <tr>
                                        <td>Đính Kèm:</td>
                                        <td>
                                           <asp:TextBox ID="txtDinhKem1" runat="server"></asp:TextBox>
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
            SelectCommand="SELECT * FROM [hr_KyLuat] WHERE ([MaNhanVien] = @MaNhanVien)"
            InsertCommand="INSERT INTO [hr_KyLuat] ([Ngay], [NoiDung], [HinhThucKyLuat], [ThoiHan], [DinhKem], [GhiChu], [MaNhanVien]) VALUES (@Ngay, @NoiDung, @HinhThucKyLuat, @ThoiHan, @DinhKem, @GhiChu, @MaNhanVien)"
            UpdateCommand="UPDATE [hr_KyLuat] SET [Ngay] = @Ngay, [NoiDung] = @NoiDung, [HinhThucKyLuat] = @HinhThucKyLuat, [ThoiHan] = @ThoiHan, [DinhKem] = @DinhKem, [GhiChu] = @GhiChu, [MaNhanVien] = @MaNhanVien WHERE [MaKyLuat] = @MaKyLuat"
            DeleteCommand="DELETE FROM [hr_KyLuat] WHERE [MaKyLuat] = @MaKyLuat">
            <DeleteParameters>
                <asp:Parameter Name="MaKyLuat" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="NoiDung" Type="String" />
                <asp:Parameter Name="HinhThucKyLuat" Type="String" />
                <asp:Parameter Name="ThoiHan" DbType="Date" />
                <asp:Parameter Name="DinhKem" Type="String" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="NoiDung" Type="String" />
                <asp:Parameter Name="HinhThucKyLuat" Type="String" />
                <asp:Parameter Name="ThoiHan" DbType="Date" />
                <asp:Parameter Name="DinhKem" Type="String" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="MaKyLuat" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT DISTINCT [HoTen] FROM [vhr_NhanVien]">
        </asp:SqlDataSource>
    </div>

</asp:Content>

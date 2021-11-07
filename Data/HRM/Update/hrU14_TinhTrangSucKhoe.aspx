<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU14_TinhTrangSucKhoe.aspx.vb" Inherits="HRM.hrU14_TinhTrangSucKhoe" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT TÌNH TRẠNG SỨC KHỎE
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
                    <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaSucKhoe" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaSucKhoe" HeaderText="Mã Sức Khỏe" SortExpression="MaSucKhoe" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="NgayKham" HeaderText="Ngày Khám" SortExpression="NgayKham"/>
                            <asp:BoundField DataField="NoiDungKham" HeaderText="Nội Dung Khám" SortExpression="NoiDungKham" />
                            <asp:BoundField DataField="NoiKham" HeaderText="Nơi Khám" SortExpression="NoiKham" />
                            <asp:BoundField DataField="TinhTrangSucKhoe" HeaderText="Tình Trạng Sức Khỏe" SortExpression="TinhTrangSucKhoe" />
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
                                <%--[NgayKham], [NoiDungKham], [NoiKham], [TinhTrangSucKhoe], [MaNhanVien]--%>
                                <table class="table table-responsive margin-top20">
                                    <tr>
                                        <td>Ngày Khám: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayKham" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayKham_CalendarExtender" TargetControlID="txtNgayKham" ID="txtNgayKham_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Nội Dung Khám:</td>
                                        <td>
                                           <asp:TextBox ID="txtNoiDungKham" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>                                   
                                    <tr>
                                        <td>Nơi Khám:</td>
                                        <td>
                                           <asp:TextBox ID="txtNoiKham" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Tình Trạng Sức Khỏe:</td>
                                        <td>
                                           <asp:TextBox ID="txtTinhTrangSucKhoe" runat="server"></asp:TextBox>
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
                            <ContentTemplate>
                                <%--[NgayKham], [NoiDungKham], [NoiKham], [TinhTrangSucKhoe], [MaNhanVien]--%>
                                <table class="table table-responsive margin-top20">
                                    <tr>
                                        <td>Mã Sức Khỏe: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtMaSucKhoe1" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Ngày Khám: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayKham1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayKham1_CalendarExtender" TargetControlID="txtNgayKham1" ID="txtNgayKham1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Nội Dung Khám:</td>
                                        <td>
                                           <asp:TextBox ID="txtNoiDungKham1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>                                   
                                    <tr>
                                        <td>Nơi Khám:</td>
                                        <td>
                                           <asp:TextBox ID="txtNoiKham1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Tình Trạng Sức Khỏe:</td>
                                        <td>
                                           <asp:TextBox ID="txtTinhTrangSucKhoe1" runat="server"></asp:TextBox>
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
            SelectCommand="SELECT * FROM [hr_TinhTrangSucKhoe] WHERE ([MaNhanVien] = @MaNhanVien)"
            InsertCommand="INSERT INTO [hr_TinhTrangSucKhoe] ([NgayKham], [NoiDungKham], [NoiKham], [TinhTrangSucKhoe], [MaNhanVien]) VALUES (@NgayKham, @NoiDungKham, @NoiKham, @TinhTrangSucKhoe, @MaNhanVien)"
            UpdateCommand="UPDATE [hr_TinhTrangSucKhoe] SET [NgayKham] = @NgayKham, [NoiDungKham] = @NoiDungKham, [NoiKham] = @NoiKham, [TinhTrangSucKhoe] = @TinhTrangSucKhoe, [MaNhanVien] = @MaNhanVien WHERE [MaSucKhoe] = @MaSucKhoe"
            DeleteCommand="DELETE FROM [hr_TinhTrangSucKhoe] WHERE [MaSucKhoe] = @MaSucKhoe">
            <DeleteParameters>
                <asp:Parameter Name="MaSucKhoe" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NgayKham" DbType="Date" />
                <asp:Parameter Name="NoiDungKham" Type="String" />
                <asp:Parameter Name="NoiKham" Type="String" />
                <asp:Parameter Name="TinhTrangSucKhoe" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NgayKham" DbType="Date" />
                <asp:Parameter Name="NoiDungKham" Type="String" />
                <asp:Parameter Name="NoiKham" Type="String" />
                <asp:Parameter Name="TinhTrangSucKhoe" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="MaSucKhoe" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT DISTINCT [HoTen] FROM [vhr_NhanVien]">
        </asp:SqlDataSource>
    </div>

</asp:Content>

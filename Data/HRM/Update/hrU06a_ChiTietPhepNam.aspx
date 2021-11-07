<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU06a_ChiTietPhepNam.aspx.vb" Inherits="HRM.hrU06a_ChiTietPhepNam" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT CHI TIẾT PHÉP NĂM
        </div>

        <div class="list-group-item document">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table class="table">
                        <tr>
                            <td>Mã Phép Năm:</td>
                            <td>
                                <asp:Label ID="lblMaPhepNam" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click" CausesValidation="False"><i class="fe-plus-square"></i> Thêm Mới</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaChiTiet" AllowPaging="True" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs mauvang" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maudo" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaChiTiet" HeaderText="Mã Chi Tiết" SortExpression="MaChiTiet" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="TuNgay" HeaderText="Từ Ngày" SortExpression="TuNgay" DataFormatString="{0:MM/dd/yyyy}"/>                           
                            <asp:BoundField DataField="DenNgay" HeaderText="Đến Ngày" SortExpression="DenNgay" DataFormatString="{0:MM/dd/yyyy}"/>
                            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" SortExpression="SoLuong" DataFormatString="{0:#,0.00;(#,0.00)}"/>
                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu"/>
                            <asp:BoundField DataField="MaLoai" HeaderText="Mã Loại" SortExpression="MaLoai" />
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
                                <%--([TuNgay], [DenNgay], [SoLuong], [GhiChu], [MaLoai], [MaPhepNam]--%>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Từ Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtTuNgay" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtTuNgay_CalendarExtender" TargetControlID="txtTuNgay" ID="txtTuNgay_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Đến Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtDenNgay" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtDenNgay_CalendarExtender" TargetControlID="txtDenNgay" ID="txtDenNgay_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Số Lượng:</td>
                                        <td>
                                            <asp:TextBox ID="txtSoLuong" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Ghi Chú:</td>
                                        <td>
                                            <asp:TextBox ID="txtGhiChu" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>   
                                    <tr>
                                        <td>Loại Ngày Nghỉ:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaLoai" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
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
                                        <td>Mã Chi Tiết: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtMaChiTiet1" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Từ Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtTuNgay1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtTuNgay1_CalendarExtender" TargetControlID="txtTuNgay1" ID="txtTuNgay1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Đến Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtDenNgay1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtDenNgay1_CalendarExtender" TargetControlID="txtDenNgay1" ID="txtDenNgay1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Số Lượng:</td>
                                        <td>
                                            <asp:TextBox ID="txtSoLuong1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Ghi Chú:</td>
                                        <td>
                                            <asp:TextBox ID="txtGhiChu1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>   
                                    <tr>
                                        <td>Loại Ngày Nghỉ:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaLoai1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
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
            SelectCommand="SELECT * FROM [hr_ChiTietPhepNam] WHERE ([MaPhepNam] = @MaPhepNam)"
            InsertCommand="INSERT INTO [hr_ChiTietPhepNam] ([TuNgay], [DenNgay], [SoLuong], [GhiChu], [MaLoai], [MaPhepNam]) VALUES (@TuNgay, @DenNgay, @SoLuong, @GhiChu, @MaLoai, @MaPhepNam)"
            UpdateCommand="UPDATE [hr_ChiTietPhepNam] SET [TuNgay] = @TuNgay, [DenNgay] = @DenNgay, [SoLuong] = @SoLuong, [GhiChu] = @GhiChu, [MaLoai] = @MaLoai, [MaPhepNam] = @MaPhepNam WHERE [MaChiTiet] = @MaChiTiet"
            DeleteCommand="DELETE FROM [hr_ChiTietPhepNam] WHERE [MaChiTiet] = @MaChiTiet">
            <DeleteParameters>
                <asp:Parameter Name="MaChiTiet" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TuNgay" DbType="Date" />
                <asp:Parameter Name="DenNgay" DbType="Date" />
                <asp:Parameter Name="SoLuong" Type="Double" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaLoai" Type="String" />
                <asp:Parameter Name="MaPhepNam" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaPhepNam" SessionField="MaPhepNam" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="TuNgay" DbType="Date" />
                <asp:Parameter Name="DenNgay" DbType="Date" />
                <asp:Parameter Name="SoLuong" Type="Double" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaLoai" Type="String" />
                <asp:Parameter Name="MaPhepNam" Type="Int32" />
                <asp:Parameter Name="MaChiTiet" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_LoaiNgayNghi]"></asp:SqlDataSource>
    </div>
    <div class="row">
    </div>

</asp:Content>

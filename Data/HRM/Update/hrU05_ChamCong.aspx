<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Data/HRM/HR.Master" CodeBehind="hrU05_ChamCong.aspx.vb" Inherits="HRM.hrU05_ChamCong1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT CHẤM CÔNG
        </div>

        <div class="list-group-item document">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table class="table">
                        <tr>
                            <td>Mã Số Công Việc:</td>
                            <td>
                                <asp:Label ID="lblMaSoChamCong" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Mã Dự Án:</td>
                            <td>
                                <asp:Label ID="lblMaDuAnChamCong" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click" CausesValidation="False"><i class="fe-plus-square"></i> Thêm Mới</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" Width="100%" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaChamCong" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs mauvang" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maudo" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaChamCong" HeaderText="Mã Chấm Công" SortExpression="MaChamCong" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="NgayCong" HeaderText="Ngày Công" SortExpression="NgayCong" DataFormatString="{0:MM/dd/yyyy}"/>                           
                            <asp:BoundField DataField="LoaiCong" HeaderText="Loại Công" SortExpression="LoaiCong" />
                            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" SortExpression="SoLuong" DataFormatString="{0:#,0.00;(#,0.00)}"/>
                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu"/>
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
                                <%--[NgayCong], [LoaiCong], [SoLuong], [GhiChu], [MaNhanSuDuAn], [PhanLoai]--%>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Ngày Công: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayCong" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayCong_CalendarExtender" TargetControlID="txtNgayCong" ID="txtNgayCong_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Loại Công: (*)</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaLoai" runat="server" DataSourceID="SqlDataSource2" DataTextField="Cong" DataValueField="MaLoai"></asp:DropDownList>
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
                                        <td>Mã Chấm Công: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtMaChamCong1" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Ngày Công: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayCong1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayCong1_CalendarExtender" TargetControlID="txtNgayCong1" ID="txtNgayCong1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Loại Công: (*)</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaLoai1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Cong" DataValueField="MaLoai"></asp:DropDownList>
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
            SelectCommand="SELECT * FROM [hr_ChamCong] WHERE (([MaNhanSuDuAn] = @MaNhanSuDuAn))"
            InsertCommand="INSERT INTO [hr_ChamCong] ([NgayCong], [LoaiCong], [SoLuong], [GhiChu], [MaNhanSuDuAn], [PhanLoai]) VALUES (@NgayCong, @LoaiCong, @SoLuong, @GhiChu, @MaNhanSuDuAn, @PhanLoai)"
            UpdateCommand="UPDATE [hr_ChamCong] SET [NgayCong] = @NgayCong, [LoaiCong] = @LoaiCong, [SoLuong] = @SoLuong, [GhiChu] = @GhiChu, [MaNhanSuDuAn] = @MaNhanSuDuAn, [PhanLoai] = @PhanLoai WHERE [MaChamCong] = @MaChamCong"
            DeleteCommand="DELETE FROM [hr_ChamCong] WHERE [MaChamCong] = @MaChamCong">
            <DeleteParameters>
                <asp:Parameter Name="MaChamCong" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NgayCong" DbType="Date" />
                <asp:Parameter Name="LoaiCong" Type="String" />
                <asp:Parameter Name="SoLuong" Type="Double" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaNhanSuDuAn" Type="Int32" />
                <asp:Parameter Name="PhanLoai" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="lblMaSoChamCong" Name="MaNhanSuDuAn" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NgayCong" DbType="Date" />
                <asp:Parameter Name="LoaiCong" Type="String" />
                <asp:Parameter Name="SoLuong" Type="Double" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaNhanSuDuAn" Type="Int32" />
                <asp:Parameter Name="PhanLoai" Type="String" />
                <asp:Parameter Name="MaChamCong" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_Cong] ORDER BY [Cong]"></asp:SqlDataSource>
    </div>
    <div class="row">
    </div>

</asp:Content>

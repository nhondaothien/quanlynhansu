<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="STAFF.Master" CodeBehind="staffU_ChamCong.aspx.vb" Inherits="HRM.staffU_ChamCong" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                CẬP NHẬT CHẤM CÔNG
            </div>

            <div class="list-group-item">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="cbMaNhanVien" runat="server" DataSourceID="SqlDataSource3_NhanVien" DataTextField="HoTen" DataValueField="MaNhanVien" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="800px" DataKeyNames="MaSo" DataSourceID="SqlDataSource1_ChamCong">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="75px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="MaSo" HeaderText="Mã Số" InsertVisible="False" ReadOnly="True" SortExpression="MaSo">
                                    <ItemStyle Width="75px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MaDuAn" HeaderText="Mã Dự Án" SortExpression="MaDuAn">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TenDuAn" HeaderText="Tên Dự Án" SortExpression="TenDuAn" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="list-group-item document">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="MaChamCong" OnRowCommand="GridView3_RowCommand" DataSourceID="SqlDataSource1_ChiTietChamCong" Width="1000px">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaChamCong" HeaderText="Mã Chấm Công" SortExpression="MaChamCong" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField DataField="NgayCong" HeaderText="Ngày Công" SortExpression="NgayCong" DataFormatString="{0:MM/dd/yyyy}" />
                                <asp:BoundField DataField="LoaiCong" HeaderText="Loại Công" SortExpression="LoaiCong" />
                                <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" SortExpression="SoLuong" />
                                <asp:TemplateField HeaderText="Ghi Chú" SortExpression="GhiChu">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GhiChu") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("GhiChu") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MaNhanSuDuAn" HeaderStyle-CssClass="hidden-col" HeaderText="Mã Nhân Sự" ItemStyle-CssClass="hidden-col" SortExpression="MaNhanSuDuAn">
                                <HeaderStyle CssClass="hidden-col" />
                                <ItemStyle CssClass="hidden-col" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PhanLoai" HeaderStyle-CssClass="hidden-col" HeaderText="Phân Loại" ItemStyle-CssClass="hidden-col" SortExpression="PhanLoai">
                                <HeaderStyle CssClass="hidden-col" />
                                <ItemStyle CssClass="hidden-col" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>


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
                            <div class="modal-body p-4 mt-2">
                                <%--[MaChamCong], [NgayCong], [LoaiCong], [SoLuong], [GhiChu], [MaNhanSuDuAn]--%>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Mã Chấm Công (*)</label>
                                            <asp:TextBox ID="txtMaChamCong1" CssClass="form-control" runat="server" ReadOnly="True" BackColor="Gray"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Ngày Công (*)</label>
                                            <asp:TextBox ID="txtNgayCong1" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-3" class="control-label">Loại Công</label>
                                            <asp:DropDownList ID="cbLoaiCong1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1_Cong" DataTextField="Cong" DataValueField="MaLoai" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Số Lượng</label>
                                            <asp:DropDownList ID="cbSoLuong1" CssClass="form-control" runat="server">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>0.5</asp:ListItem>
                                                <asp:ListItem>0</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-5" class="control-label">Ghi Chú</label>
                                            <CKEditor:CKEditorControl ID="txtGhiChu1" Height="100" runat="server"></CKEditor:CKEditorControl>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-7" class="control-label">Mã Nhân Sự Dự Án</label>
                                            <asp:TextBox ID="txtMaNhanSuDuAn1" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-7" class="control-label">Phân Loại</label>
                                            <asp:TextBox ID="txtPhanLoai1" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
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
                            <asp:AsyncPostBackTrigger ControlID="GridView3" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!-- Kết thúc sửa -->


        <div>
            <asp:SqlDataSource ID="SqlDataSource1_ChamCong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT dts00_ChiTietNhanSuDuAn.MaSo, dts00_ChiTietNhanSuDuAn.MaNhanVien, dts00_ChiTietNhanSuDuAn.MaDuAn, dts00_DuAn.TenDuAn FROM dts00_ChiTietNhanSuDuAn INNER JOIN dts00_DuAn ON dts00_ChiTietNhanSuDuAn.MaDuAn = dts00_DuAn.MaDuAn WHERE (dts00_ChiTietNhanSuDuAn.MaNhanVien = @MaNhanVien)" DeleteCommand="DELETE FROM [dts00_ChiTietNhanSuDuAn] WHERE [MaSo] = @MaSo" InsertCommand="INSERT INTO dts00_ChiTietNhanSuDuAn(MaNhanVien, MaDuAn) VALUES (@MaNhanVien, @MaDuAn)" UpdateCommand="UPDATE [dts00_ChiTietNhanSuDuAn] SET [MaDuAn] = @MaDuAn WHERE [MaSo] = @MaSo">
                <DeleteParameters>
                    <asp:Parameter Name="MaSo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MaNhanVien" Type="String" />
                    <asp:Parameter Name="MaDuAn" Type="String" />

                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbMaNhanVien" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MaDuAn" Type="String" />
                    <asp:Parameter Name="MaSo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2_DuAn" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaDuAn, MaDuAn + '_' + TenDuAn As TenDuAn FROM dts00_DuAn"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3_NhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaNhanVien, MaNhanVien + N'_' + HoLot + N' ' + Ten AS HoTen FROM hr_NhanVien WHERE (Email = @email)">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="email" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1_DuAnEdit" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaDuAn, TenDuAn, MaDuAn + '_' + TenDuAn AS NoiDung FROM dts00_DuAn"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1_ChiTietChamCong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" DeleteCommand="DELETE FROM [hr_ChamCong] WHERE [MaChamCong] = @MaChamCong" InsertCommand="INSERT INTO [hr_ChamCong] ([NgayCong], [LoaiCong], [SoLuong], [GhiChu], [MaNhanSuDuAn], [PhanLoai]) VALUES (@NgayCong, @LoaiCong, @SoLuong, @GhiChu, @MaNhanSuDuAn, @PhanLoai)" SelectCommand="SELECT * FROM [hr_ChamCong] WHERE ([MaNhanSuDuAn] = @MaNhanSuDuAn)" UpdateCommand="UPDATE [hr_ChamCong] SET [NgayCong] = @NgayCong, [LoaiCong] = @LoaiCong, [SoLuong] = @SoLuong, [GhiChu] = @GhiChu, [MaNhanSuDuAn] = @MaNhanSuDuAn, [PhanLoai] = @PhanLoai WHERE [MaChamCong] = @MaChamCong">
                <DeleteParameters>
                    <asp:Parameter Name="MaChamCong" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="NgayCong" />
                    <asp:Parameter Name="LoaiCong" Type="String" />
                    <asp:Parameter Name="SoLuong" Type="Double" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                    <asp:Parameter Name="MaNhanSuDuAn" Type="Int32" />
                    <asp:Parameter Name="PhanLoai" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="MaNhanSuDuAn" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="NgayCong" />
                    <asp:Parameter Name="LoaiCong" Type="String" />
                    <asp:Parameter Name="SoLuong" Type="Double" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                    <asp:Parameter Name="MaNhanSuDuAn" Type="Int32" />
                    <asp:Parameter Name="PhanLoai" Type="String" />
                    <asp:Parameter Name="MaChamCong" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1_Cong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_Cong] ORDER BY [Cong]"></asp:SqlDataSource>
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

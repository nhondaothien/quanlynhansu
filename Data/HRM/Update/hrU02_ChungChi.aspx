<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU02_ChungChi.aspx.vb" Inherits="HRM.hrU02_ChungChi" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                CẬP NHẬT CHỨNG CHỈ
            </div>
            <div class="list-group-item document">
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
                        <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaChungChi" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaChungChi" HeaderText="MaChungChi" SortExpression="MaChungChi" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField DataField="SoChungChi" HeaderText="SoChungChi" SortExpression="SoChungChi"/>                           
                                <asp:BoundField DataField="TenChungChi" HeaderText="TenChungChi" SortExpression="TenChungChi"/>
                                <asp:BoundField DataField="CapBac" HeaderText="CapBac" SortExpression="CapBac"/>
                                <asp:BoundField DataField="NgayCap" HeaderText="NgayCap" SortExpression="NgayCap"/>
                                <asp:BoundField DataField="ThoiHan" HeaderText="ThoiHan" SortExpression="ThoiHan" />
                                <asp:BoundField DataField="DonViCap" HeaderText="DonViCap" SortExpression="DonViCap" />
                                <asp:BoundField DataField="GhiChu" HeaderText="GhiChu" SortExpression="GhiChu" />
                                <asp:BoundField DataField="DinhKem" HeaderText="DinhKem" SortExpression="DinhKem" />
                                <asp:BoundField DataField="MaLoai" HeaderText="MaLoai" SortExpression="MaLoai" />
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
                            <div class="modal-body margin-top20">
                                <%--([SoChungChi], [TenChungChi], [CapBac], [NgayCap], [ThoiHan], [DonViCap], [GhiChu], [DinhKem], [MaNhanVien], [MaLoai])--%>
                                <table class="table table-responsive">
                                     <tr>
                                        <td>Số Chứng Chỉ:</td>
                                        <td>
                                            <asp:TextBox ID="txtSoChungChi" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Tên Chứng Chỉ:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenChungChi" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Cấp Bậc:</td>
                                        <td>
                                            <asp:TextBox ID="txtCapBac" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>   
                                    <tr>
                                        <td>Ngày Cấp: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayCap" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayCap_CalendarExtender" TargetControlID="txtNgayCap" ID="txtNgayCap_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr> 
                                    
                                     <tr>
                                        <td>Thời Hạn:</td>
                                        <td>
                                            <asp:TextBox ID="txtThoiHan" CssClass="form-control" runat="server"></asp:TextBox>
                                             <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtThoiHan_CalendarExtender" TargetControlID="txtThoiHan" ID="txtThoiHan_CalendarExtender1"></ajaxToolkit:CalendarExtender>

                                        </td>
                                    </tr>  
                                     <tr>
                                        <td>Đơn Vị Cấp:</td>
                                        <td>
                                            <asp:TextBox ID="txtDonViCap" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>Ghi Chú:</td>
                                        <td>
                                            <asp:TextBox ID="txtGhiChu" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                     <tr>
                                        <td>Đính Kèm:</td>
                                        <td>
                                            <asp:TextBox ID="txtDinhKem" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                   
                                    <tr>
                                        <td>Mã Loại Chứng Chỉ:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaLoai" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="LoaiChungChi" DataValueField="MaLoai"></asp:DropDownList>
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

                                <table class="table table-responsive">
                                     <tr>
                                        <td>Mã Chứng Chỉ:</td>
                                        <td>
                                            <asp:TextBox ID="txtMaChungChi1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                     <tr>
                                        <td>Số Chứng Chỉ:</td>
                                        <td>
                                            <asp:TextBox ID="txtSoChungChi1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Tên Chứng Chỉ:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenChungChi1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Cấp Bậc:</td>
                                        <td>
                                            <asp:TextBox ID="txtCapBac1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>   
                                    <tr>
                                        <td>Ngày Cấp: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayCap1" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayCap1_CalendarExtender" TargetControlID="txtNgayCap1" ID="txtNgayCap1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr> 
                                    
                                     <tr>
                                        <td>Thời Hạn:</td>
                                        <td>
                                            <asp:TextBox ID="txtThoiHan1" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtThoiHan1_CalendarExtender" TargetControlID="txtThoiHan1" ID="txtThoiHan1_CalendarExtender1"></ajaxToolkit:CalendarExtender>

                                        </td>
                                    </tr>  
                                     <tr>
                                        <td>Đơn Vị Cấp:</td>
                                        <td>
                                            <asp:TextBox ID="txtDonViCap1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>Ghi Chú:</td>
                                        <td>
                                            <asp:TextBox ID="txtGhiChu1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                     <tr>
                                        <td>Đính Kèm:</td>
                                        <td>
                                            <asp:TextBox ID="txtDinhKem1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                
                                    <tr>
                                        <td>Mã Loại Chứng Chỉ:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaLoai1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="LoaiChungChi" DataValueField="MaLoai"></asp:DropDownList>
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
                            <div class="modal-body">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [hr_ChungChi] WHERE ([MaNhanVien] = @MaNhanVien)" DeleteCommand="DELETE FROM [hr_ChungChi] WHERE [MaChungChi] = @MaChungChi" InsertCommand="INSERT INTO [hr_ChungChi] ([SoChungChi], [TenChungChi], [CapBac], [NgayCap], [ThoiHan], [DonViCap], [GhiChu], [DinhKem], [MaNhanVien], [MaLoai]) VALUES (@SoChungChi, @TenChungChi, @CapBac, @NgayCap, @ThoiHan, @DonViCap, @GhiChu, @DinhKem, @MaNhanVien, @MaLoai)" UpdateCommand="UPDATE [hr_ChungChi] SET [SoChungChi] = @SoChungChi, [TenChungChi] = @TenChungChi, [CapBac] = @CapBac, [NgayCap] = @NgayCap, [ThoiHan] = @ThoiHan, [DonViCap] = @DonViCap, [GhiChu] = @GhiChu, [DinhKem] = @DinhKem, [MaNhanVien] = @MaNhanVien, [MaLoai] = @MaLoai WHERE [MaChungChi] = @MaChungChi">
            <DeleteParameters>
                <asp:Parameter Name="MaChungChi" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SoChungChi" Type="String" />
                <asp:Parameter Name="TenChungChi" Type="String" />
                <asp:Parameter Name="CapBac" Type="Int32" />
                <asp:Parameter DbType="Date" Name="NgayCap" />
                <asp:Parameter DbType="Date" Name="ThoiHan" />
                <asp:Parameter Name="DonViCap" Type="String" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="DinhKem" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="MaLoai" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="SoChungChi" Type="String" />
                <asp:Parameter Name="TenChungChi" Type="String" />
                <asp:Parameter Name="CapBac" Type="Int32" />
                <asp:Parameter DbType="Date" Name="NgayCap" />
                <asp:Parameter DbType="Date" Name="ThoiHan" />
                <asp:Parameter Name="DonViCap" Type="String" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="DinhKem" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="MaLoai" Type="String" />
                <asp:Parameter Name="MaChungChi" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_LoaiChungChi]"></asp:SqlDataSource>
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
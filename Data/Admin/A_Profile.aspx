<%@ Page Title="Profile" Language="vb" AutoEventWireup="false" MasterPageFile="~/Data/Admin/Admin.Master" CodeBehind="A_Profile.aspx.vb" Inherits="HRM.A_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                PROFILE
            </div>
            <div class="list-group-item">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="Username" CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>


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

                                <%-- ([Username], [Password], [FullName]) --%>
                                <table class="table">
                                    <tr>
                                        <td>Tài Khoản: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtTaiKhoan1" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Mật khẩu: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtMaKhau1" CssClass="form-control" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Họ và tên: (*) </td>
                                        <td>
                                            <asp:TextBox ID="txtHoTen1" CssClass="form-control" runat="server"></asp:TextBox>

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

        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                SelectCommand="SELECT * FROM [A00_TaiKhoanChu] WHERE ([Username] = @Username)"
                DeleteCommand="DELETE FROM [A00_TaiKhoanChu] WHERE [Username] = @Username"
                InsertCommand="INSERT INTO [A00_TaiKhoanChu] ([Username], [Password], [FullName]) VALUES (@Username, @Password, @FullName)"
                UpdateCommand="UPDATE [A00_TaiKhoanChu] SET [Password] = @Password, [FullName] = @FullName WHERE [Username] = @Username">
                <DeleteParameters>
                    <asp:Parameter Name="Username" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="FullName" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="FullName" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
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

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>

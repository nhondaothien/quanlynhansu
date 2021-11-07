<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="STAFF.Master" CodeBehind="staffU_DoiMatKhau.aspx.vb" Inherits="HRM.staffU_DoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">   
        <div class="list-group">
            <div class="list-group-item list-group-item-warning">
                ĐỔI MẬT KHẨU
            </div>
        </div>
        
        <div class="list-group">            
            <div class="list-group-item document">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsView1" CssClass="table table-responsive table-hover" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Email" DataSourceID="SqlDataSource_MatKhau" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <Fields>
                                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email">
                                <HeaderStyle Width="100px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Mật Khẩu" SortExpression="MatKhau">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtMatKhau1" runat="server" Text='<%# Bind("MatKhau") %>' TextMode="Password" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMatKhau1" ErrorMessage="Nhập Mật Khẩu mới"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtMatKhau2" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMatKhau2" ErrorMessage="Nhập Lại Mật Khẩu"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtMatKhau2" ControlToValidate="txtMatKhau1" ErrorMessage="Mật Khẩu Không Khớp"></asp:CompareValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MatKhau") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("MatKhau") %>' Visible="False"></asp:Label>
                                        ********
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                        </asp:DetailsView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
        </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource_MatKhau" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" DeleteCommand="DELETE FROM [A00_TaiKhoanNguoiDung] WHERE [Email] = @Email" InsertCommand="INSERT INTO [A00_TaiKhoanNguoiDung] ([Email], [MatKhau]) VALUES (@Email, @MatKhau)" SelectCommand="SELECT * FROM [A00_TaiKhoanNguoiDung] WHERE ([Email] = @Email)" UpdateCommand="UPDATE [A00_TaiKhoanNguoiDung] SET [MatKhau] = @MatKhau WHERE [Email] = @Email">
            <DeleteParameters>
                <asp:Parameter Name="Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="MatKhau" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Email" SessionField="Email" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MatKhau" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>

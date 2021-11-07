<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Data/Admin/Admin.Master" CodeBehind="A_Upload.aspx.vb" Inherits="HRM.A_Upload" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="CKFinder" Assembly="CKFinder" TagPrefix="CKFinder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                UPLOAD HÌNH ẢNH
            </div>
            <div class="list-group-item">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <form>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Hình Ảnh Url:</label>
                                <input type="text" name="n_thumb_url" id="n_thumb_url" class="form-control" />
                            </div>

                            <button id="n_browseServer" type="button" class="btn mauxanh">
                                <i class="fe-upload"></i> Upload
                            </button>
                        </form>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <script>
            function SetFileField(fileUrl) {
                jQuery('#n_thumb_url').val(fileUrl);
            }
            $("#n_browseServer").on("click", function () {
                var finder = new CKFinder();
                finder.basePath = '/ckfinder/';
                finder.selectActionFunction = SetFileField;
                finder.popup();
            });
        </script>
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

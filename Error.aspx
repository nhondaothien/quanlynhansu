<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/HRM.Master" CodeBehind="Error.aspx.vb" Inherits="HRM._Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="list-group" style="margin-top: 100px;">
        <div class="list-group-item list-group-item-warning">
            <h3>Error</h3>
            <p><asp:Label ID="lblError" runat="server" Text=""></asp:Label></p>            
        </div>
    </div>    
</asp:Content>

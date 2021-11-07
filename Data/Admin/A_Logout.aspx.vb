Public Class A_Logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("LoginOK") = False
        Session.RemoveAll()
    End Sub

End Class
Public Class HR
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'panel_management.Visible = False
        'panel_update.Visible = False
        'panel_admin.Visible = False

        'Select Case Session("hr")
        '    'Admin
        '    Case "Support"
        '        panel_management.Visible = True
        '        panel_update.Visible = True
        '        panel_admin.Visible = True

        '        'Update
        '    Case "Update"
        '        panel_management.Visible = True
        '        panel_update.Visible = True
        '        panel_admin.Visible = False

        '        'View
        '    Case "View"
        '        panel_management.Visible = True
        '        panel_update.Visible = False
        '        panel_admin.Visible = False

        '    Case Else
        '        panel_management.Visible = False
        '        panel_update.Visible = False
        '        panel_admin.Visible = False
        'End Select

        If Session("MaNhanVien") = "" Then
            'Panel2.Visible = False
            'Panel3.Visible = False
            'Panel4.Visible = False
            'Panel5.Visible = False
            'Panel6.Visible = False
            'Panel7.Visible = False
            'Panel8.Visible = False
            'Panel9.Visible = False
            'Panel10.Visible = False
            'Panel11.Visible = False
            'Panel12.Visible = False
            'Panel13.Visible = False
            Panel0.Visible = False
        End If


    End Sub

End Class
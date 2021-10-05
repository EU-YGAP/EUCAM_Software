Dim MCLUtil As Object
Dim bModuleInitialized As Boolean
Dim Class1 As Object 

Private Sub InitModule()
    If Not bModuleInitialized Then
        On Error GoTo Handle_Error
        If MCLUtil Is Nothing Then
            Set MCLUtil = CreateObject("MWComUtil.MWUtil9.5")
        End If
        Call MCLUtil.MWInitApplication(Application)
        
        bModuleInitialized = True
        Exit Sub
Handle_Error:
        bModuleInitialized = False
    End If
End Sub

Function bgapint50(Optional path As Variant, Optional namelist As Variant) As Variant

    On Error GoTo Handle_Error

    Call InitModule()

    If Class1 Is Nothing Then
        Set Class1 = CreateObject("bgapint50.Class1.1_0")
    End If

    Call Class1.bgapint50(path, namelist)
    bgapint50 = Empty

    Exit Function
Handle_Error:
    bgapint50 = "Error in " & Err.Source & ": " & Err.Description
End Function


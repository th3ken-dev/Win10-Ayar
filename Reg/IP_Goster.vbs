strComputer = "."

Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

Set colAdapters = objWMIService.ExecQuery _
    ("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True")
 
n = 1
 
For Each objAdapter in colAdapters
   
   
 
   If Not IsNull(objAdapter.IPAddress) Then
      For i = 0 To UBound(objAdapter.IPAddress)
     WScript.Echo "          " & objAdapter.IPAddress(i)
      Next
   End If
 
   n = n + 1
 
Next

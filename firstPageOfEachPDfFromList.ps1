﻿         
    $emptyPage = "G:\sbf\Livsmiljö\Gemensamt\mapbasic program projekt\organiserarFörMailboxen\tomtPdfBlad.pdf"
    $path = "C:\Users\crbk01\Desktop\Ny Mapp\Utförandeintyg"
    $list = "C:\Users\crbk01\Desktop\Södra.txt"
    $NumberOfPages = 1
    $cpdfPath = "C:\Users\crbk01\OneDrive\cpdf" 
    $flag = "-pages"   
 
 cd (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
. .\pdfReverse.ps1

reverse $emptyPage $path $list $NumberOfPages $cpdfPath $flag

 
   Remove-Item –path $list
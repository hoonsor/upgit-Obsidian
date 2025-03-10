#NoEnv
#SingleInstance, force
#Persistent


;●●● 自訂常用熱字串
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
:*:-*1::123@hotmail.com
:*:-*2::456@gmail.com
:*:-*3::789@gmail.com


;●●● F1按鍵轉換
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
F1::Ctrl


;●●● 輸入工作常用密碼
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & 1::
    Send_Text("A5872049")
return


;●●● 快速開啟AHK編輯器編輯AHK檔案
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CapsLock & a::
    ; %A_ScriptDir%\Others.ahk
	Call_ADE()
return


;●●● 單一介面
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CapsLock & z::
    Single_Interface("FF0000")
return


;●●● 快速符號輸入←
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CapsLock & s::
    Send ←
return

;●●● 快速符號輸入↓
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CapsLock & d::
    Send ↓
return

;●●● 快速符號輸入↑
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CapsLock & e::
    Send ↑
return

;●●● 快速符號輸入→
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CapsLock & f::
    Send →
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#c::
	Copy_Path()    
Return


;●●● 重新載入Autohotkey的腳本ahk Mouse(L)+r
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & r::
	Script_Reload()
return






;★★★快速開啟AHK檔案簡易IDE
;#################################################################################################################### 
Call_ADE() {
	Run D:\AutoGUI\AutoGUI.ahk
}



;★★★ 複製所選取檔案路徑（供其他地方呼叫用）
;####################################################################################################################
Copy_Path()
{
    Clipboard =
    Send,^c
    ClipWait
    path = %Clipboard%
    Clipboard = %path%
	ToolTip, 路徑: %path%
    Sleep, 1500
    ToolTip
    return
}



;★★★ AutoHotKey函式 ShowBShowBanner(x,y,z)anner(x,y,z) （供其他地方呼叫用）
;#################################################################################################################### 
Show_Banner(x,y,z)
{
    global
    Gui, -Caption +ToolWindow +LastFound +AlwaysOnTop
	
    Trans := 255
    Gui, Color, red
    Gui, font, s%y%, Verdana
    Gui, Add, Text,, %x%
    GuiControl, Text, String, % Text
	Gui, Show, center xcenter NoActivate, MyTransparentBanner
    WinSet, Transparent, %Trans%, MyTransparentBanner
    Sleep %z%
    
    Loop
    {
        if(Trans <= 0)
        {
            Trans := 0
            WinSet, Transparent, %Trans%, MyTransparentBanner
            break
        }
                
        WinSet, Transparent, %Trans%, MyTransparentBanner
        Trans := Trans - 5
        Sleep, 10
    }
    Gui, Destroy
    return
}



;★★★ 重新載入Autohotkey的腳本ahk Mouse(L)+r
;####################################################################################################################
Script_Reload()
{
    Show_Banner("AutoHotKey 重新載入腳本",8,500)
	reload
    return
}


;★★★文字以貼上方式輸入之通用函式（會覆蓋原本剪貼簿內容）
;#################################################################################################################### 
Send_Text(text) {
	Clipboard = %text%
	Sleep 200
	Send ^v
	return
}


;★★★單一介面
;#################################################################################################################### 
Single_Interface(_color)
{
    global
	Gui, Single_Interface:Destroy
    Gui, Single_Interface:New
	Gui, Single_Interface:color, %_color%
	Gui, Single_Interface:Add, Text,, 請輸入關鍵字：
	Gui, Single_Interface:Add, Edit, vLink
	Gui, Single_Interface:Add, Button, default w136, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.
	Gui, Single_Interface:Show,, 呼叫檔案
	return


    Single_InterfaceButtonOK:
	Gui, Single_Interface:Submit  ; Save the input from the user to each control's associated variable.
	switch Link
	{

;====================================== 以下為關西高中關鍵字=================================
        

        case "其他":   Run D:\●●工作資料\關西高中\150-其他人員（學習歷程行政助理、國教署計畫補助人員、資源教室輔導員、兼任助理）


        case "約用法規":  Run https://www.rootlaw.com.tw/LawArticle.aspx?LawID=A040160021008700-1130130
                          Run https://edu.law.moe.gov.tw/LawContent.aspx?id=GL001929
                          Run https://edu.law.moe.gov.tw/LawContent.aspx?id=GL001893
                          Run https://law.moj.gov.tw/LawClass/LawAll.aspx?PCode=N0030006
                          Run https://law.moj.gov.tw/LawClass/LawAll.aspx?PCode=N0030001
        case "學創法規":  Run https://edu.law.moe.gov.tw/LawContent.aspx?id=GL001926
                          Run https://edu.law.moe.gov.tw/LawContent.aspx?id=GL001601
                          Run https://law.moj.gov.tw/LawClass/LawAll.aspx?PCode=N0030006
                          Run https://law.moj.gov.tw/LawClass/LawAll.aspx?PCode=N0030001
        case "進修法規":  Run https://law.moj.gov.tw/LawClass/LawAll.aspx?PCode=S0050004
                          Run https://edu.law.moe.gov.tw/LawContent.aspx?id=FL008445
        case "考績法規":  Run https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=H0150002
                          Run https://law.moj.gov.tw/LawClass/LawAll.aspx?PCode=S0040001
                          Run https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=S0040002
        case "聘僱法規":  Run https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=S0110014
                          Run https://law.moj.gov.tw/LawClass/LawAll.aspx?PCode=S0020014
                          Run https://law.moj.gov.tw/LawClass/LawAll.aspx?PCode=S0020015
                          Run https://law.moj.gov.tw/LawClass/LawAll.aspx?PCode=A0030128        
                          Run https://www.rootlaw.com.tw/LawArticle.aspx?LawID=A040160021008700-1130130
	}
    
	;Gui, Destroy
	return
}


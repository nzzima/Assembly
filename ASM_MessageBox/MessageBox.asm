.386
.MODEL FLAT, stdCall

ExitProcess		PROTO		,:DWORD
MessageBoxA		PROTO		,:DWORD, :DWORD, :DWORD, :DWORD
CreateProcessA	PROTO		,:DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
FindWindowA		PROTO		,:DWORD, :DWORD
FindWindowExA	PROTO		,:DWORD, :DWORD, :DWORD, :DWORD
SendMessageA	PROTO		,:DWORD, :DWORD, :DWORD, :DWORD
SetWindowTextA	PROTO		,:DWORD, :DWORD
Sleep			PROTO		,:DWORD

.data
	MsgBoxCaption	db "Warning",0
	MsgBoxText		db "Press Ok to delete the universe",0
	AppName			db "C:\\Windows\\notepad", 0
	EnteringStr		db "Just look at this, it's wonderful ! :P                Edited by Krylov", 0
	externalArea	db "Notepad", 0
	internalArea	db "Edit", 0
	pi				db 1024 dup(?)
	syst			db 1024 dup(?)
	cwnd			dd 1024 dup(?)
	hwnd			dd 1024 dup(?)

.const
	NULL	= 0
	CANCEL	= 1
	OK		= 6
	msg		= 258

.code
	Main:
				mov ecx, 0
				INVOKE MessageBoxA, NULL, ADDR MsgBoxText, ADDR MsgBoxCaption, CANCEL

				cmp eax, 1
				je Open
				jmp Exit

		Open:
				INVOKE CreateProcessA, NULL , ADDR AppName, NULL, NULL, NULL, NULL, NULL, NULL, ADDR syst, ADDR pi
				INVOKE Sleep, 25
				INVOKE FindWindowA, ADDR externalArea, 0
									mov [hwnd], eax
									test eax, eax
									xor eax, eax

				INVOKE FindWindowExA, hwnd, 0, ADDR internalArea, 0
									mov [cwnd], eax
									test eax, eax
									lea esi, EnteringStr
									mov edx, 70
				op1: 
									push edx
									mov bl, [esi]
									INVOKE Sleep, 25
									INVOKE SendMessageA, cwnd, msg, bl, 0
									inc esi
									pop edx
									dec edx

									cmp edx, 0
									jnz op1
		Exit:
				INVOKE ExitProcess, 0
				
	end Main
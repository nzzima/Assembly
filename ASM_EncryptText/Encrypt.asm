.686
.MODEL FLAT, stdCall, C
.CODE

Encrypt proc	Key:DWORD, KeySize:DWORD, Text:DWORD, TextSize:DWORD
				
			push ebx
			push eax
			push ecx
			push edx
			push edi
			push esi

			mov esi, Key
			mov edi, Text
			mov ecx, KeySize
			xor ebx, ebx

	Update:
			xor eax, eax
			xor edx, edx

			mov al, [esi]
			xor [edi + ebx], al
			inc ebx
			inc edx
			push ax
			mov eax, textSize
			cmp ebx, eax
			je Exit

	Change:
			pop ax

	Run:
			xor al,[esi+edx] 
            push [esi+edx]
            pop [esi+edx-1]
            inc edx
            cmp ecx,edx
            je Run
            jmp Update

	Exit:        
			pop esi 
			pop edi 
			pop edx 
			pop ecx
			pop eax
			pop ebx
			ret

Encrypt ENDP
END 
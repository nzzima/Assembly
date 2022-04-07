.686
.MODEL FLAT, stdCall, C
.STACK

.CODE

BubbleSort proc Arr:DWORD, Lenght:DWORD
	mov esi, Arr
a2:
	mov ecx, [Lenght]
	xor ebx, ebx 

a3:	mov		eax, [esi + ecx * 4 - 4 ]
	cmp		[esi + ecx * 4], eax
	jnb		a1
	setna	bl
	xchg	eax, [esi + ecx * 4]
	mov		[esi + ecx * 4 - 4], eax

a1:	loop a3
	add		esi, 4
	dec		ebx
	jnz		exit
	dec		Lenght
	jnz		a2

exit: ret

BubbleSort endp
end
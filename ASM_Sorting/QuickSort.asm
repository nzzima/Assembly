.686
.MODEL FLAT, stdCall, C
.STACK

.CODE

Partition proc	Lb:DWORD,	Ub:DWORD            ;���������� ����� pivot

	    mov edx, Ub
        sub edx, eax
        shr edx, 3                              ;(Ub-Lb)/2

        mov edi, [eax + edx * 4]                ;�������� ��������� �� pivot

        cmp eax, Ub
        ja short b0

b1:     mov eax, Lb                             ;����� ��������, �������� ��� pivot, � ������ ����� �������
        cmp [eax], edi   
        jnl short b3       
        add Lb, 4   
        jmp short b1

b4:     sub Ub, 4                               ;����� ��������, �������� ��� pivot, � ������� ����� �������

b3:     mov eax, Ub
        cmp [eax], edi       
        jg short b4
        
        mov ecx, Lb
        cmp ecx, eax            
        ja short b5
        
        sub Ub, 4        
        add Lb, 4        
        mov edx, [eax]        
        xchg edx, [ecx]       
        mov [eax], edx
        
b5:     mov eax, Lb
        cmp eax, Ub
        jbe short b1
        
b0:     pop ebp
        retn 8

Partition endp


QuickSort proc  Lb:DWORD, Ub:DWORD

         mov eax, Lb
         cmp eax, Ub 
         jnb short exit1                        ;����������� ������ ������

         push Ub
         push eax     
         call Partition

         mov edi, eax                           ;eax=pivot_ptr
         sub eax, 4                             ;pivot_ptr-1
         push eax
         push Lb    
         call QuickSort                         ;����������� ��, ��� ����� �� pivot

         push Ub
         push edi                               ;edi=pivot_ptr
         call QuickSort                         ;����������� ��, ��� ������ �� pivot

exit1:   pop ebp
         retn 8

QuickSort endp
end
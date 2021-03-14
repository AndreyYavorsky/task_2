section .data
	array dw -1, 4, 3, 0, -5, 6, 7, 8, 9, 10, 11, 12 ; Сумма 64, сумма с инвер. 76
						; Объявление массива из 12 элементов
	sum dw 0            ; Выделение памяти для суммы

section .text 
	global _start

_start:
	
	mov eax, 12			; Количество элементов в массиве
	xor ebx, ebx		; Сумма
	mov ecx, array      ; Указатель на элемент массива

for:
	mov dx, [ecx]       ; Помещаем значение  элемента массива в dx
	cmp dx, 0           ; Сравиваем значение элемента массива с 0
	jl invert           ; Если значение меньше нуля то переход
	add ebx, edx		; Суммируем значения эдементов массива в ebx
	add ecx, 2			; Адрес следующего элемента
	dec eax				; Уменьшаем счетчик кол-ва элементов
	jnz for             ; если счетчик не равен 0, то тогда выполняем цикл
	jmp display         ; Переход к след. части программы


invert:
	not dx			    ; Инвертируем и добавляем еденицу, чтобы инвертировать число
	inc dx
	add ebx, edx		; Суммируем значения эдементов массива в ebx
	add ecx, 2			; Адрес следующего элемента
	dec eax				; Уменьшаем счетчик кол-ва элементов
	jnz for 			; если счетчик не равен 0, то тогда выполняем цикл


display:

	mov [sum], ebx		; Записываем значение суммы элементов массива в sum
	mov edx, 1			; Кол-во выводимых элементов
	mov ecx, sum        ; Что выводим
	mov ebx, 1			; файловый дескриптор (stdout)
	mov eax, 4          ; Номер прерывание (sys_write)
	int 0x80			; Вызов прерывания 

	mov eax, 1			; Номер прерывание (sys_exit)
	int 0x80			; Вызов прерывания 

	array dw -1, 4, 3, 0, -5, 6, 7, 8, 9, 10, 11, 12 ; Сумма 64, сумма с инвер. 76
						; Объявление массива из 12 элементов
	sum dw 0            ; Выделение памяти для суммы
ASSUME CS:CODE,DS:DATA
    DATA SEGMENT
        STRING DB 1H,2H,3H,4H,5H
        M1 DB 10,"FOUND$"
        M2 DB 10,"NOT FOUND$"
        M3 DB "ENTER THE KEY:$"
    DATA ENDS

    PRTMSG MACRO MESSAGE
        LEA DX,MESSAGE
        MOV AH,09
        INT 21H
    ENDM

    GETDCM MACRO
        MOV AH,01
        INT 21H
        SUB AL,30H
    ENDM

    CODE SEGMENT
        START:MOV AX,DATA
        MOV DS,AX
        PRTMSG M3
        GETDCM
        LEA SI,STRING
        MOV CX,05H

        UP:
        MOV BL,[SI]
        CMP AL,BL
        JZ FO
        INC SI
        DEC CX
        JNZ UP
        PRTMSG M2
        JMP END1
        FO:
        PRTMSG M1
        END1:
        MOV AH,4CH
        INT 21H
        INT 3
    CODE ENDS
    END START

*&---------------------------------------------------------------------*
*& Report z11_local_calc
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z11_local_calc.
TYPES:    ty_number TYPE p LENGTH 5 DECIMALS 2.
PARAMETERS: number_1 TYPE ty_number,
            operator TYPE c DEFAULT '+',
            number_2 TYPE ty_number.

WRITE number_1 && '​ ​' && operator && ' ​​' && number_2 && ' = '.

DATA P_sol TYPE string.

DATA(result_fm) = VALUE decfloat34( ).

CASE operator.
  WHEN '+'.
    P_sol = number_1 + number_2.
    WRITE P_sol.
  WHEN '-'.
    P_sol = number_1 - number_2.
    WRITE P_sol.
  WHEN '*' OR 'X'.
    P_sol = number_1 * number_2.
    WRITE P_sol.
  WHEN '/' OR ':'.
    IF number_2 = 0.
      WRITE |{ TEXT-nd0 }|.
    ELSE.
      P_sol = number_1 / number_2.
      WRITE P_sol.
    ENDIF.
  WHEN '^'.
    IF number_1 = 0 AND number_2 = 0.
      WRITE |{ TEXT-nne }|.
    ELSE.
      P_sol = 1.
      IF number_2 < 0.
        number_2 *= -1.
        DO number_2 TIMES.
          P_sol *= number_1.
        ENDDO.
        P_sol = 1 / P_sol.
      ELSE.
        DO number_2 TIMES.
          P_sol *= number_1.
        ENDDO.
      ENDIF.

      CASE sy-subrc.
        WHEN 1.
          WRITE |{ TEXT-nne }|.
      ENDCASE.
      IF sy-subrc <> 0.
      ELSE.
        WRITE P_sol.
      ENDIF.
    ENDIF.
  WHEN '%'.
    IF number_2 = 0.
      WRITE |{ TEXT-nd0 }|.
    ELSE.
      P_sol = number_1 / number_2.
      P_sol *= 100.
      WRITE P_sol && '%'.
    ENDIF.
ENDCASE.

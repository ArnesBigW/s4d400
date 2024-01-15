*&---------------------------------------------------------------------*
*& Report z05_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_test.

PARAMETERS:
  fname TYPE name,
  lname TYPE name,
  bdate TYPE dats.

DATA(age) = ( sy-datlo - bdate ) DIV '365.2425'.

WRITE:  |{ TEXT-nom }|, fname && '​ ​' && lname, / |{  TEXT-dob }|, bdate, / |{ TEXT-age } { age }|.

IF age >= 21.
  WRITE / |{ TEXT-ead }|.
ELSEIF age >= 18.
  WRITE / |{ TEXT-adt }|.
ELSEIF age >= 13.
  WRITE / |{ TEXT-tee }|.
ELSE.
  WRITE / |{ TEXT-chl }|.
ENDIF.

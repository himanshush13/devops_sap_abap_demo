*&---------------------------------------------------------------------*
*& Report z_demo_calc
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_demo_calc.


CLASS lcl_calc DEFINITION.
  PUBLIC SECTION.
    METHODS: calc_sum
        IMPORTING
          operand TYPE i
        RETURNING
          value(r_return) TYPE i.
ENDCLASS.                    "lcl_calc DEFINITION

CLASS lcl_test DEFINITION FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.
  PUBLIC SECTION.
    METHODS:
      m_sum FOR TESTING.
ENDCLASS.                    "lcl_test DEFINITION

START-OF-SELECTION.

CLASS lcl_calc IMPLEMENTATION.
  METHOD calc_sum.
    r_return = operand * operand.
  ENDMETHOD.                    "calc_sum
ENDCLASS.                    "lcl_calc IMPLEMENTATION

CLASS lcl_test IMPLEMENTATION.
 METHOD m_sum.
    DATA:
      lo_calc TYPE REF TO lcl_calc,
      l_result TYPE i.

    CREATE OBJECT lo_calc.
    l_result = lo_calc->calc_sum( 3 ).

    cl_aunit_assert=>assert_equals(
      exp = 6
      act = l_result
      msg = 'Wrong result'
    ).
  ENDMETHOD.                    "m_sum
ENDCLASS.                    "lcl_test IMPLEMENTATION

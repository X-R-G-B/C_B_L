       $set repository "update on"
       FUNCTION-ID. SHOW-STATE.

       DATA DIVISION.

       LINKAGE SECTION.
           01 NB-LIFE pic 9(2).
           01 NB-LIFE-RES pic 9(2).

       PROCEDURE DIVISION USING NB-LIFE RETURNING NB-LIFE-RES.
           MOVE NB-LIFE TO NB-LIFE-RES.

       END FUNCTION SHOW-STATE.

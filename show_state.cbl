       $set repository "update on"
       FUNCTION-ID. SHOW-STATE.

       DATA DIVISION.

       LINKAGE SECTION.
           01 NB-LIFE pic 9(2).
           01 NB-LIFE-RES pic 9(2).

       SCREEN SECTION.
       01 SHOW-LIFE-0.
            02 LINE 15 COL 1 VALUE "        |-------|".
            02 LINE 16 COL 1 VALUE "        |       |".
            02 LINE 17 COL 1 VALUE "        |       O".
            02 LINE 18 COL 1 VALUE "        |     --|--".
            02 LINE 19 COL 1 VALUE "        |       |".
            02 LINE 20 COL 1 VALUE "        |      | |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-1.
            02 LINE 15 COL 1 VALUE "        |-------|".
            02 LINE 16 COL 1 VALUE "        |       |".
            02 LINE 17 COL 1 VALUE "        |       O".
            02 LINE 18 COL 1 VALUE "        |     --|--".
            02 LINE 19 COL 1 VALUE "        |       |".
            02 LINE 20 COL 1 VALUE "        |      |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-2.
            02 LINE 15 COL 1 VALUE "        |-------|".
            02 LINE 16 COL 1 VALUE "        |       |".
            02 LINE 17 COL 1 VALUE "        |       O".
            02 LINE 18 COL 1 VALUE "        |     --|--".
            02 LINE 19 COL 1 VALUE "        |       |".
            02 LINE 20 COL 1 VALUE "        |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-3.
            02 LINE 15 COL 1 VALUE "        |-------|".
            02 LINE 16 COL 1 VALUE "        |       |".
            02 LINE 17 COL 1 VALUE "        |       O".
            02 LINE 18 COL 1 VALUE "        |     --|--".
            02 LINE 19 COL 1 VALUE "        |".
            02 LINE 20 COL 1 VALUE "        |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-4.
            02 LINE 15 COL 1 VALUE "        |-------|".
            02 LINE 16 COL 1 VALUE "        |       |".
            02 LINE 17 COL 1 VALUE "        |       O".
            02 LINE 18 COL 1 VALUE "        |     --|".
            02 LINE 19 COL 1 VALUE "        |".
            02 LINE 20 COL 1 VALUE "        |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-5.
            02 LINE 15 COL 1 VALUE "        |-------|".
            02 LINE 16 COL 1 VALUE "        |       |".
            02 LINE 17 COL 1 VALUE "        |       O".
            02 LINE 18 COL 1 VALUE "        |       |".
            02 LINE 19 COL 1 VALUE "        |".
            02 LINE 20 COL 1 VALUE "        |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-6.
            02 LINE 15 COL 1 VALUE "        |-------|".
            02 LINE 16 COL 1 VALUE "        |       |".
            02 LINE 17 COL 1 VALUE "        |       O".
            02 LINE 18 COL 1 VALUE "        |".
            02 LINE 19 COL 1 VALUE "        |".
            02 LINE 20 COL 1 VALUE "        |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-7.
            02 LINE 15 COL 1 VALUE "        |-------|".
            02 LINE 16 COL 1 VALUE "        |       |".
            02 LINE 17 COL 1 VALUE "        |".
            02 LINE 18 COL 1 VALUE "        |".
            02 LINE 19 COL 1 VALUE "        |".
            02 LINE 20 COL 1 VALUE "        |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-8.
            02 LINE 15 COL 1 VALUE "        |-------|".
            02 LINE 16 COL 1 VALUE "        |".
            02 LINE 17 COL 1 VALUE "        |".
            02 LINE 18 COL 1 VALUE "        |".
            02 LINE 19 COL 1 VALUE "        |".
            02 LINE 20 COL 1 VALUE "        |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-9.
            02 LINE 15 COL 1 VALUE "        |".
            02 LINE 16 COL 1 VALUE "        |".
            02 LINE 17 COL 1 VALUE "        |".
            02 LINE 18 COL 1 VALUE "        |".
            02 LINE 19 COL 1 VALUE "        |".
            02 LINE 20 COL 1 VALUE "        |".
            02 LINE 21 COL 1 VALUE "        |".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-10.
            02 LINE 15 COL 1 VALUE " ".
            02 LINE 16 COL 1 VALUE " ".
            02 LINE 17 COL 1 VALUE " ".
            02 LINE 18 COL 1 VALUE " ".
            02 LINE 19 COL 1 VALUE " ".
            02 LINE 20 COL 1 VALUE " ".
            02 LINE 21 COL 1 VALUE " ".
            02 LINE 22 COL 1 VALUE "------------------".
       01 SHOW-LIFE-11.
            02 LINE 15 COL 1 VALUE " ".
            02 LINE 16 COL 1 VALUE " ".
            02 LINE 17 COL 1 VALUE " ".
            02 LINE 18 COL 1 VALUE " ".
            02 LINE 19 COL 1 VALUE " ".
            02 LINE 20 COL 1 VALUE " ".
            02 LINE 21 COL 1 VALUE " ".
            02 LINE 22 COL 1 VALUE " ".


       PROCEDURE DIVISION USING NB-LIFE RETURNING NB-LIFE-RES.
           MOVE NB-LIFE TO NB-LIFE-RES.
           IF NB-LIFE = 0 THEN
                   DISPLAY SHOW-LIFE-0
           END-IF.
           IF NB-LIFE = 1 THEN
                   DISPLAY SHOW-LIFE-1
           END-IF.
           IF NB-LIFE = 2 THEN
                   DISPLAY SHOW-LIFE-2
           END-IF.
           IF NB-LIFE = 3 THEN
                   DISPLAY SHOW-LIFE-3
           END-IF.
           IF NB-LIFE = 4 THEN
                   DISPLAY SHOW-LIFE-4
           END-IF.
           IF NB-LIFE = 5 THEN
                   DISPLAY SHOW-LIFE-5
           END-IF.
           IF NB-LIFE = 6 THEN
                   DISPLAY SHOW-LIFE-6
           END-IF.
           IF NB-LIFE = 7 THEN
                   DISPLAY SHOW-LIFE-7
           END-IF.
           IF NB-LIFE = 8 THEN
                   DISPLAY SHOW-LIFE-8
           END-IF.
           IF NB-LIFE = 9 THEN
                   DISPLAY SHOW-LIFE-9
           END-IF.
           IF NB-LIFE = 10 THEN
                   DISPLAY SHOW-LIFE-10
           END-IF.
           IF NB-LIFE = 11 THEN
                   DISPLAY SHOW-LIFE-11
           END-IF.

       END FUNCTION SHOW-STATE.

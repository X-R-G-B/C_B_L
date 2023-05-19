       IDENTIFICATION DIVISION.
       PROGRAM-ID. pendu.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILE-WORDS ASSIGN TO 'assets/word_list.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD FILE-WORDS.
       01 ligne-du-fichier.
           88 END-OF-FILE VALUE HIGH-VALUES.
           05 MOT PIC X(30).

       WORKING-STORAGE SECTION.
       77 CURR-WORD PIC X(30).
       77 WORD-RES PIC X(30).
       77 NB-WORDS PIC 9(3).
       77 WORD-INDEX PIC 9(3).
       77 STATE-WON PIC X(1).
       88 IS-WON VALUE "Y".
       77 STATE-LOSE PIC X(1).
       88 IS-LOSE VALUE "Y".
       77 INPUT-VALUE PIC a(1).
       77 I PIC 9 VALUE 1.
       77 STATE-LETTER-FOUND PIC X(1).
       88 IS-LETTER-FOUND VALUE "Y".
       77 NB-LIFE PIC 9(2).


       SCREEN SECTION.
       01 SHOW-WORD.
           02 LINE 1 COL 1 VALUE "Mot: ".
           02 LINE 1 COL 6 PIC X(30) FROM CURR-WORD.

       01 SHOW-NB-WORD.
           02 LINE 2 COL 1 VALUE "Nombre de mot: ".
           02 LINE 2 COL 17 PIC 9(3) FROM NB-WORDS.

       01 SHOW-INDEX-WORD.
           02 LINE 3 COL 1 VALUE "Index: ".
           02 LINE 3 COL 8 PIC 9(3) FROM WORD-INDEX.

       01 ASK-LETTER-OR-WORD.
           02 LINE 10 COL 1 VALUE "Entrez un mot: ".
           02 INPUT-ENTERED PIC a(1) TO INPUT-VALUE REQUIRED.

       01 SHOW-RES-WORD.
           02 BLANK SCREEN.
           02 LINE 5 COL 1 VALUE "Mot: ".
           02 LINE 5 COL 6 PIC X(30) FROM WORD-RES.
       01 SHOW-CHAR-ENTERED.
           02 LINE 6 COL 1 VALUE "Lettre: ".
           02 LINE 6 COL 9 PIC a(1) FROM INPUT-VALUE.

       01 SHOW-LETTER-FOUND.
           02 LINE 1 COL 1 VALUE "✅ Lettre trouvee ! => ".
           02 LINE 1 COL 25 PIC X(1) FROM INPUT-VALUE.

       01 SHOW-LETTER-NOT-FOUND.
           02 LINE 1 COL 1 VALUE
               "❌ LA LETTRE N'EST PAS PRESENTES DANS LE MOT".

       01 END-WINNER.
           02 LINE 1 COL 1 VALUE "✅ Vous avez gagné !".

       01 END-LOSER.
           02 LINE 1 COL 1 VALUE "❌ Vous avez perdu !".

       01 END-UNKNOW.
           02 LINE 1 COL 1 VALUE "❌ Une erreur s'est produite".

       PROCEDURE DIVISION.
       MOVE "N" TO STATE-WON.
       MOVE "N" TO STATE-LOSE.
       MOVE 11 TO NB-LIFE.
       PERFORM COUNT-WORD.
       IF NB-WORDS = 0
           STOP RUN.
       PERFORM GET-RANDOM-WORD.
       PERFORM INIT-WORD-RES.
       PERFORM UNTIL IS-WON OR IS-LOSE
           PERFORM ASK-INPUT
           DISPLAY SHOW-RES-WORD
           IF IS-LETTER-FOUND THEN
               DISPLAY SHOW-LETTER-FOUND
           ELSE
               DISPLAY SHOW-LETTER-NOT-FOUND
               ADD -1 TO NB-LIFE
           END-IF
           PERFORM CHECK-FOR-WIN
       END-PERFORM.
       DISPLAY SHOW-WORD.
       IF IS-WON THEN
           DISPLAY END-WINNER
       ELSE IF IS-LOSE THEN
           DISPLAY END-LOSER
       ELSE
           DISPLAY END-UNKNOW
       END-IF
       STOP RUN.

       COUNT-WORD.
           INITIALIZE NB-WORDS.
           OPEN INPUT FILE-WORDS.
           PERFORM UNTIL END-OF-FILE
               ADD 1 TO NB-WORDS
               PERFORM READ-WORD
           END-PERFORM.
           ADD -2 TO NB-WORDS.
           CLOSE FILE-WORDS.

       READ-WORD.
           READ FILE-WORDS
             AT END SET END-OF-FILE TO TRUE
           END-READ.
           MOVE MOT TO CURR-WORD.

       GET-RANDOM-WORD.
           PERFORM GET-RANDOM-INDEX.
           OPEN INPUT FILE-WORDS
           PERFORM UNTIL WORD-INDEX = 0
               PERFORM READ-WORD
               COMPUTE WORD-INDEX = WORD-INDEX - 1
           END-PERFORM.
           CLOSE FILE-WORDS.

       GET-RANDOM-INDEX.
           COMPUTE WORD-INDEX =
               FUNCTION RANDOM(FUNCTION NUMVAL(FUNCTION
               CURRENT-DATE(9:6)) * 100) * 1000
           DIVIDE WORD-INDEX BY NB-WORDS GIVING WORD-INDEX
           REMAINDER WORD-INDEX.
           ADD 1 TO WORD-INDEX.

       ASK-INPUT.
           DISPLAY ASK-LETTER-OR-WORD.
           ACCEPT INPUT-ENTERED.
           MOVE "N" TO STATE-LETTER-FOUND.
           initialize I.
       PERFORM UNTIL CURR-WORD(I:1) = ";"
           IF CURR-WORD(I:1) = INPUT-VALUE THEN
               STRING INPUT-VALUE DELIMITED BY SIZE
                      INTO WORD-RES(I:1)
               MOVE "Y" TO STATE-LETTER-FOUND
           END-IF
           DISPLAY SHOW-CHAR-ENTERED
           ADD 1 TO I
       END-PERFORM.

       INIT-WORD-RES.
           PERFORM UNTIL CURR-WORD(I:1) = ";"
               MOVE "_" TO WORD-RES(I:1)
               ADD 1 TO I
           END-PERFORM.

       CHECK-FOR-WIN.
           MOVE "Y" TO STATE-WON.
           INITIALIZE I.
           IF NB-LIFE = 0 THEN
               MOVE "Y" TO STATE-LOSE
           END-IF
           PERFORM UNTIL CURR-WORD(I:1) = ";"
               IF WORD-RES(I:1) = "_" THEN
                   MOVE "N" TO STATE-WON
               END-IF
               ADD 1 TO I
           END-PERFORM.

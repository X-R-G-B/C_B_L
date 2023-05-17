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
       77 CURRENT-WORD PIC X(30).
       77 NB-WORDS PIC 9(3).

       SCREEN SECTION.
       01 SHOW-WORD.
           02 LINE 1 COL 1 VALUE "Mot: ".
           02 LINE 1 COL 6 PIC X(30) FROM CURRENT-WORD.

       01 SHOW-NB-WORD.
           02 LINE 2 COL 1 VALUE "Nombre de mot: ".
           02 LINE 2 COL 17 PIC 9(3) FROM NB-WORDS.

       PROCEDURE DIVISION.
       PERFORM COUNT-WORD.
       DISPLAY SHOW-NB-WORD.
       STOP RUN.

       COUNT-WORD.
           INITIALIZE NB-WORDS.
           OPEN INPUT FILE-WORDS.
           PERFORM UNTIL END-OF-FILE
               ADD 1 TO NB-WORDS
               PERFORM READ-WORD
           END-PERFORM.
           ADD -1 TO NB-WORDS.
           CLOSE FILE-WORDS.

       READ-WORD.
           READ FILE-WORDS
               AT END SET END-OF-FILE TO TRUE
           END-READ.

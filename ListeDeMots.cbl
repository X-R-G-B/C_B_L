       IDENTIFICATION DIVISION.
       PROGRAM-ID. ListeDeMots.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT MONFICHIER ASSIGN TO 'assets/word_list.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
 
       DATA DIVISION.
       FILE SECTION.
       FD MONFICHIER.
       01 LIGNE-DU-FICHIER.
           88 FIN-DE-FICHIER       VALUE HIGH-VALUES.
           05 MOT                  PIC X(30).
       
       WORKING-STORAGE SECTION.
       01 MOT-AFFICHAGE PIC X(30).
       
       SCREEN SECTION.
       01 MOT-ECRAN.
           02 LINE 1 COL 1 VALUE "Mot: ".
           02 LINE 1 COL 6 PIC X(30) FROM MOT-AFFICHAGE.
       
       PROCEDURE DIVISION.
       Debut.
           OPEN INPUT MONFICHIER.
           PERFORM LIRE-MOT
           PERFORM UNTIL FIN-DE-FICHIER
               MOVE MOT TO MOT-AFFICHAGE
               DISPLAY MOT-ECRAN
               PERFORM LIRE-MOT
           END-PERFORM.
           CLOSE MONFICHIER.
           STOP RUN.
       
       LIRE-MOT.
           READ MONFICHIER
               AT END SET FIN-DE-FICHIER TO TRUE
           END-READ.
       

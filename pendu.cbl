       IDENTIFICATION DIVISION.
       PROGRAM-ID. pendu.
      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 nb1 PIC 9(5).
       77 nb2 PIC 9(5).
       77 result PIC 9(15).
      
       SCREEN SECTION.
       1 pls-input.
           2 BLANK SCREEN.
           2 LINE 6 COL 10 VALUE 'Saisir une valeur 1 : '.
           2 PIC z(5) TO nb1 REQUIRED.
           2 LINE 7 COL 10 VALUE 'Saisir une valeur 2 : '.
           2 PIC z(5) TO nb2 REQUIRED.

       1 pla-result.
           2 BLANK SCREEN.
           2 LINE 8 COL 10 VALUE 'Resultats : '.
           2 COL 30 PIC z(15) FROM result.
      
       PROCEDURE DIVISION.
      
       DISPLAY pls-input.
       ACCEPT pls-input.
       COMPUTE result = nb1 * nb2.
       DISPLAY pla-result.
      
       STOP RUN.
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FolhaDePagamento.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NomeFuncionario    PIC X(30).
       01 HorasTrabalhadas   PIC 9(3).
       01 SalarioHora        PIC 9(5)V99 VALUE 10.
       01 SalarioBruto       PIC 9(7)V99.
       01 SALARIO-ED         PIC ZZZZZZ9,99.
       01 ImpostoRenda       PIC 9(5)V99.
       01 IMPOSTO-ED         PIC ZZ999,99.
       01 INSS               PIC 9(5)V99.
       01 INSS-ED            PIC Z9999,99.
       01 SalarioLiquido     PIC 9(7)V99.
       01 LIQUIDO-ED         PIC ZZ99999,99.

       PROCEDURE DIVISION.
            DISPLAY "Sistema de Folha de Pagamento".
            DISPLAY "Digite o nome do funcionario: ".
           ACCEPT NomeFuncionario.
            DISPLAY "Digite o numero de horas trabalhadas: ".
           ACCEPT HorasTrabalhadas.

           COMPUTE SalarioBruto = HorasTrabalhadas * SalarioHora.

        IF SalarioBruto > 2000
        COMPUTE ImpostoRenda = SalarioBruto * 0,15
        ELSE
        COMPUTE ImpostoRenda = SalarioBruto * 0,10.

         COMPUTE INSS = SalarioBruto * 0,08.

         COMPUTE SalarioLiquido = SalarioBruto - ImpostoRenda - INSS.
         MOVE SalarioBruto TO SALARIO-ED.
         MOVE ImpostoRenda TO IMPOSTO-ED.
         MOVE SalarioLiquido TO LIQUIDO-ED.
         MOVE INSS TO INSS-ED.

           DISPLAY "Folha de Pagamento para ", NomeFuncionario.
           DISPLAY "Salario Bruto: R$ ", SALARIO-ED.
           DISPLAY "Imposto de Renda: R$ ", IMPOSTO-ED.
           DISPLAY "INSS: R$ ", INSS-ED.
           DISPLAY "Salario Liquido: R$ ", LIQUIDO-ED.

       STOP RUN.

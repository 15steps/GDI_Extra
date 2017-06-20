SET SERVEROUTPUT ON;

DECLARE

ctx DBMS_XMLGEN.CTXHANDLE;
XMLOUT CLOB;

BEGIN
      ctx := DBMS_XMLGEN.newContext('SELECT M.numero AS NUMERO, M.desc_terreno AS DESC_TERRENO, A.numero AS NUM_AVERBACAO FROM tb_matricula M, TABLE(M.averbacoes) A');
      DBMS_XMLGEN.setRowsetTag(ctx, 'LISTA_MATRICULA');
      DBMS_XMLGEN.setRowTag(ctx, 'MATRICULA');
      XMLOUT := DBMS_XMLGEN.getXML(ctx);
      DBMS_OUTPUT.PUT_LINE(XMLOUT);
      DBMS_XMLGEN.closeContext(ctx);
END;
/

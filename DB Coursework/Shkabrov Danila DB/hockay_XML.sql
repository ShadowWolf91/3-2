--xml export

SELECT file_name FROM dba_data_files; 
create or replace directory UTLDATA AS 'D:/BSTU';

create or replace procedure ExportPlayesToXml
is
DOC DBMS_XMLDOM.DOMDocument;
XDATA XMLTYPE;
CURSOR XMLCUR IS
SELECT XMLELEMENT("PLAYES",
XMLAttributes('http://www.w3.org/2001/XMLSchema' AS "xmlns:xsi",
'http://www.oracle.com/Users.xsd' AS "xsi:nonamespaceSchemaLocation"),
XMLAGG(XMLELEMENT("PLAYES",
xmlelement("HOMETEAM", PLAYES.HOMETEAM),
xmlelement("GUESTTEAM", PLAYES.GUESTTEAM),
xmlelement("HOMEGOALS", PLAYES.HOMEGOALS),
xmlelement("GUESTGOALS", PLAYES.GUESTGOALS),
xmlelement("HOMEIMAGE", PLAYES.HOMEIMAGE),
xmlelement("GUESTIMAGE", PLAYES.GUESTIMAGE),
xmlelement("DATE", PLAYES.DATE_)
))) from PLAYES;
begin
open xmlcur;
loop
fetch xmlcur into xdata;
exit when xmlcur%notfound;
end loop;
close xmlcur;
DOC := DBMS_XMLDOM.NewDOMDocument(XDATA);
DBMS_XMLDOM.WRITETOFILE(DOC, 'UTLDATA/PLAYES.xml');
END;

begin
ExportPlayesToXml();
end;

-- drop procedure ExportPlayesToXml;

----------------------------------------------------------------

-- xml import

create or replace procedure ImportPlayesFromXml
IS
L_CLOB CLOB;
L_BFILE BFILE := BFILENAME('UTLDATA', 'PLAYES.xml');

L_DEST_OFFSET INTEGER := 1;
L_SRC_OFFSET INTEGER := 1;
L_BFILE_CSID NUMBER := 0;
L_LANG_CONTEXT INTEGER := 0;
L_WARNING INTEGER := 0;

P DBMS_XMLPARSER.PARSER;
v_doc dbms_xmldom.domdocument;
v_root_element dbms_xmldom.domelement;
V_CHILD_NODES DBMS_XMLDOM.DOMNODELIST;
V_CURRENT_NODE DBMS_XMLDOM.DOMNODE;

et PLAYES%rowtype;
begin
DBMS_LOB.CREATETEMPORARY (L_CLOB, TRUE);
DBMS_LOB.FILEOPEN(L_BFILE, DBMS_LOB.FILE_READONLY);

DBMS_LOB.LOADCLOBFROMFILE (DEST_LOB => L_CLOB, SRC_BFILE => L_BFILE, AMOUNT => DBMS_LOB.LOBMAXSIZE,
DEST_OFFSET => L_DEST_OFFSET, SRC_OFFSET => L_SRC_OFFSET, BFILE_CSID => L_BFILE_CSID,
LANG_CONTEXT => L_LANG_CONTEXT, WARNING => L_WARNING);
DBMS_LOB.FILECLOSE(L_BFILE);
COMMIT;
P := Dbms_Xmlparser.Newparser;
DBMS_XMLPARSER.PARSECLOB(P,L_CLOB);
V_DOC := DBMS_XMLPARSER.GETDOCUMENT(P);
V_ROOT_ELEMENT := DBMS_XMLDOM.Getdocumentelement(v_Doc);
V_CHILD_NODES := DBMS_XMLDOM.GETCHILDRENBYTAGNAME(V_ROOT_ELEMENT,'*');

FOR i IN 0 .. DBMS_XMLDOM.GETLENGTH(V_CHILD_NODES) - 1
LOOP
V_CURRENT_NODE := DBMS_XMLDOM.ITEM(V_CHILD_NODES,i);

DBMS_XSLPROCESSOR.VALUEOF(V_CURRENT_NODE,
'HOMETEAM/text()',et.HOMETEAM);
Dbms_Xslprocessor.Valueof(V_Current_Node,
'GUESTTEAM/text()',et.GUESTTEAM);
Dbms_Xslprocessor.Valueof(V_Current_Node,
'HOMEGOALS/text()',et.HOMEGOALS);
dbms_xslprocessor.valueof(v_current_node,
'GUESTGOALS/text()',et.GUESTGOALS);
dbms_xslprocessor.valueof(v_current_node,
'HOMEIMAGE/text()',et.HOMEIMAGE);
dbms_xslprocessor.valueof(v_current_node,
'GUESTIMAGE/text()',et.GUESTIMAGE);
dbms_xslprocessor.valueof(v_current_node,
'DATE/text()',et.DATE_);

insert into PLAYES (HOMETEAM, GUESTTEAM, HOMEGOALS, GUESTGOALS, HOMEIMAGE, GUESTIMAGE, DATE_)
values (et.HOMETEAM, et.GUESTTEAM, et.HOMEGOALS, et.GUESTGOALS, et.HOMEIMAGE, et.GUESTIMAGE, et.DATE_);
end loop;

DBMS_LOB.FREETEMPORARY(L_CLOB);
DBMS_XMLPARSER.FREEPARSER(P);
DBMS_XMLDOM.FREEDOCUMENT(V_DOC);
commit;
END;

begin
ImportPlayesFromXml();
end;

select * from PLAYES;
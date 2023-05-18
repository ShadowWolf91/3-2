--xml export

SELECT file_name FROM dba_data_files; 
create or replace directory UTLDATA AS 'C:/app';

create or replace procedure export_projects_to_xml
is
DOC DBMS_XMLDOM.DOMDocument;
XDATA XMLTYPE;
CURSOR XMLCUR IS
SELECT XMLELEMENT("projects",
XMLAttributes('http://www.w3.org/2001/XMLSchema' AS "xmlns:xsi",
'http://www.oracle.com/Users.xsd' AS "xsi:nonamespaceSchemaLocation"),
XMLAGG(XMLELEMENT("projects",
xmlelement("project_id", projects.project_id),
xmlelement("name", projects.name),
xmlelement("description", projects.description),
xmlelement("team", projects.team)
))) from projects;
begin
open xmlcur;
loop
fetch xmlcur into xdata;
exit when xmlcur%notfound;
end loop;
close xmlcur;
DOC := DBMS_XMLDOM.NewDOMDocument(XDATA);
DBMS_XMLDOM.WRITETOFILE(DOC, 'UTLDATA/projects.xml');
END;

begin
export_projects_to_xml();
end;

--drop procedure export_projects_to_xml;


--xml import

create or replace procedure import_projects_from_xml
IS
L_CLOB CLOB;
L_BFILE BFILE := BFILENAME('UTLDATA', 'projects.xml');

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

et projects%rowtype;
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
'project_id/text()',et.project_id);
Dbms_Xslprocessor.Valueof(V_Current_Node,
'name/text()',et.name);
Dbms_Xslprocessor.Valueof(V_Current_Node,
'decsription/text()',et.description);
dbms_xslprocessor.valueof(v_current_node,
'team/text()',et.team);

insert into projects (name, description, team)
values (et.name, et.description, et.team);
end loop;

DBMS_LOB.FREETEMPORARY(L_CLOB);
DBMS_XMLPARSER.FREEPARSER(P);
DBMS_XMLDOM.FREEDOCUMENT(V_DOC);
commit;
END;

begin
import_projects_from_xml();
end;

select * from projects;
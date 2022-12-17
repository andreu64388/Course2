/*5. �������� (ALTER TABLE) ������� STU-DENT � ���� ������ UNIVER ����� �������, ����� �������� ��������������� ������� � ������ INFO ���������������� ���������� XML-���� (XML SCHEMACOLLECTION), �������������� � ������ �����. 
����������� ��������, ��������������� ���� � ������������� ������ (��������� IN-SERT � UPDATE) � ������� INFO ������� STUDENT, ��� ���������� ������, ��� � ����������.
����������� ������ XML-����� � �������� �� � ��������� XML-���� � �� UNIVER.
*/

--------------------------------------
---------------UNIVER-----------------
--------------------------------------
USE UNIVER
GO
CREATE XML SCHEMA COLLECTION STUDENT AS 
N'<?XML VERSION="1.0" ENCODING="UTF-16" ?>
<XS:SCHEMA ATTRIBUTEFORMDEFAULT="UNQUALIFIED" 
   ELEMENTFORMDEFAULT="QUALIFIED"
   XMLNS:XS="HTTP://WWW.W3.ORG/2001/XMLSCHEMA">
<XS:ELEMENT NAME="�������">
<XS:COMPLEXTYPE><XS:SEQUENCE>
<XS:ELEMENT NAME="�������" MAXOCCURS="1" MINOCCURS="1">
  <XS:COMPLEXTYPE>
    <XS:ATTRIBUTE NAME="�����" TYPE="XS:STRING" USE="REQUIRED" />
    <XS:ATTRIBUTE NAME="�����" TYPE="XS:UNSIGNEDINT" USE="REQUIRED"/>
    <XS:ATTRIBUTE NAME="����"  USE="REQUIRED">
	<XS:SIMPLETYPE>  <XS:RESTRICTION BASE ="XS:STRING">
		<XS:PATTERN VALUE="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
	 </XS:RESTRICTION> 	</XS:SIMPLETYPE>
     </XS:ATTRIBUTE>
  </XS:COMPLEXTYPE>
</XS:ELEMENT>
<XS:ELEMENT MAXOCCURS="10" NAME="�������" TYPE="XS:STRING"/>
<XS:ELEMENT NAME="�����">   <XS:COMPLEXTYPE><XS:SEQUENCE>
   <XS:ELEMENT NAME="������" TYPE="XS:STRING" />
   <XS:ELEMENT NAME="�����" TYPE="XS:STRING" />
   <XS:ELEMENT NAME="�����" TYPE="XS:STRING" />
   <XS:ELEMENT NAME="���" TYPE="XS:STRING" />
   <XS:ELEMENT NAME="��������" TYPE="XS:STRING" />
</XS:SEQUENCE></XS:COMPLEXTYPE>  </XS:ELEMENT>
</XS:SEQUENCE></XS:COMPLEXTYPE>
</XS:ELEMENT></XS:SCHEMA>';


--DROP XML SCHEMA COLLECTION STUDENT;

SELECT NAME, INFO FROM STUDENT WHERE NAME='�������� �.�.';
GO
ALTER TABLE STUDENT ALTER COLUMN INFO XML;
GO
SELECT NAME, INFO FROM STUDENT;


--------------------------------------
-----------------BANK-----------------
--------------------------------------
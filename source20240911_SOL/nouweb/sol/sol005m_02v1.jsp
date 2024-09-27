
<%/*
----------------------------------------------------------------------------------
File Name        : sol005m_01v1
Author            : ����L
Description        : SOL005M_�n�����W�ǥ͸�� - ��ܭ���
Modification Log    :

Vers        Date           By                Notes
--------------    --------------    --------------    ----------------------------------
0.0.1        096/02/27    ����L        Code Generate Create
----------------------------------------------------------------------------------
*/%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/utility/errorpage.jsp" pageEncoding="MS950"%>
<%@ include file="/utility/header.jsp"%>
<%@ page import="com.nou.sol.signup.po.*"%>
<%@page import="java.util.Vector"%>
<%@page import="com.nou.aut.AUTGETRANGE"%>
<%
session.setAttribute("SOLT005_01_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='ASYS' and (CODE = '1' or CODE = '2') ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_02_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='STTYPE' and code not in ('3','4') ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_031_SELECT", "NOU#select CENTER_CODE AS SELECT_VALUE,CENTER_ABBRNAME AS SELECT_TEXT from SYST002 WHERE CENTER_CODE not in ('00') ORDER BY DECODE(CENTER_CODE,'15','021',CENTER_CODE)");
session.setAttribute("SOLT005_032_SELECT", "NOU#select CENTER_CODE AS SELECT_VALUE,CENTER_ABBRNAME AS SELECT_TEXT from SYST002 WHERE CENTER_CODE not in ('00') ORDER BY DECODE(CENTER_CODE,'15','021',CENTER_CODE)");
session.setAttribute("SOLT005_04_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='PAYMENT_MANNER' and (CODE = '5' or CODE = '6') ORDER BY SELECT_VALUE, SELECT_TEXT");
//session.setAttribute("SOLT005_05_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='AUDIT_RESULT' ORDER BY SELECT_VALUE, SELECT_TEXT");
//session.setAttribute("SOLT005_06_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='SMS' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_07_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='PAYMENT_STATUS' and (CODE = '1' or CODE = '2') ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_08_SELECT", "NOU#select CONCAT(a.FACULTY_CODE, a.TOTAL_CRS_NO) as SELECT_VALUE, a.TOTAL_CRS_NAME as SELECT_TEXT from syst008 a where a.ASYS = '1' and a.FACULTY_CODE not in  ('90','80','00') and a.TOTAL_CRS_NO like '0%' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_09_SELECT", "NOU#select CONCAT(a.FACULTY_CODE, a.TOTAL_CRS_NO) as SELECT_VALUE, a.TOTAL_CRS_NAME as SELECT_TEXT from syst008 a where a.ASYS = '2' and a.FACULTY_CODE != '90' and a.TOTAL_CRS_NO like '0%' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_10_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='STTYPE' and code ='3' ORDER BY SELECT_VALUE, SELECT_TEXT");
//session.setAttribute("SOLT005_11_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='EDUBKGRD_GRADE' ORDER BY SELECT_VALUE, SELECT_TEXT");
//session.setAttribute("SOLT005_12_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='SPECIAL_STTYPE_MK' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_13_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='NATIONCODE' and code ='000' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_14_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='NATIONCODE' and code !='000' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_22_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='NATIONCODE' AND CODE != '000' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_16_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='NATIONCODE' and code ='000' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_17_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='EDUBKGRD_GRADE' AND CODE NOT IN ('15','16') ORDER BY SELECT_VALUE, SELECT_TEXT");
	/**���o��F�H�����ݤ���*/
	String user_id = (String) session.getAttribute("USER_ID");
	AUTGETRANGE aut = new AUTGETRANGE();
	aut.initRangeData(user_id);
	Vector centerVt = aut.getDEP_CODE("4","3");
	String cd="";
	if( centerVt.size()!=0)
	{
		cd += centerVt.get(0);
		// if(centerVt.size() >= 2)
		// {
			// cd += centerVt.get(0);
			// cd2 += "'" + centerVt.get(0) + "'";
			// cd3 += centerVt.get(0);
			// for(int i=1;i<centerVt.size();i++)
			// {
				// cd += ","+centerVt.get(i);
				// cd2 += ", '" + centerVt.get(i) + "'";
			// }
		// }else{
			// cd += centerVt.get(0);
			// cd2 += "'" + centerVt.get(0) + "'";
			// cd3 += centerVt.get(0);
		// }
	}else{	
		cd="00";//�аȳB(�ե����H��)
	}

%>
<html>
<head>
<%@ include file="/utility/viewpageinit.jsp"%>
<script src="<%=vr%>script/framework/query1_1_0_2.jsp"></script>
<script src="sol005m_02c1.jsp"></script>


<noscript>
<p>�z���s�������䴩JavaScript�y�k�A���O�ä��v�T�z��������������e</p>
</noscript>
</head>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="�I����" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- �w�q�d�ߪ� Form �_�l -->
<form name="QUERY" method="post" style="margin:0,0,5,0;">
<input type=hidden name="control_type"> 
<input type=hidden name="pageSize"> 
<input type=hidden name="pageNo"> 
<input type=hidden name="EXPORT_FILE_NAME"> 
<input type=hidden name="EXPORT_COLUMN_FILTER"> 
<TABLE id="QUERY_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
	<tr>
		<td width="13"><img src="<%=vr%>images/ap_search_01.jpg" alt="�ƪ��ιϥ�" width="13" height="12"></td>
		<td width="100%"><img src="<%=vr%>images/ap_search_02.jpg" alt="�ƪ��ιϥ�" width="100%" height="12"></td>
		<td width="13"><img src="<%=vr%>images/ap_search_03.jpg" alt="�ƪ��ιϥ�" width="13" height="12"></td>
	</tr>
	<tr>
		<td width="13" background="<%=vr%>images/ap_search_04.jpg" alt="�ƪ��ιϥ�">&nbsp;</td>
		<td width="100%" valign="top" bgcolor="#C5E2C3"><!-- ���s�e���_�l -->
		<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
			<tr class="mtbGreenBg">
				<td align=left>�i�d�ߵe���j<span id="old"></span></td>
				<td align=right>
				<div id="serach_btn"><input type=button class="btn" value='�ˬd�O�_�i���W' onkeypress="doSOLCK();" onclick="doSOLCK();"></div>
				</td>
			</tr>
		</table>
		<!-- ���s�e������ --> <!-- �d�ߵe���_�l -->
		<table id="table1" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" summary="�ƪ��Ϊ��">
			<tr>
				<td align='right'>���W�Ǧ~��<font color=red>��</font>�G</td>
				<td>
				<input type=text name="AYEAR" value='<%=(String)session.getAttribute("SOL005m_nextayear")%>'>
				<select name='SMS' value='<%=(String)session.getAttribute("SOL005m_nextsms")%>'>
					<option value=''>�п��</option>
					<script>Form.getSelectFromPhrase("SYST001_01_SELECT", "KIND", "SMS");</script>
				</select>
				</td>
				<td align='right'>�Ǩ�<font color=red>��</font>�G</td>
				<td><select name='ASYS' id='ASYS' onchange="doPreMajor();checkIDNO();">
					<script>Form.getSelectFromPhrase("SOLT005_01_SELECT", null, null);</script>
				</select></td>
				<td align='right'>���W�����O<font color=red>��</font>�G</td>
				<td ><div id="sol005_sttype2"><select name='STTYPE' id='STTYPE2' onchange='hidden();'>
					<option value=''>�п��</option>
					<script>Form.getSelectFromPhrase("SOLT005_02_SELECT", null, null);</script>
				</select></div></td>			
			</tr>
			<tr>
				<td align='right'>���إ����ҥ����O<font color=red>��</font>�G</td>
				<td><select name='idtype' id='idtype' onchange="getNationalCode()"> 
					<option value=''>�п��</option>
					<option value='1'>������</option>
					<option value='2'>�~�d��</option>
					<option value='3'>�@��</option>
				</select></td>
				<td align='right'>
				<span style="color:#037662;font-size:10pt">���y�O</span><font color=red>��</font>�G
				<select name='NATIONCODE' id="NATIONCODE">				
				</select>
				</td>
				<td align='left' >
					<div id="radioBoxArea" style='display:none;'>
<!-- 						<label><input type='radio' id='radioIdno' name='radioType' value='1'>������</label> -->
<!-- 						<label><input type='radio' id='radioPassportNo' name='radioType' value='2'>�@�Ӹ��X</label> -->
					</div>
					<span style="color:#037662;font-size:10pt" id="type_exp" >������</span><font color=red>��</font>�G
					<input type=text name='IDNO' id='IDNO' onblur='checkIDNO();' maxlength='10' size = '10'><br>
					<span style="color:#037662;font-size:10pt" id="expDateSpan" >�ҥ�����<font color=red>��</font>�G</span>
					<span id='expDateInput'><input type=text name='EXP_DATE' id='EXP_DATE'><img src='/images/calendar.gif' alt='���ϥ� ' style='cursor:hand' onkeypress='Calendar.showCalendar(this, _i("QUERY", "EXP_DATE"));' onclick='Calendar.showCalendar(this, _i("QUERY", "EXP_DATE"));'></span>
				</td>
				<td align='right'>�X�ͤ��<font color=red>��</font>�G</td>
				<td><input type=text name='BIRTHDATE' id='BIRTHDATE'><img src='/images/calendar.gif' alt='���ϥ� ' style='cursor:hand' onkeypress='Calendar.showCalendar(this, _i("QUERY", "BIRTHDATE"));' onclick='Calendar.showCalendar(this, _i("QUERY", "BIRTHDATE"));'></td>
				
			</tr>
			<tr><td colspan='6' align='center'><span class="title"><font color=brown></font></span></td></tr>
		</table>
		
		<!-- �d�ߵe������ --></td>
		<td width="13" background="<%=vr%>images/ap_search_06.jpg" alt="�ƪ��ιϥ�">&nbsp;</td>
	</tr>
	<tr>
		<td width="13"><img src="<%=vr%>images/ap_search_07.jpg" alt="�ƪ��ιϥ�" width="13" height="13"></td>
		<td width="100%"><img src="<%=vr%>images/ap_search_08.jpg" alt="�ƪ��ιϥ�" width="100%" height="13"></td>
		<td width="13"><img src="<%=vr%>images/ap_search_09.jpg" alt="�ƪ��ιϥ�" width="13" height="13"></td>
	</tr>
</table>
<!-- �d�ߥ��e������ --></form>
<!-- �w�q�d�ߪ� Form ���� -->

<!-- ���D�e���_�l -->
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="�ƪ��Ϊ��">
	<tr>
		<td>
		<table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td background="<%=vr%>images/ap_index_title.jpg" alt="�ƪ��ιϥ�"><span class="title">SOL005M_�n���{�����W�ǥ͸��</span></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!-- ���D�e������ -->

<!-- �w�q�s�誺 Form �_�l -->
<form name="EDIT" method="post" onsubmit="doSave();" style="margin:5,0,0,0;">
<input type=hidden name="control_type"> 
<input type=hidden name="ROWSTAMP"> 
<input type=hidden name='ASYS'>
<input type=hidden name='SPECIAL_STUDENT'>
<input type=hidden name='SERNO'>
<input type=hidden name='PAYMENT_STATUS' value="1">
<input type=hidden name='DMSTADDR'>
<input type=hidden name='CRRSADDR'>
<input type=hidden name='TEL_OFFICE'>
<input type=hidden name='TEL_HOME'>
<input type=hidden name='MOBILE'>
<input type=hidden name='EMAIL'>
<input type=hidden name='MARRIAGE'>
<input type=hidden name='CD' value='<%=cd%>'>
<input type=hidden name='VOCATION'>
<input type=hidden name='EMRGNCY_NAME'>
<input type=hidden name='EMRGNCY_RELATION'>
<input type=hidden name='EMRGNCY_TEL'>
<input type=hidden name='AREACODE_OFFICE'>
<input type=hidden name='TEL_OFFICE_EXT'>
<input type=hidden name='AREACODE_HOME'>
<input type=hidden name='STNO'>
<input type=hidden name='IDTYPE2' id='IDTYPE2' value='N'>
<input type=hidden name='IDTYPE3' id='IDTYPE3' value='N'>
<input type=hidden name='idtype' id='idtype'>
<input type=hidden name='RESIDENCE_BASEDATE' id='RESIDENCE_BASEDATE' value=''>

<input type=hidden name='LIMIT' value='<%=(String)session.getAttribute("limit")%>'>

<!-- �s����e���_�l -->
<TABLE id="EDIT_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
	<tr>
		<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
		<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
		<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
	</tr>
	<tr>
		<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
		<td width="100%" valign="top" bgcolor="#FFFFFF"><!-- ���s�e���_�l -->
		<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
			<tr class="mtbGreenBg">
				<td align=left>�i�s��e���j- <span id='EditStatus'>�s�W</span></td>
				<td align=right>
				<div id="edit_btn">
					<input type=button name="SAVE_BTN" class="btn" value='�~��n�����W������' onkeypress='doSet("1");' onclick='doSet("1");'> 
					<input type=button class="btn" value='�M  ��' onkeypress='doSOLCK();' onclick='doSOLCK();'> 
					<input type=button name="SAVE_BTN" class="btn" value='�s  ��' onkeypress='doSave();' onclick='doSave();'>
				</div>
				</td>
			</tr>
		</table>
		<!-- ���s�e������ --> <!-- �s��e���_�l -->
		<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
			<tr>
				<td align='right' class='tdgl2'>�Ǧ~<font color=red>��</font>�G</td>
				<td class='tdGrayLight'><input type=text id="AYEAR" name='AYEAR' readonly></td>
				<td align='right' class='tdgl2'>�Ǵ�<font color=red>��</font>�G</td>
				<td class='tdGrayLight'><select name='SMS' id='SMS' disabled>
					<option value=''>�п��</option>
					<script>Form.getSelectFromPhrase("SYST001_01_SELECT", "KIND", "SMS");</script>
				</select></td>
			</tr>
			<tr>
				<td align='right' class='tdgl1'>�����Ҧr��<font color=red>��</font>�G</td>
				<td class='tdGrayLight'>
					<input type=text id="IDNO" name='IDNO' readonly>
				</td>
				<td align='right' class='tdgl1'>�X�ͤ��<font color=red>��</font>�G</td>
				<td class='tdGrayLight'><input type=text id="BIRTHDATE" name='BIRTHDATE' readonly></td>
			</tr>
			<tr>
				<td align='right' class='tdgl1'>�ʧO�G</td>
				<td class='tdGrayLight' colspan='3'>
					�k�w�ʧO<font color=red>��</font>�G
					<select name='SEX'>
                        <option value=''>�п��</option>
                        <option value='1'>�k</option>
                        <option value='2'>�k</option>
                	</select><br>
					�ۧڻ{�P�ʧO�G
					<select name='SELF_IDENTITY_SEX'>
                        <option value=''>�п��</option>
                        <option value='1'>�k</option>
                        <option value='2'>�k</option>
                        <option value='3'>�D�G��</option>
                	</select></td>
			</tr>
			<tr>
				<td align='right' class='tdgl1'><div id="centerCode">���W�ǲ߫��ɤ���<font color=red>��</font>�G</div></td>
				<td class='tdGrayLight'><div id="centerCodeSelect"><select name='CENTER_CODE' id='CENTER_CODE'>
					<option value=''>�п��</option>
					<script>Form.getSelectFromPhrase("SOLT005_031_SELECT", null, null);</script>
				</select></div></td>
				<td align='right' class='tdgl2'>���W�����O<font color=red>��</font>�G</td>
				<td class='tdGrayLight'><div id="sol005_sttype"><select name='STTYPE' id='STTYPE'>
					<option value=''>�п��</option>
					<script>Form.getSelectFromPhrase("SOLT005_02_SELECT", null, null);</script>
				</select></div></td>
			</tr>
			<tr>
				<td align='right' class='tdgl2'>�m�W<font color=red>��</font>�G</td>
				<td class='tdGrayLight'><input type=text name='NAME' id='NAME'></td>
				<td align='right' class='tdgl1'>���y�O<font color=red>��</font>�G</td>
				<td class='tdGrayLight' >
					<select name='NATIONCODE' id ='NATIONCODE'  disabled >
						<!-- <option value=''>�п��</option>  -->
						<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","NATIONCODE");</script>
					</select>
					<!-- �s������O�G<input type=text name='NEWNATION' > -->
				</td>
			</tr>
			<tr>
				<td align='right' class='tdgl2'>���y�l���ϸ�<font color=red>��</font>�G</td>
				<td class='tdGrayLight'><input type=text name='DMSTADDR_ZIP' id='DMSTADDR_ZIP' onchange='doAsMdszip()'></td>
				<td align='right' class='tdgl1'>�s������O�G</td>
				<td class='tdGrayLight'>
					<select name='NEWNATION'>
							<option value="">�п��</option>
							<script>Form.getSelectFromPhrase("SOLT007_22_SELECT", null, null);</script>
					</select>
				</td>				
			</tr>
			<tr>
				<td align='right' class='tdgl2'>�q�T�l���ϸ�<span id='G11'></span>�G</td>
				<td class='tdGrayLight'><input type=text name='CRRSADDR_ZIP' id='CRRSADDR_ZIP'><input type="checkbox" name = 'crrzip_as_mdszip' onclick='doAsMdszip()'>���P���y�l���ϸ�</td>
				<td align='right' class='tdgl1'>�@�ө~�d�Ҩ����<font color=red ></font>�G</td>
                <td class='tdGrayLight' colspan = "3" >
                    <input type=text id="RESIDENCE_DATE" name='RESIDENCE_DATE' >
                </td>
			</tr>
			<tr>
				<td align='right' class='tdgl2'>�ײ����X<font color=red></font>�G</td>
				<td class='tdGrayLight'><input type=text name='DRAFT_NO' id='DRAFT_NO'></td>
				<td align='right' class='tdgl2'>ú�O�覡�@���B<font color=red>��</font>�G</td>
				<td class='tdGrayLight'>
					<select name='PAYMENT_METHOD' id='PAYMENT_METHOD' onchange="doDisabled(this.value)">
					<option value=''>�п��</option>
					<script>Form.getSelectFromPhrase("SOLT005_04_SELECT", null, null);</script>
					<input type=text name='REG_FEE' id='REG_FEE'>
				</td>
			</tr>
			<tr>
				<td align='right' class='tdgl1'>�ҥ󥿥��O�_�ŦX<font color=red>��</font>�G</td>
				<td class='tdGrayLight' ><select name='CHECK_DOC' id='CHECK_DOC'>
					<option value=''>�п��</option>
					<script>Form.getSelectFromPhrase("SYST001_01_SELECT", "KIND", "AUDIT_RESULT");</script>
				</select></td>
				<td align='right' class='tdgl1'>�Kú�O��]<font color=red></font>�G</td>
				<td class='tdGrayLight' ><input type=text name='NPAYMENT_BAR' id='NPAYMENT_BAR'></td>
			</tr>
			<tr>
				<td align='right' class='tdgl2'>�ҥ󤣲ŭ�]<font color=red></font>�G</td>
				<td class='tdGrayLight' ><input type=text name='DOC_UNQUAL_REASON' id='DOC_UNQUAL_REASON'></td>
				<td align='right' class='tdgl1'>���߼f�d���G<font color=red>��</font>�G</td>
				<td class='tdGrayLight' ><select name='AUDIT_RESULT' id='AUDIT_RESULT'>
					<option value=''>�п��</option>
					<script>Form.getSelectFromPhrase("SYST001_01_SELECT", "KIND", "AUDIT_RESULT");</script>
				</select><div id='checkbox_doc'></div></td>
				</td>
			</tr>
			<tr>
			<td align='right' class='tdgl1'><div id="preMajorFaculty">�w�w�D�׾Ǩt<font color=red>��</font>�G</div></td>
				<td class='tdGrayLight'>
					<div id="majorForSelect">
						<select name='PRE_MAJOR_FACULTY' id='PRE_MAJOR_FACULTY'>
							<option value="0000">�|���M�w</option>
							<script>Form.getSelectFromPhrase("SOLT005_08_SELECT", null, null);</script>
						</select>
					</div>
				</td>
				<td align='right' class='tdgl2'>�S��͵��O�G</td>
				<td class='tdGrayLight' >
					<select name='SPECIAL_STTYPE_TYPE' id='SPECIAL_STTYPE_TYPE'>
						<option value="">�п��</option>
						<script>Form.getSelectFromPhrase("SYST001_01_SELECT", "KIND", "SPECIAL_STTYPE_MK");</script>
					</select>
				</td>
			</tr>
			<tr>                
                
                <td align='right' class='tdgl2'>�J�ǾǾ����O<font color=red>��</font>�G</td>
                <td class='tdGrayLight'>
                    <select name='EDUBKGRD_GRADE'>
					<option value=''>�п��</option>
                    <script>Form.getSelectFromPhrase("SOLT005_17_SELECT", null, null);</script>
					</select>
				</td>
				<td align='right' class='tdgl2'>�ɮv�Z<font color=red>��</font>�G</td>
                <td class='tdGrayLight'>
                    <select name='TUTOR_CLASS_MK' >
					<option value='1'>�H���s�Z</option>
                    <!-- <script>Form.getSelectFromPhrase("SOLT007_05_SELECT", null, null);</script> --> 
                    </select>
						</td>
            </tr>
		</table>
		<!-- �s��e������ --></td>
		<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
	</tr>
	<tr>
		<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
		<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="�ƪ��ιϥ�" width="100%" height="15"></td>
		<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
	</tr>
</table>
<!-- �s����e������ --></form>
<!-- �w�q�s�誺 Form ���� -->

<!-- �w�q�d�ߵ��G�� Form �_�l -->
<span id="menu1" style="display:'none'">
<form name="RESULT" method="post" style="margin:10,0,0,0;">
	<input type=hidden name="control_type">
	<input type=hidden keyColumn="Y" name="AYEAR">
	<input type=hidden keyColumn="Y" name="SMS">
	<input type=hidden keyColumn="Y" name="SERNO">

	<!-- �d�ߵ��G�e���_�l -->
	<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
			<td width="100%" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="2" summary="�ƪ��Ϊ��">
					<tr>
						<!-- �d�ߵ��G���s�_�l -->
						<td align=left>
						</td>
						<!-- �d�ߵ��G���s���� -->

						<!-- �����r��_�l -->
						<td align=right nowrap>
							<div id="page">
								<b>
									<span id="pageStr"></span>
									�i<input type='text' name='_scrollSize' size=2 value='10' style="text-align:center">
									<input type=button value='��' onkeypress="setPageSize();"onclick="setPageSize();">
									<input type='text' name='_goToPage' size=2 value='1' style="text-align:right">
									/ <span id="totalPage"></span> <input type=button value='��' onkeypress='gotoPage(null)'onclick='gotoPage(null)'>
									<span id="totalRow">0</span> ���j

								</b>
							</div>
						</td>
						<!-- �����r�굲�� -->
					</tr>
				</table>
				<!-- �d�ߵ��G�\��e���_�l -->
				<div id="grid-scroll" style="overflow:auto;width:100%;height:300;"></div>
				<input type=hidden name='EXPORT_FILE_NAME'>
				<textarea name='EXPORT_CONTENT' cols=80 rows=3 style='display:none'></textarea>
				<textarea name='ALL_CONTENT' cols=80 rows=3 style='display:none'></textarea>
				<!-- �d�ߵ��G�\��e������ -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="�ƪ��ιϥ�" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
		</tr>
	</table>
</span>
<!-- �w�q�d�ߵ��G�� Form ���� -->

<script>
    document.write ("<font color=\"white\">" + document.lastModified + "</font>");
    window.attachEvent("onload", page_init);
    window.attachEvent("onload", onloadEvent);
</script>
</body>
</html>

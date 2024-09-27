<%/*
----------------------------------------------------------------------------------
File Name		: stu002m_02v1
Author			: matt
Description		: ���@���y��� - �s����ܭ���
Modification Log	:

Vers		Date       	By            	Notes
--------------	--------------	--------------	----------------------------------
0.0.1		096/01/24	matt    		Code Generate Create
0.0.2		096/11/06	poto    	    �[�c�ק� for QA
0.0.3		097/03/19	lin	    	    �Y�v�����ե�����F�H���~�}����y��ƪ��s�ɫ��s
----------------------------------------------------------------------------------
*/%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/utility/errorpage.jsp" pageEncoding="MS950"%>
<%@ include file="/utility/header.jsp"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="AUTGETRANGE" scope="session" class="com.nou.aut.AUTGETRANGE" />

<%
String  DEP_CODE =com.acer.util.Utility.checkNull(request.getParameter("DEP_CODE"), "");
String ASYS = (String)session.getAttribute("ASYS");
if("1".equals(ASYS)){
	session.setAttribute("FACULTY_CODE", "UNT#SELECT FACULTY_CODE AS SELECT_VALUE, FACULTY_NAME AS SELECT_TEXT FROM SYST003 WHERE FACULTY_CODE not in  ('90','80','00') AND FACULTY_CODE != '70' ORDER BY FACULTY_CODE");
}else{
	session.setAttribute("FACULTY_CODE", "UNT#SELECT FACULTY_CODE AS SELECT_VALUE, FACULTY_NAME AS SELECT_TEXT FROM SYST003 ORDER BY FACULTY_CODE ");
}


boolean	show	=	false;

//�v���O(PRVLG_TP[3.�ե���])�B�����O(ID_TP[3.��F�H��])
Vector	dep	=	AUTGETRANGE.getDEP_CODE("3","3");
Vector	dep35	=	AUTGETRANGE.getDEP_CODE("3","5");
if (dep.size() > 0||dep35.size() > 0){
	show	=	true;
}	
%>
<html>
<head>
	<%@ include file="/utility/viewpageinit.jsp"%>
	<script src="<%=vr%>script/framework/query1_2_0_2.jsp"></script>
	<script src="stu002m_02c1.jsp"></script>
	<noscript>
		<p>�z���s�������䴩JavaScript�y�k�A���O�ä��v�T�z��������������e</p>
	</noscript>
</head>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="�I����" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- ���D�e���_�l -->
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="�ƪ��Ϊ��">
	<tr>
		<td>
			<table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="<%=vr%>images/ap_index_title.jpg" alt="�ƪ��ιϥ�">
						�@�@<span class="title">STU002M_ ���@���y���</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<span id='TabBtn1'class='tab_non_select' onclick="doTab(3, 1);">�򥻸��</span>
<span id='TabBtn2'class='tab_select' onclick="doTab(3, 2);">���y���</span>
<span id='TabBtn3'class='tab_non_select' onclick="doTab(3, 3);">�ǲ߾��{���</span>
<!-- ���D�e������ -->
<!-- �w�q�s�誺 Form �_�l -->
<div style='padding:5px;border:1px solid #aaa;'>
	<div id='TabCnt1' style='display:none'>
		<form name="EDIT" method="post" onsubmit="doSave();" style="margin:5,0,0,0;">
			<input type=hidden name="control_type">
			<input type=hidden name="ROWSTAMP">
			<input type=hidden name="STNO">
			<input type=hidden name="ASYS">
			<input type=hidden name="DEP_CODE">	
			<input type=hidden name="SGU_CODE">	
			<input type=hidden name="PRE_MAJOR_FACULTY">
			<input type=hidden name="STOP_PRVLG_SAYEARSMS">
			<input type=hidden name="STOP_PRVLG_EAYEARSMS">	
			<input type=hidden name="SPECIAL_STTYPE_TYPE">
			<input type=hidden name="INFORMAL_STUTYPE">	
			<input type=hidden name="SPECIAL_AYEAR">	
			<input type=hidden name="SPECIAL_SMS">	
			<input type=hidden name="TMPV">	
			<input type=hidden name="EDUBKGRD">
			<input type=hidden name="EDUBKGRD_AYEAR">
			<input type=hidden name="stno"  value="<%=com.acer.util.Utility.checkNull(request.getParameter("stno"), "")%>">		
			<input type=hidden name="backTo"  value="<%=com.acer.util.Utility.checkNull(request.getParameter("backTo"), "")%>">		
			<input type=hidden name="LINK"  value="<%=com.acer.util.Utility.checkNull(request.getParameter("LINK"), "")%>">		
			<input type="hidden" name='EDUBKGRD_GRADE_STUT003'>

			<!-- �s����e���_�l -->
			<TABLE id="EDIT_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
				<tr>
					<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
					<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
					<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
				</tr>
				<tr>
					<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
					<td width="100%" valign="top" bgcolor="#FFFFFF">
						<!-- ���s�e���_�l -->
						<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
							<tr class="mtbGreenBg">
								<td align=left>�i�s��e���j- <span id='EditStatus'>�s�W</span></td>
								<td align=right>
									<div id="edit_btn">
										<input type=button class="btn" value='�^�d�߭�' onkeypress='doBack();'onclick='doBack();'>
										<input type=button name="CLEAR_BTN" class="btn" value='�M  ��' onkeypress='doClear();'onclick='doClear();'>
										<input type=submit name="SAVE_BTN" class="btn" value='�s  ��'>
									</div>
								</td>
							</tr>
						</table>
						<!-- ���s�e������ -->

						<!-- �s��e���_�l -->
						<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
							<tr>
								<td align='right' class='tdgl1'>�����Ҧr��<font color=red>��</font>�G</td>
								<td class='tdGrayLight'><input type=text name='IDNO'></td>
								<td align='right' class='tdgl1'>�X�ͤ��<font color=red>��</font>�G</td>
								<td class='tdGrayLight'><input type=text name='BIRTHDATE'></td>
							</tr>
							<tr>
								<td align='right' class='tdgl2'>�m�W<font color=red>��</font>�G</td>
								<td class='tdGrayLight'><input type=text name='NAME'>
								�O�W�G<input type=text name='ALIAS'>
								</td>
								<td align='right' class='tdgl2'>�^��m�W�G</td>
								<td class='tdGrayLight'><input type=text name='ENG_NAME'><font color=red>��g�d�ҡGCAI, YI-LIN</font></td>
							</tr>
							<tr>						
								<td align='right' class='tdgl1'>���y<font color=red>��</font>�G</td>
								<td class='tdGrayLight'>
									<select name='NATIONCODE'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","NATIONCODE");</script>
									</select>
								</td>
								<td align='right' class='tdgl1' nowrap>�s������O�G</td>
								<td  class='tdGrayLight'>
								<select name='NEWNATION'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","NATIONCODE");</script>
								</select>
								</td>
							</tr>
							<tr>
								<td align='right' class='tdgl1' nowrap>�@�Ӹ��X�G</td>
								<td class='tdGrayLight'><input type=text name='PASSPORT_NO'><input type='text' name='BIRTHPLACE' style='width:0px' readonly>
										�@�өΩ~�d�Ҧ��Ĥ���G<span id="span1" >
												   <input type=text Column='RESIDENCE_DATE' name='RESIDENCE_DATE'>
												   </span>
												   <img src='/images/calendar.gif' id='img1' alt='���ϥ� 'style='cursor:hand' onkeypress='Calendar.showCalendar(this, _i("EDIT", "RESIDENCE_DATE"));'onclick='Calendar.showCalendar(this, _i("EDIT", "RESIDENCE_DATE"));'>
								</td>
								<td align='right' class='tdgl1'>�ʧO�G</td>
								<td class='tdGrayLight'>
									�k�w�ʧO<font color=red>��</font>�G
									<select name='SEX'>
										<option value=''>�п��</option>
										<option value='1'>�k</option>
										<option value='2'>�k</option>
										<!-- <script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SEX");</script> -->
									</select><br>
									�ۧڻ{�P�ʧO�G
									<select name='SELF_IDENTITY_SEX'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SEX");</script>
									</select>
								</td>
							</tr>
							<tr>
								<td align='right' class='tdgl2'>�B�ê��p�G</td>
								<td class='tdGrayLight'>
									<select name='MARRIAGE'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","MARRIAGE");</script>
									</select>
								</td>
								<td align='right' class='tdgl2'>¾�~<font color=red>��</font>�G</td>
								<td class='tdGrayLight'>
									<select name='VOCATION'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","VOCATION");</script>
									</select>
								</td>
							</tr>
							<tr>
								<td align='right' class='tdgl1' style='display:none'>�Ǿ�����<font color=red>��</font>�G</td>
								<td class='tdGrayLight' style='display:none'>
									<select name='EDUBKGRD_GRADE'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","EDUBKGRD_GRADE");</script>
									</select>
								</td>
<!-- 								<td align='right' class='tdgl1'>�q�l�H�c�G</td> -->
<!-- 								<td class='tdGrayLight'><input type=text name='EMAIL'></td> -->
							</tr>
							<tr>
								<td align='right' class='tdgl2'>���y�a�}�G</td>
								<td class='tdGrayLight'>
									�l���ϸ�(<input type=text Column='ZIP' name='DMSTADDR_ZIP' onblur='Form.blurData("SYST006_01_BLUR", "ZIP", this.value , ["ZIP_CITY","ZIP_TOWN"],[_i("EDIT", "DMSTADDR_ZIP_CITY"),_i("EDIT", "DMSTADDR_ZIP_TOWN")], true);'>)
									<img src='/images/select.gif' id='ADDR1' alt='�}�����' style='cursor:hand' onclick='Form.openPhraseWindow("SYST006_01_WINDOW", "","", "�l���ϸ�,����,�m���", [_i("EDIT", "DMSTADDR_ZIP"),_i("EDIT", "DMSTADDR_ZIP_CITY"),_i("EDIT", "DMSTADDR_ZIP_TOWN")]);'>
									<input type=text name='DMSTADDR'>
									<input type=hidden Column='ZIP_CITY' name='DMSTADDR_ZIP_CITY'>
									<input type=hidden Column='ZIP_TOWN' name='DMSTADDR_ZIP_TOWN' onpropertychange=setADDR("1")>
								</td>
								<td align='right' class='tdgl1'>�q�l�H�c�G</td>
								<td class='tdGrayLight'><input type=text name='EMAIL'></td>
							</tr>
							<tr>
								<td align='right' class='tdgl1'>�q�T�a�}<font color='red'>��</font>�G</td>
								<td class='tdGrayLight' colspan="3">
									�l���ϸ�(<input type=text Column='ZIP' name='CRRSADDR_ZIP' onblur='Form.blurData("SYST006_01_BLUR", "ZIP", this.value , ["ZIP_CITY","ZIP_TOWN"],[_i("EDIT", "CRRSADDR_ZIP_CITY"),_i("EDIT", "CRRSADDR_ZIP_TOWN")], true);'>)
									<img src='/images/select.gif' id='ADDR2' alt='�}�����' style='cursor:hand' onclick='Form.openPhraseWindow("SYST006_01_WINDOW", "","", "�l���ϸ�,����,�m���", [_i("EDIT", "CRRSADDR_ZIP"),_i("EDIT", "CRRSADDR_ZIP_CITY"),_i("EDIT", "CRRSADDR_ZIP_TOWN")]);'>
									<input type=text name='CRRSADDR'>
									<input type=hidden Column='ZIP_CITY' name='CRRSADDR_ZIP_CITY'>
									<input type=hidden Column='ZIP_TOWN' name='CRRSADDR_ZIP_TOWN' onpropertychange=setADDR("2")>
								</td>
							</tr>
							<tr>
								<td align='right' class='tdgl2'>�q��(��)�G</td>
								<td class='tdGrayLight'>(<input type=text name='AREACODE_OFFICE'>)<input type=text name='TEL_OFFICE'>����<input type=text name='TEL_OFFICE_EXT'> ex:(02)12345678</td>
								<td align='right' class='tdgl2'>�q��(�v)�G</td>
								<td class='tdGrayLight'>(<input type=text name='AREACODE_HOME'>)<input type=text name='TEL_HOME'> ex:(02)12345678</td>
							</tr>
							<tr>
								<td align='right' class='tdgl1'>��ʹq�ܡG</td>
								<td class='tdGrayLight'><input type=text name='MOBILE'>ex:0932123456</td>
								<td align='right' class='tdgl1' nowrap>�ǯu�q�ܡG</td>
								<td  class='tdGrayLight'><input type=text name='FAX_TEL'></td>
							</tr>
							<tr>
								<td align='right' class='tdgl2' nowrap>����p���H�G</td>
								<td class='tdGrayLight'><input type=text name='EMRGNCY_NAME'>����p���H�q�ܡG<input type=text name='EMRGNCY_TEL'></td>
								<td align='right' class='tdgl2' nowrap>����p���H���Y�G</td>
								<td colspan='5' class='tdGrayLight'><input type=text name='EMRGNCY_RELATION'></td>
							</tr>
							<tr>							
								<td align='right' class='tdgl1' nowrap>�����G</td>
								<td class='tdGrayLight'><input type=text name='PARENTS_RACE' readonly></td>
							    <td align='right' class='tdgl1' nowrap>���߻�ê���O�G</td>
								<td  class='tdGrayLight'><input type=text name='HANDICAP_TYPE' readonly></td>
							</tr>
						    <tr>							
								<td align='right' class='tdgl1'>�s����l�k�G</td>
		                        <td class='tdGrayLight' colspan ='3'><input type=text name='NEW_RESIDENT_CHD' readonly></td>
		                        </td>
							</tr>
							<tr id ="SPECIAL_MK_DATA" style='display:none'>							
								<td align='right' class='tdgl1' nowrap>�S����O�G</td>
								<td class='tdGrayLight' colspan ='3'><input type=text name='SPECIAL_MK'>���S��e�f�λݭn�S�O���U�����O</td>
							</tr>
						</table>
						<!-- �s��e������ -->
					</td>
					<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
				</tr>
				<tr>
					<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
					<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="�ƪ��ιϥ�" width="100%" height="15"></td>
					<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
				</tr>
			</table>
			<!-- �s����e������ -->
		</form>
		<!-- �w�q�s�誺 Form ���� -->
	</div>

	<!--���y���-->
	<div id='TabCnt2' style='display:'>
		<form name="TAB2" method="post" style="margin:5,0,0,0;" onsubmit="doSave1();">
		<input type=hidden name="check">
		<input type=hidden name="GRAD_KIND">
			<!-- �s����e���_�l -->
			<TABLE id="EDIT_DIV_TAB2" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
				<tr>
					<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
					<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
					<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
				</tr>
				<tr>
					<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
					<td width="100%" valign="top" bgcolor="#FFFFFF">
						<!-- ���s�e���_�l -->
						<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
							<tr class="mtbGreenBg">
								<td align=left>�i�s��e���j<span></span></td>
								<td align=right>
									
								<%
								show = true;
								if (show)
								{
								%>
									<input type=button class="btn" id="a5" value='�h�����~��T' onkeypress="doOpen1();" onclick="doOpen1();">
									<input type=button class="btn" value='�^�d�߭�' onkeypress='doBack();'onclick='doBack();'>
									<input type=button name="CLEAR_BTN" class="btn" value='�M  ��' onkeypress='doClear();'onclick='doClear();'>
									<input type=submit name="SAVE_BTN" class="btn" value='�s  ��'>
								<%
								}
								%>
									
								</td>
							</tr>
						</table>
						<!-- ���s�e������ -->

						<!-- �s��e���_�l -->
						<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
							<tr>
								<td align='right' class='tdgl1'>�Ǹ��G</td>
								<td class='tdGrayLight'><input type=text name='STNO'><input type=text name='NAME'></td>
								<td align='right' class='tdgl2'>���ߧO�G</td>
								<td class='tdGrayLight'><input type=text name='CENTER_CODE'></td>
							</tr>
							<tr>
								<td align='right' class='tdgl1'>���W�����O�G</td>
								<td class='tdGrayLight'><input type=text name='STTYPE'></td>
								<td align='right' class='tdgl2'>�s�ͤJ�ǾǦ~���G</td>
								<td class='tdGrayLight'>
								<input type=text name='ENROLL_AYEAR'>								
								<select name='ENROLL_SMS'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SMS");</script>
								</select>
								</td>
							</tr>
							<tr>
								<td align='right' class='tdgl1'>�s���ץͤJ�ǾǦ~���G</td>
								<td class='tdGrayLight'><input type=text name='FTSTUD_ENROLL_AYEAR'>
								<select name='FTSTUD_ENROLL_SMS'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SMS");</script>
								</select>
								</td>
								<td align='right' class='tdgl1' nowrap>���D�׵��O�G</td>
								<td class='tdGrayLight'><input type=text name='DBMAJOR_MK'></td>
								
							</tr>
							<tr style='display:none'>
								<td align='right' class='tdgl1'>�M�Z�_�Ǧ~���G</td>
								<td class='tdGrayLight'><input type=text name='SAYEAR' >
								<select name='SSMS'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SMS");</script>
								</select>
								</td>
								<td align='right' class='tdgl2'>�M�Z���Ǧ~���G</td>
								<td class='tdGrayLight'><input type=text name='EAYEAR'>
								<select name='ESMS'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SMS");</script>
								</select>
								</td>
							</tr>
							<tr>								
								<td align='right' class='tdgl2'>���v�_�Ǧ~���G</td>								
								<td class='tdGrayLight'>
									<input type=text name='STOP_PRVLG_SAYEAR'>
									<select name='STOP_PRVLG_SSMS'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SMS");</script>
									</select>
								</td>
								<td align='right' class='tdgl1'>���v���Ǧ~���G</td>
								<td class='tdGrayLight'>
								<input type=text name='STOP_PRVLG_EAYEAR'>
									<select name='STOP_PRVLG_ESMS'>										
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SMS");</script>
									</select>
								</td>
							</tr>
							<tr>
							<td align='right' class='tdgl1'>�̪�@�����~�Ǧ~���G</td>
								<td class='tdGrayLight'>
									<input type=text name='GRAD_AYEAR'>
									<select name='GRAD_SMS'>										
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SMS");</script>
									</select>
								</td>								
								<td align='right' class='tdgl2'>�h�ǾǦ~���G</td>
								<td class='tdGrayLight'>
									<input type=text name='DROPOUT_AYEAR'>
									<select name='DROPOUT_SMS'>										
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SMS");</script>
									</select>
								</td>
							</tr>
							<tr>
								<td align='right' class='tdgl1' id = 'a9'>�w�w�D�׾Ǩt�G</td>								
								<td class='tdGrayLight' id = 'a10'>
									<select name='PRE_MAJOR_FACULTY' id = 'a11'>
										<option value=''>�п��</option>
										<option value='00'>�|���M�w</option>
										<script>Form.getSelectFromPhrase("FACULTY_CODE","","");</script>
									</select>
								</td>
								</td>
								<td align='right' class='tdgl2' id = 'a6' nowrap>�̪�@�����~�Ǩt(��)�G</td>
								<td class='tdGrayLight' id = 'a7'><input type=text name='GRAD_MAJOR_FACULTY' id = 'a8'></td>
							</tr>							
							<tr>
								<td align='right' class='tdgl1' nowrap>�O�_�ѥ[�ɮv�Z�G</td>
								<td class='tdGrayLight'><input type=text name='TUTOR_CLASS_MK'></td>
								<td align='right' class='tdgl2' nowrap>�O�_���g��ճ��W���O�G</td>
								<td class='tdGrayLight'><input type=text name='OTHER_REG_MK'></td>
							</tr>
							<tr>
								<td align='right' class='tdgl1' nowrap>��Ǵ����y���A�G</td>
								<td class='tdGrayLight'><div id='ENROLL_STATUS'></div></td>
								<td align='right' class='tdgl2'>�ŤjEmail�G</td>
								<td class='tdGrayLight'><input type=text name='NOU_EMAIL'></td>
							</tr>
							<tr>
								<td align='right' class='tdgl2' >�M�Z�N���G</td>
								<td class='tdGrayLight'><input type=text name='SPCLASS_CODE'></td>
								<td align='right' class='tdgl2' nowrap>�űM��էO�G</td>
								<td class='tdGrayLight'><input type=text name='J_FACULTY_CODE'></td>
								<td align='right' class='tdgl2' nowrap style='display:none'>�M�Z���O�G</td>
								<td class='tdGrayLight' style='display:none'><input type=text name='SPCLASS_TYPE'></td>
							</tr>
							<tr>
								<td align='right' class='tdgl1'>���W���ץͤJ�ǾǾ��G</td>
								<td class='tdGrayLight' colspan=3><input type=text name='EDUBKGRD'>
								<font color='GREEN'>��(��)�~�Ǧ~��</font><input size="3" type=text name='EDUBKGRD_AYEAR'>					
							</tr>
							<tr>
								<td align='right' class='tdgl1'>�Ǿ����O<font color=red>��</font>�G</td>
								<td class='tdGrayLight' >									
									<select name='EDUBKGRD_GRADE'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","EDUBKGRD_GRADE");</script>
									</select> 
								</td>
								<td align='right' class='tdgl1'>���W�J�ǾǤO�G</td>
								<td class='tdGrayLight'><span id='EduabilType'>�@</span></td>
							</tr>
							<tr>
								<td align='right' class='tdgl1'>���~���O<font color=red>��</font>�G</td>
								<td class='tdGrayLight' >
									<input type=text name='GRAD_KIND_1' >
									<!-- 
									<select name='GRAD_KIND' disabled>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","GRAD_KIND");</script>
									</select>
									 -->
								</td>
								<td align='right' class='tdgl1'>���~�ǤO���O�G</td>
								<td class='tdGrayLight'><input type=text name='EDUBKGRD_ABILITY' disabled></td>
							</tr>
							<tr style='display:none'>
								<td align='right' class='tdgl2'>��K���O�G<br>(�ä[����)</td>
								<td class='tdGrayLight' colspan=3><input type=text name='REDUCE_TYPE'></td>							
							</tr>
							<tr>
								<td align='right' class='tdgl1'>�S��M�Z���O�G</td>
								<td class='tdGrayLight'>
									<select name='SPECIAL_STTYPE_TYPE'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SPECIAL_STTYPE_MK");</script>
									</select>
								</td>
								<td align='right' class='tdgl1'>�_�l�Ǧ~���G</td>
								<td class='tdGrayLight'>
									<input type=text name='SPECIAL_AYEAR'>
									<select name='SPECIAL_SMS'>										
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","SMS");</script>
									</select>
								</td>
							</tr>
							<tr>
								<td align='right' class='tdgl1'>��ť�͵��O�G</td>
								<td class='tdGrayLight'>
									<select name='INFORMAL_STUTYPE'>
										<option value=''>�п��</option>
										<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","INFORMAL_STUTYPE");</script>
									</select>
								</td>
								<td align='right' class='tdgl1'>�֭p��K�Ǥ��G</td>
								<td class='tdGrayLight'>
									<input type=text name='ACCUM_REPL_CRD' disabled>									
								</td>
							</tr>
							<tr>
								<td align='right' class='tdgl1'>�֭p��׾Ǥ��G</td>
								<td class='tdGrayLight'>
									<input type=text name='ACCUM_REDUCE_CRD' disabled>
								</td>
								<td align='right' class='tdgl1'>�֭p��o�Ǥ��G</td>
								<td class='tdGrayLight'>
									<input type=text name='ACCUM_PASS_CRD' disabled>
								</td>
							</tr>
							<tr>
								<td align='right' class='tdgl1'>���U�ˮ־Ǧ~���G</td>
								<td class='tdGrayLight' colspan='3'>
									<input type=text name='REG_UPD_AYEARSMS' disabled>
								</td>
							</tr>
						</table>
						<!-- �s��e������ -->
					</td>
					<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
				</tr>
				<tr>
					<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
					<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="�ƪ��ιϥ�" width="100%" height="15"></td>
					<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
				</tr>
			</table>
			<!-- �s����e������ -->
		</form>
		<!-- �w�q�s�誺 Form ���� -->
	</div>

	<!--���{���-->
	<div id='TabCnt3' style='display:none'>
		<!-- �w�q�d�ߪ� Form �_�l -->
		<form name="QUERY" method="post" onsubmit="doQuery();" style="margin:0,0,5,0;">
			<input type=hidden name="control_type">
			<input type=hidden name="pageSize">
			<input type=hidden name="pageNo">
			<input type=hidden name="EXPORT_FILE_NAME">
			<input type=hidden name="EXPORT_COLUMN_FILTER">
			<input type=hidden name="STNO">
			<input type=hidden name="ASYS">
		</form>
		<!-- �w�q�d�ߪ� Form ���� -->
		<!-- �w�q�d�ߵ��G�� Form �_�l -->
		<form name="RESULT" method="post" style="margin:10,0,0,0;">
			<input type=hidden name="control_type">
			<input type=hidden keyColumn="Y" name="IDNO">
			<input type=hidden keyColumn="Y" name="BIRTHDATE">
			<input type=hidden name="STNO">	

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
								<input type=button class="btn" value='�^�d�߭�' onkeypress='doBack();'onclick='doBack();'>
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
			<!-- �d�ߵ��G�e������ -->
		</form>
		<!-- �w�q�d�ߵ��G�� Form ���� -->
	</div>
</div>



<script>
	document.write ("<font color=\"white\">" + document.lastModified + "</font>");
	window.attachEvent("onload", page_init);
	window.attachEvent("onload", onloadEvent);
</script>
</body>
</html>
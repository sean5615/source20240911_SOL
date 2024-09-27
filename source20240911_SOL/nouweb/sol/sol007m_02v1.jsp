<%/*
----------------------------------------------------------------------------------
File Name        : sol007m_02v1
Author            : ����L
Description        : SOL007M_���ʳ��W�s�͸�� - �s����ܭ���
Modification Log    :

Vers        Date           By                Notes
--------------    --------------    --------------    ----------------------------------
1.0.1        097/07/30    barry         �s�W�S��͵��O(SPECIAL_STTYPE_TYPE)���
1.0.0        097/07/15    barry         QA SOL10-01
0.0.1        096/01/29    ����L        Code Generate Create
----------------------------------------------------------------------------------
*/%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/utility/errorpage.jsp" pageEncoding="MS950"%>
<%@ include file="/utility/header.jsp"%>
<%@page import="java.util.Vector"%>
<%@page import="com.nou.aut.AUTGETRANGE"%>
<%
session.setAttribute("SOLT005_08_SELECT", "NOU#select CONCAT(a.FACULTY_CODE, a.TOTAL_CRS_NO) as SELECT_VALUE, a.TOTAL_CRS_NAME as SELECT_TEXT from syst008 a where a.ASYS = '1' and a.FACULTY_CODE != '90' and SUBSTR(a.TOTAL_CRS_NO,1,1)='0' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_09_SELECT", "NOU#select CONCAT(a.FACULTY_CODE, a.TOTAL_CRS_NO) as SELECT_VALUE, a.TOTAL_CRS_NAME as SELECT_TEXT from syst008 a where a.ASYS = '2' and a.FACULTY_CODE != '90' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT005_031_SELECT", "NOU#select CENTER_CODE AS SELECT_VALUE,CENTER_ABBRNAME AS SELECT_TEXT from SYST002 where CENTER_CODE NOT IN ('00') ORDER BY DECODE(CENTER_CODE,'15','021',CENTER_CODE)");
session.setAttribute("SOLT005_032_SELECT", "NOU#select CENTER_CODE AS SELECT_VALUE,CENTER_ABBRNAME AS SELECT_TEXT from SYST002 where CENTER_CODE NOT IN ('00') ORDER BY DECODE(CENTER_CODE,'15','021',CENTER_CODE)");
session.setAttribute("SOLT007_13_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='ASYS' AND CODE IN('1','2') ORDER BY CODE");
session.setAttribute("SOLT007_01_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='STTYPE' and CODE not in ('3','4') ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_20_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='SPECIAL_STTYPE_MK' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_09_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='ORIGIN_RACE' and CODE not in ('0','1','2','99') ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_01_1_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='STTYPE' and CODE = '3' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_02_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='EDUBKGRD_GRADE' AND CODE NOT IN ('15','16') ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_03_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='VOCATION' ORDER BY DECODE(CODE,'13','031',CODE)");
session.setAttribute("SOLT007_04_SELECT", "NOU#SELECT FACULTY_CODE||TOTAL_CRS_NO AS SELECT_VALUE , TOTAL_CRS_NAME AS SELECT_TEXT FROM SYST008 WHERE ASYS='[ASYS]' ORDER BY FACULTY_CODE||TOTAL_CRS_NO");
session.setAttribute("SOLT007_05_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='TUTOR_CLASS_MK' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_06_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='GETINFO' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_07_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='HANDICAP_TYPE' and CODE <> '00' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_08_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='HANDICAP_GRADE' and CODE <> '00' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_10_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='AUDIT_RESULT' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_11_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='SEX' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_12_SELECT", "NOU#select CENTER_CODE AS SELECT_VALUE,CENTER_NAME AS SELECT_TEXT from SYST002 ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_14_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='PAYMENT_STATUS' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_15_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='PAYMENT_METHOD' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_16_DYNSELECT", "NOU#SELECT FACULTY_CODE||TOTAL_CRS_NO AS SELECT_VALUE , TOTAL_CRS_NAME AS SELECT_TEXT FROM SYST008 WHERE ASYS='[ASYS]' ORDER BY FACULTY_CODE||TOTAL_CRS_NO");
session.setAttribute("SOLT007_17_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='SMS' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_18_SELECT", "NOU#select CENTER_CODE AS SELECT_VALUE,CENTER_ABBRNAME AS SELECT_TEXT from SYST002 where CENTER_CODE not in ('00') ORDER BY DECODE(CENTER_CODE,'15','021',CENTER_CODE)");
session.setAttribute("SOLT007_19_SELECT", "NOU#select CENTER_CODE AS SELECT_VALUE,CENTER_ABBRNAME AS SELECT_TEXT from SYST002 where CENTER_CODE not in ('00') ORDER BY DECODE(CENTER_CODE,'15','021',CENTER_CODE)");
session.setAttribute("SOLT007_20_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='NATIONCODE' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_21_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='SPECIAL_STTYPE_MK' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_22_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='NATIONCODE' AND CODE != '000' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_23_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='OVERSEA_REASON' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_24_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='OVERSEA_DOC' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_25_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='OVERSEA_NATION' ORDER BY SELECT_VALUE, SELECT_TEXT");
%>
<%
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

	// �p����L�����s���L�Ӯɤ~�|����(ex:SOLT006M_02v1�|�}���L��),�p������SOLT007�����I�s�ɫh���|����
	String keyParamTmp = Utility.nullToSpace(request.getParameter("keyParam"));
	String[] keyParam = keyParamTmp.equals("")?new String[6]:keyParamTmp.substring(1).split("&");	
%>
<%
	java.util.Vector dataVt = com.acer.util.DBUtil.getSQLData("sol007m_.jsp", "NOU", "SELECT CODE, CODE_NAME FROM SYST001 WHERE KIND = 'GETINFO' ORDER BY CODE");
	com.acer.db.VtResultSet rs	=	new com.acer.db.VtResultSet(dataVt);
	StringBuffer s = new StringBuffer();
	while(rs.next()) {
		s.append("<input type='checkbox' id='GETINFO_"+rs.getString("CODE")+"' name='GETINFO' value='"+rs.getString("CODE")+"' >"+rs.getString("CODE_NAME")+"&nbsp;&nbsp;");	
	}
	
%>
<html>
<head>
    <%@ include file="/utility/viewpageinit.jsp"%>
    <script src="<%=vr%>script/framework/query1_2_0_2.jsp"></script>
    <script src="sol007m_02c1.jsp"></script>
    <noscript>
        <p>�z���s�������䴩JavaScript�y�k�A���O�ä��v�T�z��������������e</p>
    </noscript>
</head>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="�I����" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- �w�q�s�誺 Form �_�l -->
<form name="EDIT" method="post" onsubmit="doSave();" style="margin:5,0,0,0;">
    <input type=hidden name="control_type">
    <input type=hidden name="ROWSTAMP">
    <input type=hidden name="AYEAR">
    <input type=hidden name="SMS">
    <input type=hidden name="TOTAL_RESULT">
	<input type=hidden name="NUM">
    <input type=hidden name="AUDIT_RESULT">
	<input type=hidden name="IDNO_OLD">
    <input type=hidden name="BIRTHDATE_OLD">
	<input type=hidden name="SERNO">
	<!-- �H�U�ѼƷ�Ѩ�L�����}���s���L�Ӯɤ~�|���� -->
	<input type=hidden name="IDNO_PARAM" value="<%=Utility.nullToSpace(keyParam[0]).equals("")?"":keyParam[0].split("=")[1]%>">
	<input type=hidden name="BIRTHDATE_PARAM" value="<%=Utility.nullToSpace(keyParam[1]).equals("")?"":keyParam[1].split("=")[1]%>">
	<input type=hidden name="ASYS_PARAM" value="<%=Utility.nullToSpace(keyParam[2]).equals("")?"":keyParam[2].split("=")[1]%>">
	<input type=hidden name="AYEAR_PARAM" value="<%=Utility.nullToSpace(keyParam[3]).equals("")?"":keyParam[3].split("=")[1]%>">
	<input type=hidden name="SMS_PARAM" value="<%=Utility.nullToSpace(keyParam[4]).equals("")?"":keyParam[4].split("=")[1]%>">
	<input type=hidden name="PRO_CODE_PARAM" value="<%=Utility.nullToSpace(keyParam[5]).equals("")?"":keyParam[5].split("=")[1]%>">
	<input type=hidden name="INIT_ENROLL_STATUS">
	<input type=hidden name="INIT_STTYPE">
	<input type=hidden name="IS_OLD">
	<input type=hidden name="MARRIAGE"><!-- �쥻�������,��Ӯ���,�b�o�[�W�������,�ܰʳ̤p -->
	<input type=hidden name="OLD_CENTER_CODE">
	<input type=hidden name="GETINFO_TMP">
	<input type=hidden name="PRO_CODE">
	<input type=hidden name="ENROLL_STATUS">
	
	
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
                                <input type=button class="btn" value='�^�d�߭�' onkeypress='doBack_self();'onclick='doBack_self();' id='btnBack' name='btnBack'>
                                <input type=button class="btn" value='�M  ��' onkeypress='doClear();'onclick='doClear();'>
                                <input type=button class="btn" value='�s  ��' onclick='doSave();' onkeypress='doSave();' id="SAVE_BTN" name='SAVE_BTN'">
                            </div>
                        </td>
                    </tr>
                </table>
                <!-- ���s�e������ -->

                <!-- �s��e���_�l -->
                <table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
                    <tr>
                        <td align='right' class='tdgl1'>�Ǹ��G</td>
                        <td class='tdGrayLight'><input type=text name='STNO' readonly><!-- &nbsp;<span id='idnoType'>�d�L���</span> --></td>
						<td align='right' class='tdgl2'>�Ǩ�G</td>
						<td class='tdGrayLight'><select name='ASYS'>
                            <script>Form.getSelectFromPhrase("SOLT007_13_SELECT", null, null);</script>
                            </select>
						</td>
                    </tr>
					<tr>
                        <td align='right' class='tdgl1'>�����Ҧr��<font color=red>��</font>�G</td>
						<td class='tdGrayLight'>
						<input type=text name='IDNO' size = "10" maxlength = "10" readOnly>	
						�@�@�ө~�d�Ҩ����G<input type=text name='RESIDENCE_DATE' size = "8" maxlength = "8" >			
						</td>
                        <td align='right' class='tdgl1'>�X�ͤ��<font color=red>��</font>�G</td>
                        <td class='tdGrayLight'><input type=text name='BIRTHDATE'></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'><div id="centerCode">���W�ǲ߫��ɤ���<font color='red'>��</font>�G</div></td>
                        <td class='tdGrayLight'>
							<div id="centerCodeSelect">
                            <select name='CENTER_CODE'>
                                <script>Form.getSelectFromPhrase("SOLT005_031_SELECT", null, null);</script>
                            </select>
							</div>
						</td>
                        <td align='right' class='tdgl1'>���W�����O<font color=red>��</font>�G</td>
                        <td class='tdGrayLight'>
							<div id="sttypeSelect">
                            <select id='STTYPE' name='STTYPE' onchange='docheck();'>
                                <script>Form.getSelectFromPhrase("SOLT007_01_SELECT", null, null);</script>
                            </select>
							</div>
                        </td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl2'>�m�W/�O�W�G</td>
                        <td class='tdGrayLight'><input type=text name='NAME'><input type=text name='ALIAS'></td>
                        <td align='right' class='tdgl2'>�ʧO�G</td>
                        <td class='tdGrayLight'>
                        	�k�w�ʧO<font color=red>��</font>�G
                            <select name='SEX' >
                                <option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_11_SELECT", null, null);</script>
                            </select><br>
                                                                                   �ۧڻ{�P�ʧO�G
                            <select name='SELF_IDENTITY_SEX' >
                                <option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_11_SELECT", null, null);</script>
                            </select>
                        </td>
						
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>�^��m�W�G</td>
                        <td class='tdGrayLight' ><input type=text name='ENG_NAME'></td>   
                        <td align='right' class='tdgl2'>���y�G</td>
                        <td class='tdGrayLight'>
							<select name='NATIONCODE'>
                                <option value="">�п��</option>
								<script>Form.getSelectFromPhrase("SOLT007_20_SELECT", null, null);</script>
							</select>
							�@�s�������y�G
							<select name='NEWNATION'>
								<option value="">�п��</option>
								<script>Form.getSelectFromPhrase("SOLT007_22_SELECT", null, null);</script>
							</select> 
						</td>                     
                    </tr>
                    <tr>
						<td align='right' class='tdgl2' rowspan="3">���W���ץ�<BR>�J ��  �� ��<br>(��ץͧK��)</td>
						<td class='tdGrayLight' >�զW���ΡG
						<input id="EDUBKGRD" type="text" name="EDUBKGRD" size="40"></td>
						<td class='tdGrayLight' colspan="2">
									<select name="EDUBKGRD1">
										<option value="">�п��</option>
										<option value="���~">���~</option>
										<option value="���~">���~</option>
										<option value="�w�~">�w�~</option>
										<option value="��L">��L</option>
									</select>
									<font color='GREEN'>��(��)�~�Ǧ~��</font><input size="3" type=text name='EDUBKGRD_AYEAR'>
						</td>
                    </tr>
                    <!--<tr>
                            <td class='tdGrayLight' colspan="2" align="center">(�ж��ҮѤW���զW����)</td>
                            <td class='tdGrayLight'>(���~�B���~�B�w�~��)</td>
                    </tr>
                    -->
                    <tr>
		 				<td class='tdGrayLight' colspan="3">
		 					<font size="3" color='red'>���J�ǾǾ��ΤJ�ǾǾ����O��ơA�A�ξǥͲ��~�B��K�δ�K�����v�q�A�J�g�Ǯռf�d�ҥ��A���o�ӽ��ܧ�A�Ч��V�Ŀ�B��g�A�æA�T�{��s�ɰe�X�F�J�ǾǾ����Ƚж�g�ҮѤW���զW���ΡC</font>
						</td>
					</tr>
                    
                    <tr>
                            <td class='tdGrayLight' colspan="3">��g�d�ҡG<br>
								1.���~�ͨҡG�x�W�٥ߤj�s���Ť��� ���~ <br>
								2.���~�ͨҡG�x�W�٥ߤj�s���Ťu�~¾�~�Ǯժ��]���Ťu�~¾�~�i�׸ɲ߾Ǯ� ���~ <br>
								3.�w�~�ͨҡG�x�W�٥ߤj�s���Ť��� �w�~�ײ��G�U�ҵ{�i�ɯ� <br>
								4.�޳N�h�ҨҡG���ŧ޳N�h�Ҥ��~�H�W�B�A�ŧ޳N�h�ҤG�~�H�W <br>
								5.�ҸզW�٤�����ҡG���ȤH�������ҸաB�G�ŦҸդH�Ʀ�F��  <br>
								6.�j�Ǹw�~�̡A�Ы������]¾�^���~�ΦP���Ǿ����W
							</td>
                    </tr>
                    <tr>                        
                        <td align='right' class='tdgl1'>�J�ǾǾ����O<font color=red>��</font>�G</td>
                        <td class='tdGrayLight'  colspan='3'>
                            <select name='EDUBKGRD_GRADE'>
                                <script>Form.getSelectFromPhrase("SOLT007_02_SELECT", null, null);</script>
                            </select>
						</td>
					</tr>
                    <tr>
                        <td align='right' class='tdgl2'>ZIP/���y�a�}�G</td>
                        <td class='tdGrayLight' colspan="3"><input type=text name='DMSTADDR_ZIP' size="5"><input type=text name='DMSTADDR' size="50"></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>ZIP/�q�T�a�}�G</td>
                        <td class='tdGrayLight' colspan="3"><input type=text name='CRRSADDR_ZIP' size="5"><input type=text name='CRRSADDR' size="50"></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl2'>�p���q��(��)�G</td>
                        <td class='tdGrayLight'>(<input size="3" type=text name='AREACODE_OFFICE'>)<input size="8" type=text name='TEL_OFFICE'>�����G<input size="6" type=text name='TEL_OFFICE_EXT'></td>
                        <td align='right' class='tdgl2'>�p���q��(�v)�G</td>
                        <td class='tdGrayLight'>(<input size="3" type=text name='AREACODE_HOME'>)<input size="8" type=text name='TEL_HOME'></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>��ʹq��<font color=red>��</font>�G</td>
                        <td class='tdGrayLight'><input type=text name='MOBILE'><br>�p�G�S���ӤH����A�ж�g�u0000�v</td>
                        <td align='right' class='tdgl1'>�ӤH�q�l�H�c<font color=red>��</font>�G</td>
                        <td class='tdGrayLight'><input type=text name='EMAIL'><br>�p�G�S���ӤH�q�l�H�c�A�ж�g�u0@0.0�v</td>
                    </tr>
			        <tr>
						<td align='right' class='tdgl1' colspan='1'>¾�~�G</td>
						<td class='tdGrayLight' colspan="3">
							<select name='VOCATION'>
                                <script>Form.getSelectFromPhrase("SOLT007_03_SELECT", null, null);</script>
                            </select>
                            	�A�Ⱦ���(���)���ΡG<input id="VOCATION_DEPT" type="text" name="VOCATION_DEPT" size="50"
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>����p���H<font color=red>��</font>�G</td>
						<td class='tdGrayLight' ><input type=text name='EMRGNCY_NAME' onkeydown="kdnext(9);kdEMRGNCY_NAME()"></td>
						<td align='right' class='tdgl2'>����p���H�q��<font color=red>��</font>�G</td>
						<td class='tdGrayLight' ><input type=text name='EMRGNCY_TEL' onkeydown="kdnext(10);kdEMRGNCY_TEL()"></td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>����p���H���Y<font color=red>��</font>�G</td>
						<td class='tdGrayLight' colspan='1'><input type=text name='EMRGNCY_RELATION' onkeydown="kdnext(11);kdEMRGNCY_RELATION()"></td>
						<td align='right' class='tdgl1'>����p���H�q�l�H�c<font color=red>��</font>�G</td>
                        <td class='tdGrayLight'><input type=text name='EMRGNCY_EMAIL'></td>
					</tr>
					<tr>
                        <td align='right' class='tdgl2'><div id="preMajorFaculty">�w�w�D�׾Ǩt<font color='red'>��</font>�G</div></td>
	                    <td class='tdGrayLight'>
							<div id="majorForSelect">
								<select name='PRE_MAJOR_FACULTY' id='PRE_MAJOR_FACULTY'>
									<option value="0000">�|���M�w</option>
									<script>Form.getSelectFromPhrase("SOLT005_08_SELECT", null, null);</script>
								</select>
							</div>
	                    </td>
                        <td align='right' class='tdgl2'>�ɮv�Z<font color=red>��</font>�G</td>
                        <td class='tdGrayLight'>
                            <select name='TUTOR_CLASS_MK' >
								<option value='1'>�H���s�Z</option>
                                 <!-- <script>Form.getSelectFromPhrase("SOLT007_05_SELECT", null, null);</script> --> 
                            </select>
						</td>
					</tr>
                        <td align='right' class='tdgl1'>��o�Ťj�ۥͨӷ�(�i�ƿ�)<font color=red>��</font>�G</td>
                        <td class='tdGrayLight' colspan='3'>
							<!-- 
                            <select name='GETINFO'  onclick ="checkGETINFO();">
								<option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_06_SELECT", null, null);</script>
                            </select>(�Ǹ��G<input type="text" name="GETINFO_NAME" >)
							(�Ǹ��G<input type="text" name="GETINFO_NAME" >)
							-->
							<%=s.toString()%>
							
						</td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl2'>�������߻�ê��U��,�ж����O�G</td>
                        <td class='tdGrayLight'>
                            <select name='HANDICAP_TYPE'>
								<option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_07_SELECT", null, null);</script>
                            </select></td>
                        <td align='right' class='tdgl2'>���߻�ê�ŧO�G</td>
                        <td colspan='3' class='tdGrayLight'>
                            <select name='HANDICAP_GRADE'>
								<option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_08_SELECT", null, null);</script>
                            </select></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>�㦳���������̡A�ж�ڧO</td>
                        <td class='tdGrayLight'>
                            <select name='ORIGIN_RACE'>
								<option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_09_SELECT", null, null);</script>
                            </select>��</td>
						<td align='right' class='tdgl1'>�S��͵��O�G</td>
                        <td colspan='3' class='tdGrayLight'>
                            <select name='SPECIAL_STTYPE_TYPE'>
								<option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_21_SELECT", null, null);</script>
                            </select></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>�s����l�k</td>
                        <td class='tdGrayLight' colspan='3'>
							<select name='NEW_RESIDENT_CHD'>
								<option value=""   >�_</option>
								<option value="2"  >�O</option>
							</select>
							���˩m�W<input type=text size='20' maxlength='20' name='FATHER_NAME' ">
							���˭��O	<select name='FATHER_ORIGINAL_COUNTRY'>
	                                <option value="">�п��</option>
									<script>Form.getSelectFromPhrase("SOLT007_20_SELECT", null, null);</script>
									</select>
							���˩m�W<input type=text size='20' maxlength='20' name='MOTHER_NAME'">
							���˭��O	<select name='MOTHER_ORIGINAL_COUNTRY'>
	                                <option value="">�п��</option>
									<script>Form.getSelectFromPhrase("SOLT007_20_SELECT", null, null);</script>
									</select>
						</td>
                    </tr>
                    <tr>
						<td align='right' class='tdgl2'>���ˤH�m�W<font color=red></font>�G</td>
                        <td class='tdGrayLight' ><input type=text name='RECOMMEND_NAME'></td>
						<td align='right' class='tdgl2'>���ˤH�Ǹ��Ψ����Ҧr��<font color=red></font>�G</td>
                        <td class='tdGrayLight' ><input type=text name='RECOMMEND_ID'></td>
					</tr>
					<tr>
						<td align='right' class='tdgl2' rowspan="4">���~�~�d�͸��</td>
						<td class='tdGrayLight' colspan="3">���~�a�}�G
						<input id="OVERSEA_ADDR" type="text" name="OVERSEA_ADDR" size="80"></td>
                    </tr>                 
                    <tr>
                        <td class='tdGrayLight' colspan="3">���~�~�d��]�G
							<select name='OVERSEA_REASON'>
								<option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_23_SELECT", null, null);</script>
                            </select>
                            	��L��]�G<input id="OVERSEA_REASON_RMK" type="text" name="OVERSEA_REASON_RMK" size="30">
						</td>
                    </tr>
                    <tr>
                        <td class='tdGrayLight' colspan="3">���~�~�d��O�G
							<select name='OVERSEA_NATION'>
								<option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_25_SELECT", null, null);</script>
                            </select>
                            	�a�I(�٥�)�Ψ�L��O�G<input id="OVERSEA_NATION_RMK" type="text" name="OVERSEA_NATION_RMK" size="30">
						</td>
                    </tr>
                    <tr>
                        <td class='tdGrayLight' colspan="3">���~�~�d�ҥ�G
							<select name='OVERSEA_DOC'>
								<option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_24_SELECT", null, null);</script>
                            </select>
                            	��L�ҥ�G<input id="OVERSEA_DOC_RMK" type="text" name="OVERSEA_DOC_RMK" size="30">
                            	�Ĵ��ܡG<input id="OVERSEA_DOC_DATE" type="text" name="OVERSEA_DOC_DATE" size="10">
						</td>
                    </tr>
                    <tr>
						<td align='right' class='tdgl2'>�P�N����<font color=red>��</font>�G</td>
						<td class='tdGrayLight' colspan='3'>
							<select id="DOC_AGREE_MK" name='DOC_AGREE_MK'>
								<option value="">�п��</option>
								<option value="Y">�ڦP�N</option>
							</select>
							<font color=purple><b>���H�O�ҥH�W�Ҷ�U����Ƥγ��W�J��ú�椧�����B�Ǿ��P�����ҩ����A���P�u�꥿���۲šA�T�{�L�~�A�p���갲����B�_�ΡB���ɡB���y�B�ܳy���ơA���@�t�@���k�߳d���~�A�æP�N�̰�ߪŤ��j�Ǿǥ;ǫh��8���ά����W�w��z�A���L��ĳ�C</b></font>
						</td>
					</tr>                    
                    <tr class="mtbGreenBg">
                        <td align=center colspan='6'><span id='EditStatus'>��ե͸�ƺ��@</span><input type="checkbox" id="CHKSTD" name="CHKSTD" value="on" onclick='chkgogo();'></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>��ǮզW�١G</td>
                        <td class='tdGrayLight'>
                            <input type="text" name="SCHOOL_NAME_OLD" id="SCHOOL_NAME_OLD" size="25" maxlength='25'>
                        </td>
                        <td align='right' class='tdgl1'>��t(��)�W�١G</td>
                        <td class='tdGrayLight'>
                            <input type="text" name="FACULTY_OLD" id="FACULTY_OLD" size="25" maxlength='25'>
                        </td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>��~�šG</td>
                        <td class='tdGrayLight'>
                            <input type="text" name="GRADE_OLD" id="GRADE_OLD" size="1" maxlength='1'>
                        </td>
                        <td align='right' class='tdgl1'>��Ǹ��G</td>
                        <td class='tdGrayLight'>
                            <input type="text" name="STNO_OLD" id="STNO_OLD" size="20" maxlength='20'>
                        </td>
                    </tr>
<!--
                    <tr class="mtbGreenBg">
                        <td align=center colspan='6'><span id='EditStatus'>�f�d���A</span></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>�ҥ󥿥��O�_�ŦX�G</td>
                        <td class='tdGrayLight'>
                            <select name='CHECK_DOC' id='CHECK_DOC'>
                                <script>//Form.getSelectFromPhrase("SOLT007_10_SELECT", null, null);</script>
                            </select>
                        </td>
                        <td align='right' class='tdgl1'>�ҥ󤣲ŭ�]</td>
                        <td class='tdGrayLight'>
                            <input type="text" name="DOC_UNQUAL_REASON" id="DOC_UNQUAL_REASON" size="40">
                        </td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>ú�O���A�G</td>
                        <td class='tdGrayLight'>
                            <select name='PAYMENT_STATUS' id='PAYMENT_STATUS'>
                                <script>//Form.getSelectFromPhrase("SOLT007_14_SELECT", null, null);</script>
                            </select>
                        </td>
                        <td align='right' class='tdgl1'>ú�O�覡�G</td>
                        <td class='tdGrayLight'>
                            <select name='PAYMENT_METHOD' id='PAYMENT_METHOD'>
                                <script>//Form.getSelectFromPhrase("SOLT007_15_SELECT", null, null);</script>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>�ײ����X�G</td>
                        <td class='tdGrayLight'>
                            <input type="text" name="DRAFT_NO" id="DRAFT_NO" size="11">
                        </td>
                        <td align='right' class='tdgl1'>�s�ͼf�d���G�G</td>
                        <td colspan='3' class='tdGrayLight'>
                            <select name='AUDIT_RESULT'>
                                <script>//Form.getSelectFromPhrase("SOLT007_10_SELECT", null, null);</script>
                            </select>
                        </td>
                    </tr>
-->
                </table>
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

<!-- ���D�e���_�l -->
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="�ƪ��Ϊ��">
    <tr>
        <td>
            <table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td background="<%=vr%>images/ap_index_title.jpg" alt="�ƪ��ιϥ�">
                        �@�@<span class="title">SOL007M_���ʳ��W�s�͸��</span>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- ���D�e������ -->

<script>
    document.write ("<font color=\"white\">" + document.lastModified + "</font>");
    window.attachEvent("onload", page_init);
    window.attachEvent("onload", onloadEvent);
</script>
</body>
</html>
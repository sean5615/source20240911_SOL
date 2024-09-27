<%/*
----------------------------------------------------------------------------------
File Name        : sol0051_01v1
Author            : ����L
Description        : SOL0051_�n�����W�ǥ͸�� - ��ܭ���
Modification Log    :

Vers        Date           By                Notes
--------------    --------------    --------------    ----------------------------------
0.0.1        096/02/27    ����L        Code Generate Create
----------------------------------------------------------------------------------
*/%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/utility/errorpage.jsp" pageEncoding="MS950"%>
<%@ include file="/utility/header.jsp"%>
<%@page import="java.util.Vector"%>
<%@page import="com.nou.aut.AUTGETRANGE"%>
<%
session.setAttribute("SOLT007_01_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='STTYPE' AND CODE = '" + request.getParameter("STTYPE") +"' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_02_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='EDUBKGRD_GRADE' and CODE not in ('15','16') ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_03_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='VOCATION' ORDER BY DECODE(CODE,'13','031',CODE)"); 
session.setAttribute("SOLT007_041_SELECT", "NOU#select CONCAT(a.FACULTY_CODE, a.TOTAL_CRS_NO) as SELECT_VALUE, a.TOTAL_CRS_NAME as SELECT_TEXT from syst008 a where a.ASYS = '1' and a.FACULTY_CODE != '90' and a.TOTAL_CRS_NO like '0%' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_042_SELECT", "NOU#select CONCAT(a.FACULTY_CODE, a.TOTAL_CRS_NO) as SELECT_VALUE, a.TOTAL_CRS_NAME as SELECT_TEXT from syst008 a where a.ASYS = '2' and a.FACULTY_CODE != '90' and a.TOTAL_CRS_NO like '0%' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_05_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='TUTOR_CLASS_MK' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_06_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='GETINFO' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_07_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='HANDICAP_TYPE' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_08_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='HANDICAP_GRADE' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_09_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='ORIGIN_RACE' AND CODE<>'99' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_10_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='AUDIT_RESULT' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_11_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='SEX' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_12_SELECT", "NOU#select CENTER_CODE AS SELECT_VALUE,CENTER_ABBRNAME AS SELECT_TEXT from SYST002 WHERE CENTER_CODE = '" + request.getParameter("CENTER_CODE") + "' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_13_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='ASYS' AND CODE = '" + request.getParameter("ASYS") + "' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_14_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='SMS' ORDER BY SELECT_VALUE, SELECT_TEXT");
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
session.setAttribute("SOL004M_01_BLUR", "NOU#SELECT a.ZIP CRRSADDR_ZIP, (a.ZIP_CITY||a.ZIP_TOWN) CRRSADDR FROM SYST006 a where a.ZIP = '[CRRSADDR_ZIP]' ORDER BY a.ZIP");
session.setAttribute("SOL004M_01_WINDOW", "NOU#SELECT a.ZIP CRRSADDR_ZIP, (a.ZIP_CITY||a.ZIP_TOWN) CRRSADDR FROM SYST006 a order by a.ZIP");
session.setAttribute("SOL004M_02_BLUR", "NOU#SELECT a.ZIP DMSTADDR_ZIP, (a.ZIP_CITY||a.ZIP_TOWN) DMSTADDR FROM SYST006 a where a.ZIP = '[DMSTADDR_ZIP]' ORDER BY a.ZIP");
session.setAttribute("SOL004M_02_WINDOW", "NOU#SELECT a.ZIP DMSTADDR_ZIP, (a.ZIP_CITY||a.ZIP_TOWN) DMSTADDR FROM SYST006 a order by a.ZIP");
session.setAttribute("SOLT007_22_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='NATIONCODE' AND CODE != '000' ORDER BY SELECT_VALUE, SELECT_TEXT");

	
	/**���o��F�H�����ݤ���*/
	String user_id = (String) session.getAttribute("USER_ID");
	AUTGETRANGE aut = new AUTGETRANGE();
	aut.initRangeData(user_id);
	Vector centerVt = aut.getDEP_CODE("4","3");
	String YEAR = DateUtil.getNowCYear();
	String cd="";
	if( centerVt.size()!=0)
	{
		cd += centerVt.get(0);
	}else{	
		cd="00";	//�аȳB(�ե���)
	}
%>
<%
	java.util.Vector dataVt = com.acer.util.DBUtil.getSQLData("sol007m_.jsp", "NOU", "SELECT CODE, CODE_NAME FROM SYST001 WHERE KIND = 'GETINFO' ORDER BY CODE");
	com.acer.db.VtResultSet rs	=	new com.acer.db.VtResultSet(dataVt);
	StringBuffer s = new StringBuffer();
	while(rs.next()) {
		s.append("<input type='checkbox' id='GETINFO_"+rs.getString("CODE")+"' name='GETINFO_"+rs.getString("CODE")+"' value='"+rs.getString("CODE")+"' >"+rs.getString("CODE_NAME")+"&nbsp;&nbsp;");	
	}
	
%>
<html>
<head>
    <%@ include file="/utility/viewpageinit.jsp"%>
    <script src="<%=vr%>script/framework/query1_2_0_2.jsp"></script>
    <script src="sol0051_01c1.jsp"></script>
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
</form>
    <!-- �d�ߥ��e���_�l
    <TABLE id="QUERY_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
        <tr>
            <td width="13"><img src="<%=vr%>images/ap_search_01.jpg" alt="�ƪ��ιϥ�" width="13" height="12"></td>
            <td width="100%"><img src="<%=vr%>images/ap_search_02.jpg" alt="�ƪ��ιϥ�" width="100%" height="12"></td>
            <td width="13"><img src="<%=vr%>images/ap_search_03.jpg" alt="�ƪ��ιϥ�" width="13" height="12"></td>
        </tr>
        <tr>
            <td width="13" background="<%=vr%>images/ap_search_04.jpg" alt="�ƪ��ιϥ�">&nbsp;</td>
            <td width="100%" valign="top" bgcolor="#C5E2C3">
                <!-- ���s�e���_�l
                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
                    <tr class="mtbGreenBg">
                        <td align=left>�i�d�ߵe���j</td>
                        <td align=right>
                            <div id="serach_btn">
                                <input type=button class="btn" value='�ˬd�O�_�i���W' name="SOLCK" onkeypress="doSOLCK();" onclick="doSOLCK();">
                            </div>
                        </td>
                    </tr>
                </table>
                <!-- ���s�e������

                <!-- �d�ߵe���_�l
                <table id="table1" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" summary="�ƪ��Ϊ��">
                    <tr>
                        <td align='right'>�����Ҧr��<font color=red>��</font>�G</td>
                        <td><input type=text name='IDNO' value=<%=request.getParameter("IDNO")%>></td>
                        <td align='right'>�X�ͤ��<font color=red>��</font>�G</td>
                        <td colspan='1'><input type=text name='BIRTHDATE' value=<%=request.getParameter("BIRTHDATE")%>><img src='/images/calendar.gif' alt='���ϥ� 'style='cursor:hand' onkeypress='Calendar.showCalendar(this, _i("QUERY", "BIRTHDATE"));'onclick='Calendar.showCalendar(this, _i("QUERY", "BIRTHDATE"));'></td>
                                                <td align='right'>�Ǩ�<font color=red>��</font>�G</td>
                        <td colspan='3'>
                            <select name='ASYS'>
                            </select>
                        </td>
                    </tr>
                </table>
                <!-- �d�ߵe������
            </td>
            <td width="13" background="<%=vr%>images/ap_search_06.jpg" alt="�ƪ��ιϥ�">&nbsp;</td>
        </tr>
        <tr>
            <td width="13"><img src="<%=vr%>images/ap_search_07.jpg" alt="�ƪ��ιϥ�" width="13" height="13"></td>
            <td width="100%"><img src="<%=vr%>images/ap_search_08.jpg" alt="�ƪ��ιϥ�" width="100%" height="13"></td>
            <td width="13"><img src="<%=vr%>images/ap_search_09.jpg" alt="�ƪ��ιϥ�" width="13" height="13"></td>
        </tr>
    </table>
    <!-- �d�ߥ��e������
</form> -->
<!-- �w�q�d�ߪ� Form ���� -->
        <!-- �w�q�s�誺 Form �_�l -->
        <form id="EDIT" name="EDIT" method="post" onsubmit="doSave1();" style="margin:5,0,0,0;">
            <input type=hidden name="control_type">
            <input type=hidden name="ROWSTAMP">
            <input type=hidden name="PAYMENT_METHOD">
            <input type=hidden name="DRAFT_NO">
            <input type=hidden name="AUDIT_RESULT">
            <input type=hidden name="PAYMENT_STATUS">
            <input type=hidden name="CHECK_DOC">
            <input type=hidden name="SERNO">
			<input type=hidden name="CD" value='<%=cd%>'>
            <input type=hidden name="DOC_UNQUAL_REASON">
            <input type=hidden name="SAVE_TYPE">
            <input type=hidden name="SPECIAL_STUDENT">
            <input type=hidden name="NPAYMENT_BAR">
			<input type=hidden name='STNO'>
			<input type=hidden Column='CRRSADDR' name="CRRSADDR2">
			<input type=hidden Column='DMSTADDR' name="DMSTADDR2">
			<input type=hidden name='LIMIT' value='<%=(String)session.getAttribute("limit")%>'>
			<input type=hidden name="GETINFO_TMP" >
			
			<input type=hidden name='IDTYPE2' value=''>
			<input type=hidden name='IDTYPE3' value=''>
			<input type=hidden name='idtype' value=''>
			<input type=hidden name='RESIDENCE_BASEDATE' value=''>

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
                                        <input type=button class="btn" value='�^�W�@��' onclick="goBack();" name='QUERY_BTN'>
                                        <input type=button class="btn" value='�M  ��' onkeypress='doClear();'onclick='doClear();'>
                                        <input type=button name="SAVE_BTN" class="btn" value='�s  ��' onclick="doSave1();" onkeypress="doSave1();">
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <!-- ���s�e������ -->

                        <!-- �s��e���_�l -->
                        <table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
                            <tr>
                                <td align='right' class='tdgl2'>�Ǧ~<font color=red>��</font>�G</td>
                                <td class='tdGrayLight'><input type=text name='AYEAR' disabled></td>
                                <td align='right' class='tdgl2'>�Ǵ�<font color=red >��</font>�G</td>
                                <td class='tdGrayLight'>
                                    <select name='SMS' disabled>
                                        <option value=''>�п��</option>
                                        <script>Form.getSelectFromPhrase("SOLT007_14_SELECT", null, null);</script>
                                </select></td>
                            </tr>
							<tr>
								<td class='tdgl1' align='right'>�Ǩ�</td>
								<td class='tdGrayLight' align='left' colspan='1'>
                                <select id='ASYS' name='ASYS' disabled>
                                    <option value=''>�п��</option>
                                    <script>Form.getSelectFromPhrase("SOLT007_13_SELECT", null, null);</script>
                                </select>
                                	�����Ҧr��<input type=text name='IDNO' id= 'IDNO' disabled><br>
                                	�@�ө~�d�Ҩ����G<input type=text id="RESIDENCE_DATE" name='RESIDENCE_DATE' >
                                </td>
                                <td class='tdgl1' align='right'>�X�ͤ��</td>
                                <td class='tdGrayLight'><input type=text name='BIRTHDATE' id='BIRTHDATE' disabled></td>
                            </tr>
                            <%
                            String major = (String) request.getParameter("ASYS");
                            %>
                            <tr>
                                <td align='right' class='tdgl2'>���W<%= "1".equals(major) == true ? "�ǲ߫��ɤ���" : "�оǻ��ɳB" %><font color=red>��</font>�G</td>
                                <td class='tdGrayLight'>
                                    <select name='CENTER_CODE' disabled>
                                        <option value=''>�п��</option>
                                        <script>Form.getSelectFromPhrase("SOLT007_12_SELECT", null, null);</script>
                                </select></td>
                                <td align='right' class='tdgl2'>���W�����O<font color=red>��</font>�G</td>
                                <td class='tdGrayLight'>
                                    <select id="STTYPE" name='STTYPE' disabled>
                                        <option value=''>�п��</option>
                                        <script>Form.getSelectFromPhrase("SOLT007_01_SELECT", null, null);</script>
                                </select></td>
                            </tr>
                            <tr>
                                <td align='right' class='tdgl1'>�m�W<font color=red>��</font>�G</td>
                                <td class='tdGrayLight'><input type=text name='NAME' disabled></td>
                                <td align='right' class='tdgl1'>�ʧO�G</td>
                                <td class='tdGrayLight' colspan='3'>
                                	�k�w�ʧO<font color=red >��</font>�G
                                    <select name='SEX'  disabled>
                                        <option value=''>�п��</option>
                                        <script>Form.getSelectFromPhrase("SOLT007_11_SELECT", null, null);</script>
                               		</select> <br>
                                	�ۧڻ{�P�ʧO�G
                                	<select name='SELF_IDENTITY_SEX'>
                                        <option value=''>�п��</option>
                                        <script>Form.getSelectFromPhrase("SOLT007_11_SELECT", null, null);</script>
                                	</select>
                                </td>
                            </tr>
                            <tr>
                                <td align='right' class='tdgl1'>�^��m�W�G</td>
                                <td class='tdGrayLight'><input type=text name='ENG_NAME' >(�P�@�ӭ^��W��)</td>
                                <td align='right' class='tdgl2'>���y�O<font color=red>��</font>�G</td>
                                <td class='tdGrayLight' id ='NATIONCODE' >
									<select name='NATIONCODE' disabled>
									<!-- <option value=''>�п��</option>  -->
									<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","NATIONCODE");</script>
									</select>
									�s�������y�G
									<select name='NEWNATION'>
										<option value="">�п��</option>
										<script>Form.getSelectFromPhrase("SOLT007_22_SELECT", null, null);</script>
									</select>
								</td>
                            </tr>
							<tr>
                                <td align='right' class='tdgl2' STYLE='display:none'>�B�ê��p�G</td>
                                <td class='tdGrayLight' STYLE='display:none'><input type=radio name='MARRIAGE' value="0">�w�B<input type=radio name='MARRIAGE' value="1" checked>���B<input type=radio name='MARRIAGE' value="2">��L</td>
                                <td align='right' class='tdgl1'>�J�ǾǾ����O<font color=red>��</font>�G</td>
                                <td class='tdGrayLight' colspan='3'>
                                    <select name='EDUBKGRD_GRADE'>
                                        <option value=''>�п��</option>
                                        <script>Form.getSelectFromPhrase("SOLT007_02_SELECT", null, null);</script>
                                </select></td>
                            </tr>
                            <tr>
                                <td align='right' class='tdgl1' rowspan="4"><font size="3">���W���ץ�<BR>�J�ǾǾ�<br>(��ץͧK��)</font></td>
                                <td class='tdGrayLight' colspan="3"><font size="3">�զW���ΡG
                                <input id="edubkgrd1" type="text" name="edubkgrd1" size="40">
                                <!-- 
                                </td>
                                <td class='tdGrayLight' >
                                 -->
                                    <select name="edubkgrd2">
                                        <option value=""></option>
                                        <option value="���~">���~</option>
                                        <option value="���~">���~</option>
                                        <option value="�w�~">�w�~</option>
										<option value="��L">��L</option>
                                </select>
                                <font color='GREEN'>��(��)�~�Ǧ~��</font><input size="3" type=text name='EDUBKGRD_AYEAR'>
                                </td>
                            </tr>
                            <tr STYLE='display:none'>
                                <td class='tdGrayLight' colspan="2" align="center"><font size="3">(�ж��ҮѤW���զW����)</font></td>
                                <td class='tdGrayLight'><font size="3">(���~�B���~�B�w�~��)</font></td>
                            </tr>
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
								5.�ҸզW�٤�����ҡG���ȤH�������ҸաB�G�ŦҸդH�Ʀ�F�� <br>
								6.�j�Ǹw�~�̡A�Ы������]¾�^���~�ΦP���Ǿ����W
							</td>
							</tr>
                            <tr>
                                <td align='right' class='tdgl2'>���y�a�}<font color=red>��</font>�G</td>
                                <td class='tdGrayLight' colspan="3"><input type=text id="DMSTADDR_ZIP" Column='DMSTADDR_ZIP' name='DMSTADDR_ZIP' onblur='addr_d2(this.value)' size="5" >
								<img src='/images/select.gif' name='bt1' alt='�}�����' style='cursor:hand' onkeypress='addr_d();' onclick='addr_d();'>
								�a�}<input type=text id="DMSTADDR" Column='DMSTADDR' name='DMSTADDR' size="50" >
                                <br><input type="checkbox" name="same" onkeypress="doCopy();" onclick="doCopy();">�p���y�a�}�P�q�T�a�}�ۦP�A�Х���</td></br>
                            </tr>
                            <tr>
                                <td align='right' class='tdgl2'>�q�T�a�}<font color=red>��</font>�G</td>
                                <td class='tdGrayLight' colspan="3"><input type=text id="CRRSADDR_ZIP" Column='CRRSADDR_ZIP' name='CRRSADDR_ZIP' onblur='addr2(this.value)' size="5" >
								<img src='/images/select.gif' name='bt1' alt='�}�����' style='cursor:hand' onkeypress='addr();' onclick='addr();'>
								�a�}<input type=text id="CRRSADDR" Column='CRRSADDR' name='CRRSADDR' size="50"  ></td>
                            </tr>
                            <tr>
                                <td align='right' class='tdgl2'>�p���q��(��)�G</td>
                                <td class='tdGrayLight'>(<input size="3" type=text name='AREACODE_OFFICE'>)<input size="8" type=text name='TEL_OFFICE'>�����G<input size="6" type=text name='TEL_OFFICE_EXT'></td>
                                <td align='right' class='tdgl1'>�p���q��(�v)�G</td>
                                <td class='tdGrayLight'>(<input size="3" type=text name='AREACODE_HOME'>)<input size="8" type=text name='TEL_HOME'></td>
                            </tr>
                            <tr>
                                <td align='right' class='tdgl1'>��ʹq��<font color=red>��</font>�G</td>
                                <td class='tdGrayLight'><input type=text name='MOBILE'><br>�p�G�S���ӤH����A�ж�g�u0000�v</td>
                                <td align='right' class='tdgl1'>�ӤH�q�l�H�c<font color=red>��</font>�G</td>
                                <td class='tdGrayLight'><input type=text name='EMAIL'><br>�p�G�S���ӤH�q�l�H�c�A�ж�g�u0@0.0�v</td>
                            </tr>
							<tr>
								<td align='right' class='tdgl2'>����p���H<font color=red>��</font>�G</td>
                                <td class='tdGrayLight' ><input type=text name='EMRGNCY_NAME'></td>
								<td align='right' class='tdgl2'>����p���H�q��<font color=red>��</font>�G</td>
                                <td class='tdGrayLight' ><input type=text name='EMRGNCY_TEL'></td>
							</tr>
							<tr>
								<td align='right' class='tdgl2'>����p���H���Y<font color=red>��</font>�G</td>
                                <td class='tdGrayLight' colspan='1'><input type=text name='EMRGNCY_RELATION'></td>
                                <td align='right' class='tdgl1'>����p���H�q�l�H�c<font color=red>��</font>�G</td>
                        		<td class='tdGrayLight'><input type=text name='EMRGNCY_EMAIL'></td>
							</tr>
                            
							<tr>
								<td class='tdGrayLight' colspan="3"></td>
							</tr>
							<tr>
								<td class='tdGrayLight' colspan="3"></td>
							</tr> 
                            <tr>
                                <td align='right' class='tdgl2'><%= "1".equals(major) == true ? "�w�w�D�׾Ǩt" : "�w�w�D�׾Ǭ�" %>�G</td>
                                <td class='tdGrayLight'>
                                    <select name='PRE_MAJOR_FACULTY'>
                                        <%
                                        
                                        if("1".equals(major)){
                                        %>
                                        	<option value="0000">�|���M�w</option>
											<script>Form.getSelectFromPhrase("SOLT007_041_SELECT", null, null);</script>
                                        <%
                                        }else if("2".equals(major)){
                                        %>
                                        	<script>Form.getSelectFromPhrase("SOLT007_042_SELECT", null, null);</script>
                                        <%
                                        }
                                        %>
                                        
                                </select></td>
                                <td align='right' class='tdgl2'>�ɮv�Z<font color=red>��</font>�G</td>
                                <td class='tdGrayLight' disabled >
                                    <select name='TUTOR_CLASS_MK'>
										<option value='1'>�H���s�Z</option>
                                        <!-- <script>Form.getSelectFromPhrase("SOLT007_05_SELECT", null, null);</script> -->
                                </select></td>
                            </tr>
                            <tr>
                                <td align='right' class='tdgl1'>¾�~�G</td>
                                <td class='tdGrayLight' colspan='3'>
                                    <select name='VOCATION'>
                                        <option value=''>�п��</option>
                                        <script>Form.getSelectFromPhrase("SOLT007_03_SELECT", null, null);</script>
                                	</select>
                                		�A�Ⱦ���(���)���ΡG<input id="VOCATION_DEPT" type="text" name="VOCATION_DEPT" size="50">
                                </td>
                            </tr>
                            <tr>
                                <td align='right' class='tdgl1'>��o�Ťj�ۥͨӷ�(�i�ƿ�)<font color=red>��</font>�G</td>
                                <td class='tdGrayLight' colspan='3'>
                                	<%=s.toString() %>
                                </td>    
                            </tr>
                            <tr>
                                <td align='right' class='tdgl1'>�������߻�ê��U��,�ж����O�G</td>
                                <td class='tdGrayLight'>
                                    <select name='HANDICAP_TYPE' onchange="doLock(this.value);">
                                    	<option value=''>�п��</option>
                                        <script>Form.getSelectFromPhrase("SOLT007_07_SELECT", null, null);</script>
                                </select></td>
                                <td align='right' class='tdgl2'>���߻�ê�ŧO�G</td>
                                <td colspan='1' class='tdGrayLight'>
                                    <select name='HANDICAP_GRADE'>
                                    	<option value=''>�п��</option>
                                        <script>Form.getSelectFromPhrase("SOLT007_08_SELECT", null, null);</script>
                                </select></td>
                            </tr>
                            <tr>
                                <td align='right' class='tdgl2'>�㦳���������̡A�ж�ڧO</td>
                                <td class='tdGrayLight' colspan='1'>
                                    <select name='ORIGIN_RACE'>
										<option value=''>�п��</option>
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
                                <td class='tdGrayLight' ><input type=text name='RECOMMEND_NAME' ></td>
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
									<select name='DOC_AGREE_MK'>
										<option value="">�п��</option>
										<option value="Y">�ڦP�N</option>
									</select>
									<font color=purple><b>���H�O�ҥH�W�Ҷ�U����Ƥγ��W�J��ú�椧�����B�Ǿ��P�����ҩ����A���P�u�꥿���۲šA�T�{�L�~�A�p���갲����B�_�ΡB���ɡB���y�B�ܳy���ơA���@�t�@���k�߳d���~�A�æP�N�̰�ߪŤ��j�Ǿǥ;ǫh��8���ά����W�w��z�A���L��ĳ�C</b></font>
								</td>
							</tr>
    <!-- <tr>
        <td align='right' class='tdgl1'>��ǮզW��<font color=red>��</font>�G</td>
        <td class='tdGrayLight'><input type=text name='SCHOOL_NAME_OLD'></td>
        <td align='right' class='tdgl1'>���t<font color=red>��</font>�G</td>
        <td class='tdGrayLight'><input type=text name='FACULTY_OLD'></td>
    </tr>
    <tr>
        <td align='right' class='tdgl1'>��~��<font color=red>��</font>�G</td>
        <td class='tdGrayLight'><input type=text name='GRADE_OLD'></td>
        <td align='right' class='tdgl2'>��Ǹ�<font color=red>��</font>�G</td>
        <td class='tdGrayLight'><input type=text name='STNO_OLD'></td>
    </tr>-->
    
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

<!-- �w�q�d�ߵ��G�� Form �_�l -->
<!-- �w�q�d�ߵ��G�� Form ���� -->

<!-- ���D�e���_�l -->
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="�ƪ��Ϊ��">
    <tr>
        <td>
            <table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td background="<%=vr%>images/ap_index_title.jpg" alt="�ƪ��ιϥ�">
                        �@�@				<span class="title">SOL005M_�n�����W�ǥ͸��</span>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- ���D�e������ -->

<script>
    document.write ("<font color=\"white\">" + document.lastModified + "</font>");
    window.attachEvent("onload", page_init1);
    window.attachEvent("onload", onloadEvent);
</script>
</body>
</html>
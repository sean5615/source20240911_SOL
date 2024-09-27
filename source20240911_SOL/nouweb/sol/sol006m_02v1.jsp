<%/*
----------------------------------------------------------------------------------
File Name        : sol006m_02v1
Author            : ����L
Description        : SOL006M_�n�����W�f�d���G - �s����ܭ���
Modification Log    :

Vers        Date           By                Notes
--------------    --------------    --------------    ----------------------------------
0.0.1        096/01/25    ����L        Code Generate Create
----------------------------------------------------------------------------------
*/%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/utility/errorpage.jsp" pageEncoding="MS950"%>
<%@ include file="/utility/header.jsp"%>
<% 
session.setAttribute("SOLT006_01_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='PAYMENT_MANNER' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT006_02_SELECT", "NOU#select SYST001.CODE AS SELECT_VALUE, SYST001.CODE_NAME AS SELECT_TEXT, DECODE(B.CODE, '0', '0','1', '1','2', '5','3', '3','4', '4') AS CODE from SYST001, (SELECT CODE FROM SYST001 WHERE KIND='AUDIT_RESULT') B where KIND='AUDIT_RESULT' AND SYST001.CODE=B.CODE ORDER BY CODE");
session.setAttribute("SOLT006_02_2_SELECT", "NOU#select CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT from SYST001 where KIND='AUDIT_RESULT' and CODE <>'5' order by ORDER_NUM");
session.setAttribute("SOLT006_03_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='STTYPE' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT006_04_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='EDUBKGRD_GRADE' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT006_05_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='PAYMENT_STATUS' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT006_06_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='REG_MANNER' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT006_07_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='HANDICAP_TYPE' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT006_08_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='HANDICAP_GRADE' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT006_09_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='ORIGIN_RACE' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_11_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='SEX' ORDER BY SELECT_VALUE, SELECT_TEXT");
session.setAttribute("SOLT007_22_SELECT", "NOU#select CODE AS SELECT_VALUE,CODE_NAME AS SELECT_TEXT from SYST001 where KIND='NATIONCODE' ORDER BY SELECT_VALUE, SELECT_TEXT");
%>
<html>
<head>
    <%@ include file="/utility/viewpageinit.jsp"%>
    <script src="<%=vr%>script/framework/query1_2_0_2.jsp"></script>
    <script src="sol006m_02c1.jsp"></script>
    <noscript>
        <p>�z���s�������䴩JavaScript�y�k�A���O�ä��v�T�z��������������e</p>
    </noscript>
</head>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="�I����" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- �w�q�s�誺 Form �_�l -->
<form name="EDIT" method="post" onsubmit="doSave();" style="margin:5,0,0,0;">
    <input type=hidden name="control_type">
    <input type=hidden name="ROWSTAMP">
    <input type=hidden name="ASYS">
    <input type=hidden name="SMS">
    <input type=hidden name="CSMS">
    <input type=hidden name="AYEAR">
    <input type=hidden name="CENTER_CODE">
    <input type=hidden name="SEX">
    <input type=hidden name="SET">
	<input type=hidden name="REG_CHECK">
    <input type=hidden name="STTYPE">
    <input type=hidden name="EDUBKGRD_GRADE">
    <input type=hidden name="REG_MANNER">
    <input type=hidden name="CAUDIT_RESULT">
	<input type=hidden name="SPECIAL_STUDENT_TMP">
	<input type=hidden name="PRO_CODE">
	<input type=hidden name="BEFORE_NPAYMENT_BAR">
	<input type=hidden name="BEFORE_NPAYMENT_BAR">
	<input type=hidden name="BATNUM">
	
	<!-- �s�ɫ�n�a�X�U�@���ɩһݪ���T -->
	<input type=hidden name="NEXT_STU_DATA">  
		
	<!-- �S�Ϊ��o��� -->
	<input type=hidden name="CTOTAL_RESULT">
	<input type=hidden name="PAYABLE_AMT">
	
	
	<!--<input type=hidden name="HANDICAP_TYPE">-->

    <!-- �s����e���_�l -->
    <TABLE id="EDIT_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
        <tr>
            <td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
            <td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
            <td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
        </tr>
        <tr>
            <td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">�@</td>
            <td width="100%" valign="top" bgcolor="#FFFFFF">
                <!-- ���s�e���_�l -->
                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
                    <tr class="mtbGreenBg">
                        <td align=left>�i�s��e���j- <span id='EditStatus'>�s�W</span></td>
                        <td align=right>
                            <div id="edit_btn">
                                <input type=button class="btn" value='�^�d�߭�' onkeypress='doBack();top.mainFrame.iniGrid();'onclick='doBack();top.mainFrame.iniGrid();'>
								<input type=button class="btn" value='���ʾǥ͸��' onkeypress='goSol007m02v1();'onclick='goSol007m02v1();'>
                                <input type=button class="btn" value='�M  ��' onkeypress='doClear();'onclick='doClear();'>
                                <input type=button name="SAVE_BTN" class="btn" value='�s  ��' onkeypress='doCheckEnrollStatus();'onclick='doCheckEnrollStatus();'>
                            </div>
                        </td>
                    </tr>
                </table>
                <!-- ���s�e������ -->

                <!-- �s��e���_�l -->
                <table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
                    <tr>
                        <td align='right' class='tdgl1'>�����Ҧr���G</td>
                        <td class='tdGrayLight'><input type=text name='IDNO'>
                      	  �~�d�Ҩ����G<input type=text name='RESIDENCE_DATE' size = "8" maxlength = "8" readonly>
                        </td>
                        <td align='right' class='tdgl1'>�X�ͤ���G</td>
                        <td class='tdGrayLight'><input id="BIRTHDATE" type=text name='BIRTHDATE'></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl2'>�m�W�G</td>
                        <td class='tdGrayLight'><input type=text name='NAME' readonly><!-- &nbsp;<span id='idnoType'>�d�L���</span> --> </td>
                        <td align='right' class='tdgl2'>���W�����O�G</td>
                        <td class='tdGrayLight'><input id="CSTTYPE" type=text name='CSTTYPE' readonly></td>
                    </tr>
                    <tr>
                    <td align='right' class='tdgl1'>�~�֡G</td>
                        <td class='tdGrayLight'><input type=text id="AGE" name='AGE' readonly></td>
                        <td align='right' class='tdgl1'>�ʧO�G</td>
                        <td class='tdGrayLight'>
                        	�k�w�ʧO<font color=red>��</font>�G<input type=text name='CSEX' readonly>
                        <br>
                                                                                   �ۧڻ{�P�ʧO�G
                            <select name='SELF_IDENTITY_SEX' >
                                <option value="">�п��</option>
                                <script>Form.getSelectFromPhrase("SOLT007_11_SELECT", null, null);</script>
                            </select>	
                        </td>
                    </tr>
					<tr>
						<td align='right' class='tdgl2'>�Ǹ��G</td>
                        <td class='tdGrayLight'><input type=text id="STNO" name='STNO' readonly></td>
                        <td align='right' class='tdgl2'>���W�ǲ߫��ɤ��ߡG</td>
                        <td class='tdGrayLight'><input type=TEXT name='CCENTER_CODE' readonly></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>�J�ǾǾ����O�G</td>
                        <td class='tdGrayLight'><input id="CEDUBKGRD_GRADE" type=text name='CEDUBKGRD_GRADE' readonly> </td>
                        <td align='right' class='tdgl1'>�զW���ΡG</td>
                        <td class='tdGrayLight'><input type=text name='EDUBKGRD' size="40" readonly></td>
                    </tr>
					<tr>
                        <td align='right' class='tdgl2'>ZIP/���y�a�}�G</td>
                        <td class='tdGrayLight'><input type=text name='DMSTADDR_ZIP' size="5" readonly><input type=text name='DMSTADDR' size="50" readonly></td>
                        <td align='right' class='tdgl2'>��(��)�~�Ǧ~�סG</td>
                        <td class='tdGrayLight'><input type=text name='EDUBKGRD_AYEAR' size="3" readonly></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>ZIP/�q�T�a�}�G</td>
                        <td class='tdGrayLight' colspan="1"><input type=text name='CRRSADDR_ZIP' size="5" readonly><input type=text name='CRRSADDR' size="50" readonly></td>
                    	<td align='right' class='tdgl2'>���y�G</td>
                        <td class='tdGrayLight'>
							<select name='NATIONCODE' disabled>
								<script>Form.getSelectFromPhrase("SYST001_01_SELECT","KIND","NATIONCODE");</script>
							</select>
							<br>�s�������y�G
							<select name='NEWNATION'>
								<option value="">�п��</option>
								<script>Form.getSelectFromPhrase("SOLT007_22_SELECT", null, null);</script>
							</select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align='right' class='tdgl2'>�p���q��(��)�G</td>
                        <td class='tdGrayLight'>(<input size="3" type=text name='AREACODE_OFFICE' readonly>)<input size="8" type=text name='TEL_OFFICE' readonly>�����G<input size="6" type=text name='TEL_OFFICE_EXT' readonly></td>
                        <td align='right' class='tdgl2'>�p���q��(�v)�G</td>
                        <td class='tdGrayLight'>(<input size="3" type=text name='AREACODE_HOME' readonly>)<input size="8" type=text name='TEL_HOME' readonly></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>��ʹq�ܡG</td>
                        <td class='tdGrayLight'><input type=text name='MOBILE' readonly></td>
                        <td align='right' class='tdgl1'>�q�l�H�c�G</td>
                        <td class='tdGrayLight'><input type=text name='EMAIL' readonly></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl2'>�wú���W�O�G</td>
                        <td class='tdGrayLight'><input type=text name='PAID_AMT' readonly></td>
                        <td align='right' class='tdgl2'>���W�覡�G</td>
                        <td class='tdGrayLight'>
                            <input type=text name='CREG_MANNER' readonly>
                        </td>
                    </tr>
					<tr>
                        <td align='right' class='tdgl1'>ú�O���A�G</td>
                        <td class='tdGrayLight'>
                        <input type=HIDDEN name='PAYMENT_STATUS1' value="Y�O" onclick="check();"><input type='hidden'  id="rn" name='PAYMENT_STATUS1' value="N�_" onclick="check();">
                            <select id="PAYMENT_STATUS" name='PAYMENT_STATUS' onchange="check();">
                                <option value=''>���</option>
                                <script>Form.getSelectFromPhrase("SOLT006_05_SELECT", null, null);</script>
                            </select>
                        </td>
                        <td align='right' class='tdgl1'>ú�O�覡</td>
                        <td class='tdGrayLight'>
                            <select id="PAYMENT_METHOD" name='PAYMENT_METHOD' onchange="aa();">
                                <option value=''>���</option>
                                <script>Form.getSelectFromPhrase("SOLT006_01_SELECT", null, null);</script>
                            </select>
                        </td>
                    </tr>
					<tr>
						<td align='right' class='tdgl2'>�P�b�s���G</td>
                        <td class='tdGrayLight'><input type=text name='WRITEOFF_NO' readonly></td>
                       <td align='right' class='tdgl2'>�ײ����X�G</td>
                       <td class='tdGrayLight'><input type=text id="DRAFT_NO" name='DRAFT_NO'></td>
                    </tr>
					<tr>
						<td align='right' class='tdgl1'><font color=red>���߻�ê���O�G</font></td>
                        <td class='tdGrayLight'>
							<select id="HANDICAP_TYPE" name='HANDICAP_TYPE'>
                            <option value=''>�п��</option>
                            <script>Form.getSelectFromPhrase("SOLT006_07_SELECT", null, null);</script>
                        </select>
						</td>
                        <td align='right' class='tdgl1'><font color=red>���߻�ê�ŧO�G</font></td>
                        <td class='tdGrayLight'>
							<select id="HANDICAP_GRADE" name='HANDICAP_GRADE'>
                            <option value=''>�п��</option>
                            <script>Form.getSelectFromPhrase("SOLT006_08_SELECT", null, null);</script>
                        </select>
						</td>
                    </tr>
					<tr>
						<td align='right' class='tdgl2'><font color=red>�����ڧO�G</font></td>
                        <td class='tdGrayLight' colspan='1'>
						<select id="ORIGIN_RACE" name='ORIGIN_RACE'>
                            <option value=''>�п��</option>
                            <script>Form.getSelectFromPhrase("SOLT006_09_SELECT", null, null);</script>
                        </select>
						</td>
						<td align='right' class='tdgl2'><font color=red>�s����G</font></td>
                        <td class='tdGrayLight' colspan='1'>
						<select name='NEWNATION'>
								<option value="">�п��</option>
								<script>Form.getSelectFromPhrase("SOLT007_22_SELECT", null, null);</script>
						</select>
						</td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'><font color=red>�s����l�k�G</font></td>
                        <td class='tdGrayLight' colspan='3'>
							<select id="NEW_RESIDENT_CHD" name='NEW_RESIDENT_CHD'>
								<option value=""   >�_</option>
								<option value="2"  >�O</option>
							</select>
							���˩m�W<input type=text size='20' maxlength='20' name='FATHER_NAME' ">
							���˭��O	<select id="FATHER_ORIGINAL_COUNTRY" name='FATHER_ORIGINAL_COUNTRY'>
	                                <option value="">�п��</option>
									<script>Form.getSelectFromPhrase("SOLT007_22_SELECT", null, null);</script>
									</select>
							���˩m�W<input type=text size='20' maxlength='20' name='MOTHER_NAME'">
							���˭��O	<select id="MOTHER_ORIGINAL_COUNTRY" name='MOTHER_ORIGINAL_COUNTRY'>
	                                <option value="">�п��</option>
									<script>Form.getSelectFromPhrase("SOLT007_22_SELECT", null, null);</script>
									</select>
						</td>
                    </tr>                    
                    <tr>
						<td align='right' class='tdgl2'>�P�N����<font color=red></font>�G</td>
						<td class='tdGrayLight' colspan='3'>
							<select id="DOC_AGREE_MK" name='DOC_AGREE_MK'>
								<option value="">�п��</option>
								<option value="Y">�ڦP�N</option>
							</select>
							<font color=purple><b>���H�O�ҥH�W�Ҷ�U����Ƥγ��W�J��ú�椧�����B�Ǿ��P�����ҩ����A���P�u�꥿���۲šA�T�{�L�~�A�p���갲����B�_�ΡB���ɡB���y�B�ܳy���ơA���@�t�@���k�߳d���~�A�æP�N�̰�ߪŤ��j�Ǿǥ;ǫh��8���ά����W�w��z�A���L��ĳ�C</b></font>
						</td>
					</tr>
                    <div>
                    <tr>
                        <td align='center' class='tdgl2' colspan="4">�аȳB�f�d</td>
                    </tr>
                    
                    <tr>
                        <td align='right' class='tdgl2'>�аȳB��f���G�G</td>
                        <td class='tdGrayLight'>
                            <select name='TOTAL_RESULT' id='TOTAL_RESULT'>
                                <script>Form.getSelectFromPhrase("SOLT006_02_SELECT", null, null);</script>
                            </select><br><font size=2><b>�T�wú�������D�פ��</b></font><input type=checkbox name='TOTAL_DOC_CHECKBOX'>
                        </td>
						<td align='right' class='tdgl2'>�f�d���ŭ�]�G</td>
                        <td class='tdGrayLight'><input id="AUDIT_UNQUAL_REASON1" type=text name='AUDIT_UNQUAL_REASON1'>
						</td>
                    </tr>
                    </div>
                    <tr>
                        <td align='center' class='tdgl1' colspan="4">���߲{���f�d</td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl2' nowrap>�ҥ󥿥��O�_�ŦX�G</td>
                        <td class='tdGrayLight'>
                            <select name='CHECK_DOC' id='CHECK_DOC'>
                                <script>Form.getSelectFromPhrase("SOLT006_02_2_SELECT", null, null);</script>
                            </select>
                        </td>
                        <td align='right' class='tdgl2'>�ҥ󤣲ŭ�]�G</td>
                        <td class='tdGrayLight'><input type=text id="DOC_UNQUAL_REASON" name='DOC_UNQUAL_REASON'></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1' nowrap>���߻�ê�f�d���G�G</td>
                        <td class='tdGrayLight'>
                        <select id="HANDICAP_AUDIT_MK" name='HANDICAP_AUDIT_MK' onChange='changeMessage();'>
                                <script>Form.getSelectFromPhrase("SOLT006_02_2_SELECT", null, null);</script>
                            </select><br><span id='HANDICAP_AUDIT_MK2'></span></td>
                        <td align='right' class='tdgl1' nowrap>���߻�ê���ŭ�]�G</td>
                        <td class='tdGrayLight'><input id="HANDICAP_UNQUAL_REASON" type=text name='HANDICAP_UNQUAL_REASON'></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl2' nowrap>�C���J��f�d���G�G</td>
                        <td class='tdGrayLight'>
                            <select id="LOW_INCOME_AUDIT" name='LOW_INCOME_AUDIT' onChange='changeMessage2();'>
                                <script>Form.getSelectFromPhrase("SOLT006_02_2_SELECT", null, null);</script>
                            </select><br><span id='LOW_INCOME_AUDIT2'></td>
                        <td align='right' class='tdgl2' nowrap>�C���J�ᤣ�ŭ�]�G</td>
                        <td class='tdGrayLight'><input id="liur" type=text name='LOW_INCOME_UNQUAL_REASON'></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl2' nowrap>�s����l�k�f�d���G�G</td>
                        <td class='tdGrayLight'>
                            <select id="NEW_RESIDENT_AUDIT_MK" name='NEW_RESIDENT_AUDIT_MK' onChange='changeMessage2();'>
                                <script>Form.getSelectFromPhrase("SOLT006_02_2_SELECT", null, null);</script>
                            </select><br><span id='NEW_RESIDENT_AUDIT_MK2'></td>
                        <td align='right' class='tdgl2' nowrap>�s����l�k���ŭ�]�G</td>
                        <td class='tdGrayLight'><input id="liur" type=text name='NEW_RESIDENT_UNQUAL_REASON'></td>
                    </tr>
                    <tr>
                        <td align='right' class='tdgl1'>�Kú�O���O�G</td>
                        <td class='tdGrayLight'><input type="checkbox" id="CHKPAYMENT" name="CHKPAYMENT" value="on" onclick='chkgogo();'></td>
                        <td align='right' class='tdgl1'>�Kú�O��]�G</td>
                        <td class='tdGrayLight'><input type=text name='NPAYMENT_BAR' size='50' readonly></td>
                    </tr>
                    
                    <tr>
                        <td align='right' class='tdgl2'>���߼f�d���G�G</td>
                        <td class='tdGrayLight'>
                            <select id="AUDIT_RESULT" name='AUDIT_RESULT'>
                                <script>Form.getSelectFromPhrase("SOLT006_02_SELECT", null, null);</script>
                            </select><br><font size=2><b>�T�wú�������D�פ��</b></font><input type=checkbox name='AUDIT_DOC_CHECKBOX'>
                        </td>
                        <td align='right' class='tdgl2'>�f�d���ŭ�]�G</td>
                        <td colspan='1' class='tdGrayLight'><input id="AUDIT_UNQUAL_REASON" type=text name='AUDIT_UNQUAL_REASON'></td>
                    </tr>
                </table>
                <!-- �s��e������ -->
            </td>
            <td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">�@</td>
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
                        �@�@<span class="title">SOL006M_�n�����W�f�d���G</span>
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
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<title>审计整改及问责工单下发</title>
<head>
<%@ include file="/common/metas.jsp"%>

<link rel='stylesheet' type='text/css' media='screen'
	href='<c:url value="/css/layout.css"/>' />
<link rel='stylesheet' type='text/css' media='screen'
	href='<c:url value="/css/bd.css"/>' />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Style.css' />" />
<script language="javascript"
	src="<c:url value='/scripts/jquery.tablegrid.min.js'/>"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/styles/jquery.alerts.css' />" />
<script language="javascript"
	src="<c:url value='/scripts/ui.draggable.js'/>"></script>
<script language="javascript"
	src="<c:url value='/scripts/jquery.bgiframe.pack.js'/>"></script>
<script language="javascript"
	src="<c:url value='/scripts/jquery.alerts.modified.js'/>"></script>
<script language="javascript" type="text/javascript"
	src="<c:url value='/scripts/form/myCommon.js'/>"></script>
<script language="javascript"
	src="<c:url value='/scripts/form/jquery-calendar.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/styles/jquery-calendar.css' />" />

<script type="text/javascript" charset="UTF-8">
	//jQuery部分
	$().ready(function() {

		if ($("[name=message]").val() == "save") {
			messageAlert("保存成功!");
		}
		$("#save").click(function() {
			if (formValidate()) {
				$('#entityForm').attr('action', 'auditAccountSave.action');
				$('#entityForm').submit();
			}
		});

		$("#delete").click(function() {
			if (formValidate()) {
				$('#entityForm').attr('action', 'auditAccountDelete.action');
				$('#entityForm').submit();
			}
		});
	});
	// 必须定义的方法
	// 表单提交前调用，用于表单提交前的业务处理以及向流程引擎传入业务参数
	function beforeCommit() {

	}
	// 约定方法,必须实现
	function formValidate() {
		//给subject设置value
		if ($("#remark").val().length > 20) {
			$("#approvalTitle").val(
					$("#remark").val().substring(0, 20) + "...");
		} else {
			$("#approvalTitle").val($("#remark").val());
		} 
		return $("#entityForm").valid();
	}
	//#退回起草后的结束流程操作
	function fn_CloseProcessReback() {
		$("#status").val("90");
		$('#entityForm').attr('action', 'auditAccountSave.action');
		$('#entityForm').submit();
		$("#exit").click();
	}
</script>
</head>
<body style="padding: 0px; margin: 0px; background: #ffffff;">
	<jsp:include page="/common/processButton.jsp"></jsp:include>
	<!-- From 表单开始 -->
	<s:hidden name="id" value="1"></s:hidden>
	<s:form id="entityForm" name="entityForm"
		action="auditAccountApply.action" method="post" theme="simple">
		<!-- 包含头部button等信息 -->
		<jsp:include page="/common/processInfo.jsp"></jsp:include>
		<!--表单外框开始-->
		<div id="mainContent">
			<div class="bd_div2">
				<table class="bd_div2_1">
					<tbody>
						<tr class="tr1_bg">
							<td>审计整改及问责工单下发</td>
						</tr>

						<tr class="tr3_bg">
							<td>

								<table class="tr3_bg_table">
									<tr class="tr3_bg">
										<td class="commentName" style="width: 10%">申请部门：</td>
										<td class="commentContent" style="width: 23%"><input
											type="hidden" id="draftOrgName" name="draftOrgName"
											value="${commonEntity.draftOrgName }" />
											${commonEntity.draftOrgName }</td>
										<td class="commentName">申请人：</td>
										<td class="commentContent"><input type="hidden"
											id="draftUserName" name="draftUserName"
											value="${commonEntity.draftUserName}" />
											${commonEntity.draftUserName}</td>

										<td class="commentName">申请时间：</td>
										<td class="commentContent"><input type="hidden"
											value="<fmt:formatDate value='${commonEntity.draftTime }' pattern='yyyy-MM-dd'/>"
											id="draftTime" name="draftTime" /> <fmt:formatDate
												value='${commonEntity.draftTime }' pattern='yyyy-MM-dd' /></td>
									</tr>
									<tr>
										<td calss="commentName"  align="right"> 标&nbsp;&nbsp;&nbsp;题：</td>
									     <td colspan="5" class="commentContent">
									     	<div class="formtextarea">
									     	<textarea class="" maxlength="500" id="auditTitle" style="width:700px;" name="auditTitle" rows="1" title="标题" required>${commonEntity.auditTitle}</textarea>
									     	</div>
									     </td>
									   <td class="commentName">接收单位：</td>
										<td class="commentContent">
										<input type="test"  />
											           </td>
									    </tr>
									<tr>
										<td  calss="commentName" align="right">
												备&nbsp;&nbsp;&nbsp;注：</td>
											<td  colspan="5" class="commentContent">
												<div class="formtextarea">
													<textarea class="" maxlength="500" id="remark" style="width:400px;" name="remark" rows="4" title="备注">${commonEntity.remark}</textarea></div>
											</td>
									</tr>	
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				
				
				
	 <%-- <div style="height:6px;"></div>
					<div class="bd_div_bg">
						<ul class="bd_div_bg_ul">作者情况</ul>
						<ul class="bd_div_bg_ul1">
						<li><a class="requiredFlgControl" href="javascript:customForm.addnew(20);"><span>添加</span></a></li>
						<li><a class="requiredFlgControl" href="javascript:customForm.deleteNewCheckedBox('checkbox','');"><span>删除</span></a></li>
						</ul>
					</div>

<table id="childrenTable20" width="100%" border="0" cellspacing="0" cellpadding="0" class='childrenTable'>
       <tbody>
				<tr class="childrenTr tr_bg">
					<td style="width:40px;" align="center" name="checkbox" datetype="checkbox" types="checkbox">
                           <input type="checkbox" name="checkbox4" id="checkbox4" style="float: none;" />
                     </td>
					<td class="required bg_TextInput10" id="name" ischildtd="true" maxlength="10" name="commonEntity.TLawAuthorDetails().name" title="作者姓名" types="text">
						作者姓名</td>
					<td  class="bg_TextInput10 required" datetype="date" id="birthTime" ischildtd="true" name="commonEntity.TLawAuthorDetails().birthTime" readonly="readonly" title="作者出生日期" types="date">
						作者出生日期</td>
					<td class="required bg_TextInput10" id="company" ischildtd="true" maxlength="50" name="commonEntity.TLawAuthorDetails().company" title="作者所在单位" types="text">
						作者所在单位</td>
					<td class="required idcardno bg_TextInput10" id="idCard" ischildtd="true" maxlength="20" name="commonEntity.TLawAuthorDetails().idCard" title="作者证件号码" types="text">
						作者证件号码</td>
					<!-- <td id="deletesubtable20" style="width: 158px" type="button" value="删除">
						<input id="addsubtable20" onclick="customForm.addnew()" type="button" value="添加" /></td> -->
				</tr>
				<s:iterator id="child" value="commonEntity.TLawAuthorDetails">
				<tr count="${child.entityIndex}">
					<s:set name="index" value="#child.entityIndex"></s:set><s:set name="item" value="'commonEntity.TLawAuthorDetails('+#index+')'"></s:set>
					<td align="center">
                   		<input type="checkbox" name="checkbox" value="checkbox" />          </td>
					<td align="center">
						<s:textfield id="%{'lawauthordetailname'+#index}" name="%{#item + '.name'}" cssClass="bg_TextInput10"></s:textfield></td>
					<td align="center">
						<s:textfield id="%{'lawauthordetailbirthTime'+#index}" name="%{#item + '.birthTime'}" cssClass="bg_TextInput10"></s:textfield></td>
					<td align="center">
						<s:textfield id="%{'lawauthordetailcompany'+#index}" name="%{#item + '.company'}" cssClass="bg_TextInput10"></s:textfield></td>
					<td align="center">
						<s:textfield id="%{'lawauthordetailidCard'+#index}" name="%{#item + '.idCard'}" cssClass="bg_TextInput10"></s:textfield></td>
				<!--	<td class="commentContent">
						<s:textfield id="%{'lawauthordetailphone'+#index}" name="%{#item + '.phone'}"></s:textfield></td>
					 <td>
						<s:hidden name="%{#item + '.sid'}"></s:hidden><input onclick="customForm.deleteNew(event)" type="button" value="删除" /></td> -->
				</tr>
				</s:iterator>
			</tbody>
		</table>			
				 --%>
				
				
				
				
				
				 <div style="height:6px;"></div>
					<div class="bd_div_bg">
						<ul class="bd_div_bg_ul">【整改问题明细】</ul>
						<ul class="bd_div_bg_ul1">
						<li><a class="" onclick=""><span>添加</span></a></li>
						<li><a class="" onclick=""><span>删除</span></a></li>					
						</ul>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id="" name="">
				<tbody>					
					<tr class="tr_bg">
						<td class="form_th" id="deletesubtable11" style="width: 120px" type="button" value="全选">
							<input type="checkbox" onclick="selectAll(this)"></input>
						</td>							
						<td class="form_th" value="1" ischildtd="true" maxlength="20" name="" title="序号" types="text">
							序号</td>						
						<td class="form_th" id="problemDescription" ischildtd="true" maxlength="200" name="" title="问题描述" types="text">
							问题描述</td>
						<td  class="form_th" id="auditRequire" ischildtd="true" maxlength="20" name="" title="审计整改及问题需求" types="text">
							审计整改及问题需求</td>
						<td class="form_th date" datetype="date" id="finishTime" ischildtd="true" name="" readonly="readonly" title="完成时限" types="text">
							完成时限</td>
																	
						
					</tr>
				</tbody>
			</table> 
					
					
					
			</div>
			<input type="hidden" name="status" id="status" value="${commonEntity.status}" />
			<input type="hidden" name="processInstId" id="processInstId" value="${commonEntity.processInstId}" />
			<input type="hidden" name="draftPositionId" id="draftPositionId" value="${commonEntity.draftPositionId}" />
	        <input type="hidden" name="draftPositionName" id="draftPositionName" value="${commonEntity.draftPositionName}" />
			<input type="hidden" name="draftUserId" id="draftUserId"
				value="${commonEntity.draftUserId}" /> <input type="hidden"
				name="draftOrgId" id="draftOrgId" value="${commonEntity.draftOrgId}" />
			<input type="hidden" name="draftOrgCode" id="draftOrgCode" value="${commonEntity.draftOrgCode}" />
			<input type="hidden" name="sid" id="sid" value="${commonEntity.sid}" />
			<input type="hidden" name="approvalNo" id="approvalNo"
				value="${commonEntity.approvalNo}" /> <input type="hidden"
				name="attachmentId" id="attachmentId"
				value="${commonEntity.attachmentId}" /> <input type="hidden"
				name="approvalTitle" id="approvalTitle"
				value="${commonEntity.attachmentId}" />
	</s:form>
	<jsp:include
		page="/pages/upload/attachListPage.jsp?foreignId=${bizId}&att.bizCode=${bizCode}&readonly=0"></jsp:include>
	<p style="text-align: center">
		<s:if test="processId != null && processId != '' ">
			<div class="title02">
				<h1></h1>
				<jsp:include
					page="/pages/appertain/appertain.jsp?foreignId=${bizId}&att.bizCode=${bizCode}&moreFlg=true"></jsp:include>
			</div>
		</s:if>
	</p>
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
	</div>
</body> 
</html>

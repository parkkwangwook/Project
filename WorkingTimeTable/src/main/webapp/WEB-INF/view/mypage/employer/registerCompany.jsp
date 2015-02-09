<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>   

<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/zerogrid.css" type="text/css"
	media="all">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/responsive.css" type="text/css"
	media="all">

<script src="js/jquery-1.6.3.min.js" type="text/javascript"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/Kozuka_Gothic_Pro_OpenType_300.font.js"
	type="text/javascript"></script>
<script src="js/Kozuka_Gothic_Pro_OpenType_700.font.js"
	type="text/javascript"></script>
<script src="js/Kozuka_Gothic_Pro_OpenType_900.font.js"
	type="text/javascript"></script>
<script src="js/FF-cash.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/tms-0.3.js"></script>
<script type="text/javascript" src="js/tms_presets.js"></script>
<script type="text/javascript" src="js/easyTooltip.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/css3-mediaqueries.js"></script>

</head>
<body id="page5">


	<jsp:include page="/WEB-INF/view/main/header.jsp" /> 


	<!--==============================title================================-->

	<div class="slider-wrapper">
		<article class="col-full">
			<img src="images/logintitlebg.png">

			<ul class="lowermenu">
						<c:url value="/employer_alert" var="url"/>
						<li><a href="${url }">Alerts</a></li>
						
						<c:url value="/staff" var="url"/>
						<li><a href="${url }">Staff</a></li>
						
						<c:url value="/wage" var="url"/>
						<li><a href="${url }">Wage</a></li>
						
						<c:url value="/myCompany" var="url"/>
						<li><a href="${url }">Store</a></li>
						
						<c:url value="/mypage_employer" var="url"/>
						<li><a href="${url }">My Info</a></li>
			</ul>

		</article>
	</div>

	<!--==============================contents================================-->


	<div class="mainmenubg">
		<div class="main zerogrid">
			<h2>사장 COMPANY등록</h2><br>
			<c:url value="/mypage_myCompany" var="action"></c:url>
			<form:form modelAttribute="addCmp" method="post" action="${action}">
				<table>
					<tr>
						<td><label>회사명</label></td>
						<td><form:input path="companyName" /></td>
					</tr>
					<tr>
						<td><label>회사전화번호</label></td>
						<td><form:input path="companyTel" /></td>
					</tr>
					<tr>
						<td><label>주말수당</label></td>
						<td><form:input path="holidayComm" /></td>
					</tr>
					<tr>
						<td><label>야간수당</label></td>
						<td><form:input path="nightComm" /></td>
					</tr>
					<tr>
						<td></td>
						<td><button type="submit" name="proceed">다음</button></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/view/main/footer.jsp" />

	<script type="text/javascript">
		Cufon.now();
	</script>
</body>
</html>

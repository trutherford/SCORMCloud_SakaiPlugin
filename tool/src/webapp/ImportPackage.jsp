<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.sakaiproject.scormcloud.tool.ScormCloudPackagesBean" %>
<%@ page import="org.sakaiproject.scormcloud.model.ScormCloudPackage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%
	// Get the backing bean from the spring context
	WebApplicationContext context = 
		WebApplicationContextUtils.getWebApplicationContext(application);
	ScormCloudPackagesBean bean = (ScormCloudPackagesBean) context.getBean("packagesBean");
	
	ScormCloudPackage item = new ScormCloudPackage();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src="/library/js/headscripts.js" language="JavaScript" type="text/javascript"></script>
<link media="all" href="/library/skin/tool_base.css" rel="stylesheet" type="text/css"/>
<link media="all" href="/library/skin/default/tool.css" rel="stylesheet" type="text/css"/>
<link media="all" href="css/ScormCloud.css" rel="stylesheet" type="text/css"/>
<title>ScormCloud Add/Update Item</title>
</head>
<body onload="<%= request.getAttribute("sakai.html.body.onload") %>">
<div class="portletBody">

<c:if test="${empty param.helper}">
	<div class="navIntraTool">
		<a href="PackageList.jsp">List Packages</a>
	</div>
</c:if>

<h3 class="insColor insBak insBorder">Import Package</h3>

<% if (bean.messages.size() > 0) { %>
<div class="alertMessage">
	<ul style="margin:0px;">
	<% for (int i=0; i<bean.messages.size(); i++) { %>
		<li><%= (String) bean.messages.get(i) %></li>
	<% } %>
	</ul>
</div>
<% } bean.messages.clear(); %>

<div class="instruction">Choose a zip file containing SCORM content</div>

<form name="importPackageForm" action="controller?action=importPackage" method="post" enctype="multipart/form-data">
	<input name="helper" id="helper" type="hidden" value="${param.helper}" />
	<p class="shorttext">
			<span class="reqStar">*</span>
			<span style="padding-right: 20px">	
				File	
			</span>
			<input id="filedata" name="filedata" type="file" size="30" />
	</p>
	
	<p class="shorttext">
			<span class="reqStar">*</span>
			<span style="padding-right: 20px">
				Title
			</span>	
			<input name="item-title" id="item-title" type="text" size="28" value="" />
	</p>
	<br />
	
	<h4>Grading</h4>
	<p class="checkbox  indnt2">
		<input type="radio" 
			name="contribute-to-assigment-grade"
			id="contribute-to-assigment-grade-false"
			value="false" 
			checked="checked" />
		<label for="contribute-to-assigment-grade-false">Do NOT allow this content to contribute to assignment grade</label>
		<br />
		<input type="radio" 
			name="contribute-to-assigment-grade"
			id="contribute-to-assigment-grade-true"
			value="true" />
		<label for="contribute-to-assigment-grade-true">Allow this content to automatically contribute to assignment grade</label>
	</p>

	<p class="act">
		<input name="import-package" type="submit" value="Import" />
	</p>
</form>

</div>
</body>
</html>
<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html lang="en"  class="login_page">
<head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>CAS单点登录系统</title>
<link rel="icon" type="image/x-icon" href="${ctx}/favicon.ico" />
<link rel="stylesheet" href="${ctx }/bootstrap/css/bootstrap.min.css" />
<!-- theme color-->
<link rel="stylesheet" href="${ctx }/css/blue.css" />
<!-- tooltip -->
<link rel="stylesheet" href="${ctx }/lib/qtip2/jquery.qtip.min.css" />
<!-- main styles -->
<link rel="stylesheet" href="${ctx }/css/style.css" />
<!-- favicon -->

<!--[if lt IE 9]>
		<script src="${ctx}/js/html5shiv-3.7.2.min.js" type="text/javascript"></script>
	<![endif]-->
</head>

<body>

	<div class="login_box">
		<form:form method="post" commandName="${commandName}" id="login_form">
			<%-- <form:errors path="*" id="msg" cssClass="errors" element="div" htmlEscape="false" /> --%>
			<input type="hidden" name="lt" value="${loginTicket}" />
			<input type="hidden" name="execution" value="${flowExecutionKey}" />
			<input type="hidden" name="_eventId" value="submit" />
			 <div class="top_b" style="margin-bottom:35px">登录界面</div>
			 <spring:hasBindErrors name="credential">
                <div class="alert alert-info alert-login">
                    <c:forEach var="error" items="${errors.allErrors}">
                           <spring:message code="${error.code}" text="${error.defaultMessage}" />
                    </c:forEach>
                 </div>
            </spring:hasBindErrors>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon input-sm"> <i
						class="glyphicon glyphicon-user"></i>
					</span>
					<form:input tabindex="1" class="form-control input-sm"
						path="username" placeholder="请输入帐号" 
						maxlength="16"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon input-sm"> <i
						class="glyphicon glyphicon-lock"></i>
					</span>
					<form:password class="form-control input-sm" tabindex="2"
						path="password" placeholder="请输入密码" maxlength="16"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon input-sm"> <i
						class="glyphicon glyphicon-picture"></i>
					</span>
					<form:input tabindex="3" path="captcha" placeholder="请输入验证码" maxlength="4" class="form-control input-sm" />
					<img style="cursor: pointer; vertical-align: middle;" src="captcha.jsp"
						 onClick="this.src='captcha.jsp?time'+Math.random();">
						 <span class="input-group-addon-kaptcha" style="cursor:pointer" onClick="refreshCaptcha(this)">
                        		  看不清换一张
                        </span>
				</div>
			</div>
			<div class="btm_b clearfix">
				<button class="btn btn-default btn-sm pull-right" type="submit">登录</button>
			</div>
		</form:form>
	</div>
	<script src="${ctx }/js/jquery.min.js"></script>
	<script src="${ctx }/lib/validation/jquery.validate.js"></script>
	<script src="${ctx }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ctx }/js/login.js"></script>
	<script type="text/javascript">
		function refreshCaptcha(obj) {
			$(obj).prev("img").attr("src", "captcha.jsp?time" + Math.random());
		}
	</script>
</body>
</html>
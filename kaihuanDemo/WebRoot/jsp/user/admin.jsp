<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>凯环电子科技智能管理系统</title>
<!-- 让超链接的内容在页面的右下部分显示 -->
<base target="rightFrame"/>
		<link type="text/css" rel="stylesheet" href="../../css/style.css"/>
		<link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../../css/font-awesome.min.css">
        <script src="../../js/vendor/jquery-1.10.2.min.js"></script>
        <script src="../../js/vendor/modernizr.min.js"></script>
</head>

<body>
<!--页面顶部-->
<jsp:include page="../Top.jsp"></jsp:include>
<!--页面中部-->
<div id="content" class="main-content clearfix">
	<jsp:include page="adminSidebar.jsp"></jsp:include>
</div>
<!--页面底部-->
<jsp:include page="../Bottom.jsp"></jsp:include>
</body>
</html>
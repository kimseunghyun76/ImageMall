<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />">
    <script src="${pageContext.request.contextPath}/webjars/jquery/2.1.3/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js"></script>
    <title>theHyundai.com 이미지 검색</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">이미지 검색</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">이미지 검색</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <sec:authorize access="isAuthenticated()">
            <ul class="nav navbar-nav">
                <!--li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li-->
                <li>
                    <c:if test="${my_user_role =='1'}">
                    <a href="/user/edit?user_id=<sec:authentication property="principal.username"/>"><i class="icon-cog"></i>회원 정보</a>
                    </c:if>
                    <c:if test="${my_user_role !='1'}">
                    <a href="/admin/list">회원 정보</a>
                    </c:if>
                </li>
                <li>
                    <a href="/imgManage/list">이미지 관리</a>
                </li>
                <c:if test="${my_user_role !='1'}">
                    <li>
                        <a href="/imgGrant/list">이미지 승인</a>
                    </li>
                </c:if>
            </ul>
            </sec:authorize>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <sec:authorize access="isAnonymous()">
                        <a href="/login"><i class="icon-cog"></i>로그인</a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><strong>${my_user_name}</strong>님 정보 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/user/edit?user_id=<sec:authentication property="principal.username"/>"><i class="icon-cog"></i>내 정보 수정</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<c:url value="/logout" />"><i class="icon-off"></i>Logout</a></li>
                        </ul>
                    </sec:authorize>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
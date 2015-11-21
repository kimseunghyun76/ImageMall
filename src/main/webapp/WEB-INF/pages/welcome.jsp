<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/include_top" flush="true" />
<!-- /.container -->
<div class="container">
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12 text-center">
            <div class="row  text-center">
                <h3 class="page-header" style="border-top:50px">
                    theHyundai.com 이미지 검색
                </h3>
            </div>
            <sec:authorize access="isAnonymous()">
                <div class="row  text-center">
                    <h3>
                        로그인이 필요한 서비스 입니다.
                    </h3>
                    <div class="row text-center">
                        <a class="btn btn-primary" href="/login" role="button">로그인</a>
                    </div>
                </div>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <h1 id="type" class="page-header"><sec:authentication property="principal.username"/><small>님 반갑습니다.</small></h1>
                <ul class="list-unstyled text-left">
                    <li>
                        <a href="/admin/list">회원 정보</a>
                    </li>
                    <li>
                        <a href="/imgmanager/write">이미지 관리</a>
                    </li>
                    <li>
                        <a href="/imgmanager/list">이미지 승인</a>
                    </li>
                </ul>
            </sec:authorize>
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->
<jsp:include page="/include_bottom" flush="true" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- /.container -->
<div class="container">
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12 text-center">
            <h1 id="type" class="page-header"><sec:authentication property="principal.username"/><small><small>님 해당 페이지는 접근하실수 없습니다..</small></h1>
            <ul class="list-unstyled text-left">
                <li>
                    <a href="/">메인 페이지로 이동</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->
<jsp:include page="/include_bottom" flush="true" />
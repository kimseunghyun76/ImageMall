<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />



<!-- /.container -->
<div class="container">
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12 text-center">
            <h1 id="type" class="page-header">${user}<small>님 반갑습니다.</small></h1>
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
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->



<jsp:include page="/include_bottom" flush="true" />

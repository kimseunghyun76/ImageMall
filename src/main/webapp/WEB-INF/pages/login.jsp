<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/include_top" flush="true" />
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall">
                <h3 class="text-center login-title">theHyundai.com 이미지 검색</h3>
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                        <p>아이디와 비밀번호가 정확하지 않습니다.</p>
                    </div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success">
                        <p>로그아웃이 정상적으로 이뤄졌습니다.</p>
                    </div>
                </c:if>
                <c:url var="loginUrl" value="/login" />
                <form action="${loginUrl}" method="post" class="form-horizontal">
                    <label for="username" class="sr-only">아이디</label>
                    <input type="text" class="form-control" id="username" name="ssoId"  placeholder="아이디 입력" required autofocus>
                    <label for="password" class="sr-only">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 입력" required>
                    <br/><br/>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
                    <input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
                </form>
            </div>
            <small>고객 아이디와 패스워드를 입력해주세요.<br/>
                접속이 안될경우 관련 MD 또는 관리자에게 문의 주세요.</small>
        </div>
    </div>
</div>
<jsp:include page="/include_bottom" flush="true" />


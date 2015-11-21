<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include_top" flush="true" />
<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>회원 정보 <small> <strong>${userinfo.user_name}</strong>님 수정</small></h1>
        </div>
        <form class="form-horizontal" name="userfrm" id="userfrm" onsubmit="return onSubmitcheck();"  method="post" >
            <input type="hidden" name="user_id" value="${userinfo.user_id}" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="form-group">
                <label class="col-sm-2 control-label">ID</label>
                <div class="col-sm-6">
                    <strong>${userinfo.user_id}</strong>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">비밀번호</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
                </div>
            </div>
            <div class="form-group">
                <label for="password2" class="col-sm-2 control-label">비밀번호 확인</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="password2"  name="password2" placeholder="비밀번호 확인">
                    <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="user_name" class="col-sm-2 control-label">이름</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름" value="${userinfo.user_name}">
                </div>
            </div>
            <div class="form-group">
                <label for="group_name" class="col-sm-2 control-label">조직명</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="group_name" name="group_name" placeholder="조직명"  value="${userinfo.group_name}">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="shop_name" class="col-sm-2 control-label">매장명</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="shop_name" name="shop_name" placeholder="매장명"  value="${userinfo.shop_name}">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="category_name" class="col-sm-2 control-label">카테고리</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="category_name" name="category_name"  placeholder="카테고리" value="${userinfo.category_name}">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="user_role" class="col-sm-2 control-label">권한</label>
                <div class="col-sm-4">
                    <select id="user_role" name="user_role" class="input-xlarge">
                        <option value="3" <c:if test="${userinfo.user_role == '3'}">selected</c:if>>최고관리자</option>
                        <option value="2" <c:if test="${userinfo.user_role == '2'}">selected</c:if>>관리자</option>
                        <option value="1" <c:if test="${userinfo.user_role == '1'}">selected</c:if>>사용자</option>
                    </select>
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-success">회원 정보 수정</button>
                    <a class="btn btn-warning" href="/admin/delete?user_id=${userinfo.user_id}" role="button">삭제</a>
                    <a class="btn btn-default" href="/admin/list" role="button">목록으로</a>
                </div>
            </div>
        </form>
    </article>
</div>
<script>
    function onSubmitcheck(){
        if($("#password").val() =="" || $("#password").val().length <= 4) {
            alert("비밀번호를 입력해주세요(길이는 4자 이상 입력해주세요!");
            return false;
        }else if($("#password2").val() =="" || $("#password2").val().length <= 4) {
            alert("비밀번호 확인을 입력해주세요(길이는 4자 이상 입력해주세요!");
            return false;
        }else if($("#password").val() != $("#password2").val()){
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }else if($("#user_name").val() =="" || $("#user_name").val().length <= 2) {
            alert("이름을 입력해주세요");
            return false;
        }else{
            document.userfrm.action="/admin/edit2";
            return true;
        }
        return false;
    }
</script>

<jsp:include page="/include_bottom" flush="true" />
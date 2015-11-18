<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>회원 정보 <small>등록</small></h1>
        </div>
        <form class="form-horizontal" action="javascript:location.href='/admin/list'">
            <div class="form-group">
                <label for="user_id" class="col-sm-2 control-label">ID</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID">
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
                    <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름">
                </div>
            </div>
            <div class="form-group">
                <label for="group_name" class="col-sm-2 control-label">조직명</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="group_name" name="group_name" placeholder="조직명">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="shop_name" class="col-sm-2 control-label">매장명</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="shop_name" name="shop_name" placeholder="매장명">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="category_name" class="col-sm-2 control-label">카테고리</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="category_name" name="category_name"  placeholder="카테고리">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="user_role" class="col-sm-2 control-label">권한</label>
                <div class="col-sm-4">
                    <select id="user_role" name="user_role" class="input-xlarge">
                        <option value="1">최고관리자</option>
                        <option value="2">관리자</option>
                        <option value="3">사용자</option>
                    </select>
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-primary">회원 등록</button>
                    <a class="btn btn-default" href="/admin/list" role="button">회원 목록</a>
                </div>
            </div>
        </form>
    </article>
</div>

<script>
    if("${resultMessage}" != ""){
        alert("${resultMessage}");
        location.href="/admin/list";
    }
    function onSubmitcheck(){
        return true;
    }
</script>

<jsp:include page="/include_bottom" flush="true" />
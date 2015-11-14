<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>회원 정보 <small>등록</small></h1>
        </div>
        <form class="form-horizontal" action="javascript:location.href='/admin/list'">
            <div class="form-group">
                <label for="inputEmail" class="col-sm-2 control-label">ID</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control" id="inputEmail" placeholder="ID">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호">
                    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인">
                    <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label">이름</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="inputName" placeholder="이름">
                </div>
            </div>
            <div class="form-group">
                <label for="inputNumber" class="col-sm-2 control-label">조직명</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="inputNumber" placeholder="조직명">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="inputNumber" class="col-sm-2 control-label">매장명</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="inputNumber" placeholder="매장명">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="inputNumber" class="col-sm-2 control-label">카테고리</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="inputNumber" placeholder="카테고리">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="userrole" class="col-sm-2 control-label">권한</label>
                <div class="col-sm-4">
                    <select id="userrole" name="userrole" class="input-xlarge">
                        <option value="superadmin">최고관리자</option>
                        <option value="admin">관리자</option>
                        <option value="user">사용자</option>
                    </select>
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label"></label>
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-primary">회원 등록</button>
                    <a class="btn btn-default" href="/admin/list" role="button">회원 목록</a>
                </div>
            </div>
        </form>
    </article>
</div>
<jsp:include page="/include_bottom" flush="true" />
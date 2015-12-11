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
                <label for="password" class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <h2><strong>${userinfo.user_id}</strong></h2>
                </div>
            </div>
            <div class="form-group">
                <label for="user_idchk" class="col-sm-2 control-label">ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="user_idchk" name="user_idchk"  maxlength="40" value="${userinfo.user_id}" disabled="disabled">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" maxlength="40" >
                    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
                </div>
            </div>
            <div class="form-group">
                <label for="user_name" class="col-sm-2 control-label">이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름" value="${userinfo.user_name}" maxlength="40">
                </div>
            </div>
            <div class="form-group">
                <label for="category_name" class="col-sm-2 control-label">카테고리</label>
                <div class="col-sm-10">
                    <select id="category_name" name="category_name" class="input-xlarge">
                        <option <c:if test="${userinfo.category_name == '화장품'}">selected</c:if>>화장품</option>
                        <option <c:if test="${userinfo.category_name == '명품/잡화'}">selected</c:if>>명품/잡화</option>
                        <option <c:if test="${userinfo.category_name == '여성패션'}">selected</c:if>>여성패션</option>
                        <option <c:if test="${userinfo.category_name == '영캐쥬얼'}">selected</c:if>>영캐쥬얼</option>
                        <option <c:if test="${userinfo.category_name == '진,이지'}">selected</c:if>>진,이지</option>
                        <option <c:if test="${userinfo.category_name == '남성패션'}">selected</c:if>>남성패션</option>
                        <option <c:if test="${userinfo.category_name == '유아동/문화'}">selected</c:if>>유아동/문화</option>
                        <option <c:if test="${userinfo.category_name == '스포츠/레져'}">selected</c:if>>스포츠/레져</option>
                        <option <c:if test="${userinfo.category_name == '리빙/가전'}">selected</c:if>>리빙/가전</option>
                        <option <c:if test="${userinfo.category_name == '리빙/가전'}">selected</c:if>>리빙/가전</option>
                        <option <c:if test="${userinfo.category_name == '식품'}">selected</c:if>>식품</option>
                        <option <c:if test="${userinfo.category_name == '기타'}">selected</c:if>>기타</option>
                    </select>
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="group_name" class="col-sm-2 control-label">조직명</label>
                <div class="col-sm-10">
                    <select id="group_name" name="group_name" class="input-xlarge">
                        <option <c:if test="${userinfo.group_name == '본사'}">selected</c:if>>본사</option>
                        <option <c:if test="${userinfo.group_name == '압구정본점'}">selected</c:if>>압구정본점</option>
                        <option <c:if test="${userinfo.group_name == '천호점'}">selected</c:if>>천호점</option>
                        <option <c:if test="${userinfo.group_name == '신촌점'}">selected</c:if>>신촌점</option>
                        <option <c:if test="${userinfo.group_name == '미아점'}">selected</c:if>>미아점</option>
                        <option <c:if test="${userinfo.group_name == '중동점'}">selected</c:if>>중동점</option>
                        <option <c:if test="${userinfo.group_name == '판교점'}">selected</c:if>>판교점</option>
                        <option <c:if test="${userinfo.group_name == '부산점'}">selected</c:if>>부산점</option>
                        <option <c:if test="${userinfo.group_name == '대구점'}">selected</c:if>>대구점</option>
                        <option <c:if test="${userinfo.group_name == '울산점'}">selected</c:if>>울산점</option>
                        <option <c:if test="${userinfo.group_name == '울산동구점'}">selected</c:if>>울산동구점</option>
                        <option <c:if test="${userinfo.group_name == '기타'}">selected</c:if>>기타</option>
                    </select>
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="shop_name" class="col-sm-2 control-label">매장명</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="shop_name" name="shop_name" placeholder="매장명"  value="${userinfo.shop_name}" maxlength="40">
                    <p class="help-block"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="phone_num" class="col-sm-2 control-label">전화번호</label>
                <div class="col-sm-10">
                    <input type="num" class="form-control" id="phone_num" name="phone_num" placeholder="전화번호" value="${userinfo.phone_num}" maxlength="15">
                    <p class="help-block">숫자만 입력해주세요(15자미만)</p>
                </div>
            </div>
            <div class="form-group">
                <label for="user_role" class="col-sm-2 control-label">권한</label>
                <div class="col-sm-10">
                    <select id="user_role" name="user_role" class="input-xlarge">
                        <c:if test="${myUserinfo.user_role =='3' || userinfo.user_role == '3'}">
                          <option value="3" selected>최고관리자</option>
                        </c:if>
                        <option value="2" <c:if test="${userinfo.user_role == '2'}">selected</c:if>>관리자</option>
                        <option value="1" <c:if test="${userinfo.user_role == '1'}">selected</c:if>>사용자</option>
                    </select>
                    <p class="help-block"></p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success">수정</button>
                    <c:if test="${userinfo.user_id != myUserinfo.user_id}">
                    <a class="btn btn-warning" href="/admin/delete?user_id=${userinfo.user_id}" role="button">삭제</a>
                    <a class="btn btn-default" href="/admin/list" role="button">목록</a>
                    </c:if>
                </div>
            </div>
        </form>
    </article>
</div>
<script>
    function onSubmitcheck(){

        <c:if test="${myUserinfo.user_role =='1'}">
        if($("#password").val() =="" || $("#password").val().length <= 4) {
            alert("비밀번호를 입력해주세요(길이는 4자 이상 입력해주세요!");
            return false;
        }else if(!$("#password").val().match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
            alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 8자 이상사용해 주세요.");
            return false;
        }
        </c:if>
        if($("#user_name").val() =="" || $("#user_name").val().length <= 2) {
            alert("이름을 입력해주세요");
            return false;
        }else if($("#shop_name").val() =="" || $("#shop_name").val().length <= 2) {
            alert("매장명을 2자 이상 입력해주세요");
            return false;
        }else if($("#phone_num").val() =="" || $("#phone_num").val().length <= 11) {
            alert("전화번호를 입력해주세요");
            return false;
        }else{
            <c:if test="${userinfo.user_id == myid}">
            document.userfrm.action="/user/edit2";
            </c:if>

            <c:if test="${userinfo.user_id != myid}">
            document.userfrm.action="/admin/edit2";
            </c:if>
            return true;
        }
        return false;
    }
</script>

<jsp:include page="/include_bottom" flush="true" />
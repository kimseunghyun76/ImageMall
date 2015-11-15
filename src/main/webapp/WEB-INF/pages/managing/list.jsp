<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include_top" flush="true" />
<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>이미지 관리 <small>승인</small></h1>
        </div>

        <div class="row">
            <div class="col-md-8"></div>
            <div class="col-md-4">
                <div class="row text-right">
                    <a class="btn btn-default" href="#" role="button">승인</a>
                    <a class="btn btn-default" href="#" role="button">반려</a>
                    <a class="btn btn-default" href="#" role="button">조회</a>
                </div>
            </div>
        </div>

        <div class="row" style="padding:20px;">
            <div class="row" style="border:2px solid #e5e5e5;">
                <div class="row" style="padding:5px">
                    <div class="col-md-6">
                        <label for="a">카테고리</label>
                        <input type="text" class="form-control" id="a" placeholder="카테고리">
                    </div>

                    <div class="col-md-6">
                        <label for="b">조직명</label>
                        <input type="text" class="form-control" id="b" placeholder="조직명">
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-6">
                        <label for="c">매장명</label>
                        <input type="text" class="form-control" id="c" placeholder="매장명">
                    </div>

                    <div class="col-md-6">
                        <label for="inputId">아이디</label>
                        <input type="text" class="form-control" id="inputId" placeholder="아이디">
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-6">
                        <label for="userrole">권한 </label>
                        <select id="userrole" name="userrole" class="input-xlarge">
                            <option value="">선택</option>
                            <option value="super">최고관리자</option>
                            <option value="admin">관리자</option>
                            <option value="user">사용자</option>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label for="image_type">이미지구분  </label>
                        <select id="image_type" name="image_type" class="input-xlarge">
                            <option value="">선택</option>
                            <option value="1">로고</option>
                            <option value="2">프로모션이미지</option>
                            <option value="3">마네킹 촬영사진</option>
                        </select>
                    </div>
                </div>

            </div>
        </div>
        <div class="row" style="padding:8px;">
            <div class="table-responsive">
                <table class="table table-striped table-bordered" >
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>이미지 정보</th>
                        <th>정보변경</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="info" items="${imageInfoList}">
                        <tr onclick="location.href='/imgmanager/preview?image_seq=${info.image_seq}'" style="cursor: pointer;" >
                            <td>${info.image_seq}</td>
                            <td>운동용품 | 천호점 | 나이키골프 | URL : ${info.urlinfo} </td>
                            <td>
                                <a class="btn btn-success" href="/imgmanager/edit?image_seq=${info.image_seq}" role="button">수정</a>
                                <a class="btn btn-warning" href="/imgmanager/delete?image_seq=${info.image_seq}" role="button">삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </article>
</div>

<script>
    if("${resultMessage}" != ""){
        alert("${resultMessage}");
        location.href="/imgmanager/list";
    }
</script>
<jsp:include page="/include_bottom" flush="true" />
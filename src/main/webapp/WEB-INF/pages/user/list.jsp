<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>회원 정보 <small>관리</small></h1>
        </div>

        <div class="row">
            <div class="col-md-8"></div>
            <div class="col-md-4">
                <div class="row text-right">
                    <a class="btn btn-default" href="javascript:alert('준비중입니다.');" role="button">대량회원등록</a>
                    <a class="btn btn-default" href="/admin/write" role="button">회원등록</a>
                </div>
            </div>
        </div>

        <form class="row" style="padding:20px;" action="/admin/list">
            <div class="row" style="border:2px solid #e5e5e5;">
                <div class="row" style="padding:5px">
                    <div class="col-md-6">
                        <label for="category_name">카테고리</label>
                        <input type="text" class="form-control" name="category_name" id="category_name" placeholder="카테고리" value="${paging.category_name}">
                    </div>

                    <div class="col-md-6">
                        <label for="group_name">조직명</label>
                        <input type="text" class="form-control" name="group_name" id="group_name" placeholder="조직명" value="${paging.group_name}">
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-6">
                        <label for="shop_name">매장명</label>
                        <input type="text" class="form-control" name="shop_name" id="shop_name" placeholder="매장명" value="${paging.shop_name}">
                    </div>

                    <div class="col-md-6">
                        <label for="user_id">아이디</label>
                        <input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디" value="${paging.user_id}">
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-12">
                        <label for="user_role" style="padding-right:40px">권한 </label>
                        <select id="user_role" name="user_role" class="input-xlarge">
                            <option value="super" <c:if test="${paging.user_role == 'super'}">selected</c:if>>최고관리자</option>
                            <option value="admin" <c:if test="${paging.user_role == 'admin'}">selected</c:if>>관리자</option>
                            <option value="user" <c:if test="${paging.user_role == 'user'}">selected</c:if>>사용자</option>
                        </select>
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-primary">SEARCH</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="row" style="padding:8px;">
            <div class="table-responsive">
                <form name="listForm" action="/admin/list" method="get">
                    <input type="hidden" name="pageNo" value="" />
                    <table class="table table-striped table-bordered" >
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>권한</th>
                            <th>Info</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="info" items="${userList}" varStatus="status">
                            <tr onclick="location.href='/admin/edit?user_id=${info.user_id}'" style="cursor: pointer;">
                                <td>${paging.totalCount - (status.count +((paging.pageNo - 1) * paging.pageSize))+1}</td>
                                <th>${info.user_id}</th>
                                <th>${info.user_name}</th>
                                <th>${info.user_role}</th>
                                <td>
                                    <a class="btn btn-success" href="/admin/edit?user_id=${info.user_id}" role="button">수정</a>
                                    <a class="btn btn-warning" href="/admin/delete?user_id=${info.user_id}" role="button">삭제</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
            <jsp:include page="/include_paging" flush="true">
                <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
                <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
                <jsp:param name="startPageNo" value="${paging.startPageNo}" />
                <jsp:param name="pageNo" value="${paging.pageNo}" />
                <jsp:param name="endPageNo" value="${paging.endPageNo}" />
                <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
                <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
            </jsp:include>
            <script type="text/javascript">
                function goPage(pageNo){
                    document.listForm.pageNo.value = pageNo;
                    document.listForm.submit();
                }
            </script>
        </div>
     </article>
</div>
<jsp:include page="/include_bottom" flush="true" />
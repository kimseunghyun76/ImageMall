<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>회원 정보 <small>관리</small></h1>
        </div>

        <div class="row">
            <div class="col-md-8">
                <div class="row">
                    <form method="POST" action="uploadFile?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
                        <c:if test="${my_user_role =='3'}">
                            <a href="/resources/uploadexcel/sample.xlsx" target="_blank">Sample Excel</a>
                            <input type="file" name="file">
                            <button class="btn btn-default">대량회원등록</button>
                        </c:if>
                        <a class="btn btn-primary" href="/admin/write" role="button">회원등록</a>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
            </div>
        </div>

        <form class="row" style="padding:20px;" action="/admin/list">
            <div class="row" style="border:2px solid #e5e5e5;">
                <div class="row" style="padding:5px">
                    <div class="col-md-6">
                        <label for="category_name">카테고리</label>
                        <select id="category_name" name="category_name" class="input-xlarge">
                            <option value="all">전체</option>
                            <option <c:if test="${paging.category_name == '화장품'}">selected</c:if>>화장품</option>
                            <option <c:if test="${paging.category_name == '명품/잡화'}">selected</c:if>>명품/잡화</option>
                            <option <c:if test="${paging.category_name == '여성패션'}">selected</c:if>>여성패션</option>
                            <option <c:if test="${paging.category_name == '영캐쥬얼'}">selected</c:if>>영캐쥬얼</option>
                            <option <c:if test="${paging.category_name == '진,이지'}">selected</c:if>>진,이지</option>
                            <option <c:if test="${paging.category_name == '남성패션'}">selected</c:if>>남성패션</option>
                            <option <c:if test="${paging.category_name == '유아동/문화'}">selected</c:if>>유아동/문화</option>
                            <option <c:if test="${paging.category_name == '스포츠/레져'}">selected</c:if>>스포츠/레져</option>
                            <option <c:if test="${paging.category_name == '리빙/가전'}">selected</c:if>>리빙/가전</option>
                            <option <c:if test="${paging.category_name == '식품'}">selected</c:if>>식품</option>
                            <option <c:if test="${paging.category_name == '기타'}">selected</c:if>>기타</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="group_name">조직명</label>
                        <select id="group_name" name="group_name" class="input-xlarge">
                            <option value="all">전체</option>
                            <option <c:if test="${paging.group_name == '본사'}">selected</c:if>>본사</option>
                            <option <c:if test="${paging.group_name == '압구정본점'}">selected</c:if>>압구정본점</option>
                            <option <c:if test="${paging.group_name == '천호점'}">selected</c:if>>천호점</option>
                            <option <c:if test="${paging.group_name == '신촌점'}">selected</c:if>>신촌점</option>
                            <option <c:if test="${paging.group_name == '미아점'}">selected</c:if>>미아점</option>
                            <option <c:if test="${paging.group_name == '중동점'}">selected</c:if>>중동점</option>
                            <option <c:if test="${paging.group_name == '판교점'}">selected</c:if>>판교점</option>
                            <option <c:if test="${paging.group_name == '부산점'}">selected</c:if>>부산점</option>
                            <option <c:if test="${paging.group_name == '대구점'}">selected</c:if>>대구점</option>
                            <option <c:if test="${paging.group_name == '울산점'}">selected</c:if>>울산점</option>
                            <option <c:if test="${paging.group_name == '울산동구점'}">selected</c:if>>울산동구점</option>
                            <option <c:if test="${paging.group_name == '기타'}">selected</c:if>>기타</option>
                        </select>
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
                        <select id="user_role" name="user_role" class="input-xlarge">
                            <option value="0">전체 권한</option>
                            <c:if test="${my_user_role =='3'}">
                            <option value="3" <c:if test="${paging.user_role == '3'}">selected</c:if>>최고관리자</option>
                            </c:if>
                            <option value="2" <c:if test="${paging.user_role == '2'}">selected</c:if>>관리자</option>
                            <option value="1" <c:if test="${paging.user_role == '1'}">selected</c:if>>사용자</option>
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
                            <th>이름</th>
                            <th>카테고리</th>
                            <th>조직명</th>
                            <th>매장명</th>
                            <th>전화번호</th>
                            <th>권한</th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="info" items="${userList}" varStatus="status">
                            <tr>
                                <td>${paging.totalCount - (status.count +((paging.pageNo - 1) * paging.pageSize))+1}</td>
                                <th>${info.user_id}</th>
                                <th>${info.user_name}</th>
                                <th>${info.category_name}</th>
                                <th>${info.group_name}</th>
                                <th>${info.shop_name}</th>
                                <th>${info.phone_num}</th>
                                <th>
                                    <c:choose>
                                        <c:when test="${info.user_role=='3'}">최고관리자</c:when>
                                        <c:when test="${info.user_role=='2'}">관리자</c:when>
                                        <c:when test="${info.user_role=='1'}">사용자</c:when>
                                    </c:choose>
                                </th>
                                <td>
                                    <!--a class="btn btn-primary" href="/admin/edit?user_id=${info.user_id}" role="button">상세 보기</a-->
                                    <a class="btn btn-success" href="/admin/edit?user_id=${info.user_id}" role="button">수정</a>
                                    <c:if test="${info.user_id != my_user_id}">
                                    <a class="btn btn-warning" href="/admin/delete?user_id=${info.user_id}" role="button">삭제</a>
                                    </c:if>
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

<script>
    if("${resultMessage}" != ""){
        alert("${resultMessage}");
        location.href="/admin/list";
    }

    function onSubmitcheck(){
        if($("#file").val() =="") {
            alert("파일을 선택해신후에 대량회원 등록 버튼을 눌러 주세요.");
            return false;
        }else{
            return true;
        }
        return false;
    }
</script>
<jsp:include page="/include_bottom" flush="true" />
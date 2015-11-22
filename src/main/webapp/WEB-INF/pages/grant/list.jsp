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
                    <!--권한에 따라서....-->
                    <a class="btn btn-default" href="javascript:alert('준비중입니다.');" role="button">승인</a>
                    <a class="btn btn-default" href="javascript:alert('준비중입니다.');" role="button">반려</a>
                </div>
            </div>
        </div>

        <div class="row" style="padding:20px;">
            <form name="searchfrm" action="/imgGrant/list">
            <div class="row" style="border:2px solid #e5e5e5;">
                <div class="row" style="padding:5px">
                    <div class="col-md-6">
                        <label for="category_name">카테고리</label>
                        <input type="text" class="form-control" id="category_name" name="category_name" placeholder="카테고리" value="${paging.category_name}">
                    </div>

                    <div class="col-md-6">
                        <label for="group_name">조직명</label>
                        <input type="text" class="form-control" id="group_name" name="group_name" placeholder="조직명"  value="${paging.group_name}">
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-6">
                        <label for="shop_name">매장명</label>
                        <input type="text" class="form-control" id="shop_name" name="shop_name" placeholder="매장명" value="${paging.shop_name}">
                    </div>

                    <div class="col-md-6">
                        <label for="user_id">아이디</label>
                        <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디" value="${paging.user_id}">
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-6">
                        <label for="user_role"></label>
                        <select id="user_role" name="user_role" class="input-xlarge">
                            <option value="0">전체 권한</option>
                            <option value="3" <c:if test="${paging.user_role == '3'}">selected</c:if>>최고관리자</option>
                            <option value="2" <c:if test="${paging.user_role == '2'}">selected</c:if>>관리자</option>
                            <option value="1" <c:if test="${paging.user_role == '1'}">selected</c:if>>사용자</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="image_type"></label>
                        <select id="image_type" name="image_type" class="input-xlarge">
                            <option value="0">전체 이미지구분</option>
                            <option value="1" <c:if test="${paging.image_type == '1'}">selected</c:if>>로고</option>
                            <option value="2" <c:if test="${paging.image_type == '2'}">selected</c:if>>프로모션이미지</option>
                            <option value="3" <c:if test="${paging.image_type == '3'}">selected</c:if>>마네킹 촬영사진</option>
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
        </div>
        <div class="row" style="padding:8px;">
            <div class="table-responsive">
                <form name="listForm" action="/imgGrant/list" method="get">
                <input type="hidden" name="pageNo" value="" />
                    <table class="table table-striped table-bordered" id="domainTable">
                        <thead>
                        <tr>
                            <th><input type="checkbox" name="selectAll" id="selectAllDomainList" /></th>
                            <th>상태</th>
                            <th>대표이미지</th>
                            <th>상품코드</th>
                            <th>상품명</th>
                            <th>URL</th>
                            <th>정보변경</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="info" items="${imageInfoList}" varStatus="status">
                            <tr>
                                <td><input type="checkbox" name="domainList" value="${info.image_seq}">${paging.totalCount - (status.count +((paging.pageNo - 1) * paging.pageSize))+1}</td>
                                <td>
                                    <c:if test="${info.status == '1'}">승인요청</c:if>
                                    <c:if test="${info.status == '2'}">요청취소</c:if>
                                    <c:if test="${info.status == '3'}">반려</c:if>
                                    <c:if test="${info.status == '4'}">승인</c:if>
                                </td>
                                <td>
                                    <c:if test="${info.image_name != null}">
                                       <img src="/resources/uploadimages/${info.image_name}" alt="${info.image_name}" width="225" height="225" class="img-thumbnail" onclick="location.href='/imgGrant/preview?image_seq=${info.image_seq}'"/>
                                    </c:if>
                                    <c:if test="${info.image_name == null}">
                                        <img src="/resources/css/noImg.png" alt="등록된 이미지가 없습니다." width="225" height="225" class="img-thumbnail"/>
                                    </c:if>
                                </td>
                                <td>${info.product_code}</td>
                                <td>${info.product_name}</td>
                                <td>${info.urlinfo}</td>
                                <td>
                                    <!--권한별-->
                                    <a class="btn btn-primary" href="/imgGrant/preview?image_seq=${info.image_seq}" role="button">보기</a>

                                    <c:if test="${info.status == '1'}">
                                        <a class="btn btn-success" href="/imgGrant/edit?image_seq=${info.image_seq}" role="button">수정</a>
                                        <a class="btn btn-warning" href="/imgGrant/delete?image_seq=${info.image_seq}" role="button">삭제</a>
                                    </c:if>
                                    <a class="btn btn-default" href="javascript:alert('준비중입니다.');" role="button">승인</a>
                                    <a class="btn btn-default" href="javascript:alert('준비중입니다.');" role="button">반려</a>
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
        location.href="/imgGrant/list";
    }
    $('#selectAllDomainList').click(function() {
        var checkedStatus = this.checked;
        $('#domainTable tbody tr').find('td:first :checkbox').each(function() {
            $(this).prop('checked', checkedStatus);
        });
    });
</script>
<jsp:include page="/include_bottom" flush="true" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include_top" flush="true" />
<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>이미지 <small>목록</small></h1>
        </div>
        <div class="row">
            <div class="col-md-8"></div>
            <div class="col-md-4">
                <div class="row text-right">
                    <a class="btn btn-primary" href="/imgManage/write" role="button">이미지 등록</a>
                </div>
            </div>
        </div>

        <div class="row" style="padding:20px;">
            <form name="searchfrm" action="/imgManage/list">
            <div class="row" style="border:2px solid #e5e5e5;">
                <div class="row" style="padding:5px">
                    <div class="col-md-6">
                        <label for="product_name">상품명</label>
                        <input type="text" class="form-control" id="product_name" name="product_name" placeholder="상품명" value="${paging.product_name}">
                    </div>

                    <div class="col-md-6">
                        <label for="product_code">상품코드</label>
                        <input type="text" class="form-control" id="product_code" name="product_code" placeholder="상품코드"  value="${paging.product_code}">
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-6">
                        <label for="urlinfo">URL</label>
                        <input type="text" class="form-control" id="urlinfo" name="urlinfo" placeholder="URL" value="${paging.urlinfo}">
                    </div>

                    <div class="col-md-6">
                        <label for="image_type">이미지 구분</label>
                        <select id="image_type" name="image_type" class="input-xlarge">
                            <option value="0">전체</option>
                            <option value="1" <c:if test="${paging.image_type == '1'}">selected</c:if>>로고</option>
                            <option value="2" <c:if test="${paging.image_type == '2'}">selected</c:if>>프로모션 이미지</option>
                            <option value="3" <c:if test="${paging.image_type == '3'}">selected</c:if>>마네킹 촬영 이미지</option>
                        </select>
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-6">
                        <label for="status">상태</label>
                        <select id="status" name="status" class="input-xlarge">
                            <option value="1" <c:if test="${paging.status == '1'}">selected</c:if>>승인 요청</option>
                            <option value="3" <c:if test="${paging.status == '3'}">selected</c:if>>반려 건</option>
                            <option value="4" <c:if test="${paging.status == '4'}">selected</c:if>>승인 건</option>
                        </select>
                    </div>
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-primary">SEARCH</button>
                    </div>
                </div>
            </div>
            </form>
        </div>
        <div class="row" style="padding:8px;">
            <div class="table-responsive">
                <form name="listForm" action="/imgManage/list" method="get">
                <input type="hidden" name="pageNo" value="" />
                    <table class="table table-striped table-bordered" id="domainTable">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>상태</th>
                            <th>대표이미지</th>
                            <th>상품정보</th>
                            <th>정보변경</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="info" items="${imageInfoList}" varStatus="status">
                            <tr>
                                <td>${paging.totalCount - (status.count +((paging.pageNo - 1) * paging.pageSize))+1}</td>
                                <td>
                                    <c:if test="${info.status == '1'}"><span class="label label-primary">승인요청</span></c:if>
                                    <c:if test="${info.status == '3'}"><span class="label label-warning">반려</span></c:if>
                                    <c:if test="${info.status == '4'}"> <span class="label label-success">승인</span></c:if>
                                </td>
                                <td>
                                    <c:if test="${info.image_name != null}">
                                       <img src="/resources/uploadimages/${info.image_name}" alt="${info.image_name}" width="200" height="200" class="img-thumbnail" onclick="location.href='/imgManage/preview?image_seq=${info.image_seq}'" style="cursor:pointer"/>
                                    </c:if>
                                    <c:if test="${info.image_name == null}">
                                        <img src="/resources/css/noImg.png" alt="등록된 이미지가 없습니다." width="200" height="200" class="img-thumbnail" onclick="location.href='/imgManage/preview?image_seq=${info.image_seq}'" style="cursor:pointer"/>
                                    </c:if>
                                </td>
                                <td>
                                    <h5 class="small">[name]<br/><span class="text-overflow" title="${info.product_name}"><h4><strong>${info.product_name}</strong></h4></span></h5>
                                    <h5 class="small">[code]<br/><span class="text-overflow" title="${info.product_code}">${info.product_code}</span></h5>
                                    <h5 class="small">[link]<br/><span class="text-overflow" title="${info.urlinfo}">${info.urlinfo}</span></h5>
                                </td>
                                <td>
                                    <!--권한별-->
                                    <c:if test="${info.status == '2'}">
                                        <a class="btn btn-primary" href="/imgManage/grant?image_seq=${info.image_seq}&status=1" role="button">승인요청</a>
                                    </c:if>
                                    <c:if test="${info.status != '1'}">
                                        <a class="btn btn-success" href="/imgManage/edit?image_seq=${info.image_seq}" role="button">수정</a>
                                        <a class="btn btn-warning" href="/imgManage/delete?image_seq=${info.image_seq}" role="button">삭제</a>
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
        location.href="/imgManage/list";
    }
</script>
<jsp:include page="/include_bottom" flush="true" />
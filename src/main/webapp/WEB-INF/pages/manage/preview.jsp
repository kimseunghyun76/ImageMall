<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <form class="form-horizontal" action="/imgManage/edit2?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="image_seq" value="${imageInfo.image_seq}" />
            <h1 id="type" class="page-header">이미지<small> 미리보기</small></h1>
            <h3 class="page-header">연결 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">카테고리 </label>
                        <label class="col-sm-10">
                            <h4>${imageInfo.category_now_name}</h4>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">조직명 </label>
                        <label class="col-sm-10">
                            <h4>${imageInfo.group_now_name}</h4>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">매장명 </label>
                        <label class="col-sm-10">
                            <h4>${imageInfo.shop_now_name}</h4>
                        </label>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">승인 여부 </label>
                        <label class="col-sm-10">
                            <c:if test="${imageInfo.status == '1'}"><span class="label label-primary">승인요청</span></c:if>
                            <c:if test="${imageInfo.status == '3'}"><span class="label label-warning">반려</span></c:if>
                            <c:if test="${imageInfo.status == '4'}"><span class="label label-success">승인</span></c:if>
                        </label>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">URL 정보 </label>
                        <label class="col-sm-10">
                        <h4>
                            <c:if test="${imageInfo.image_type == '1'}"> 로고</c:if>
                            <c:if test="${imageInfo.image_type == '2'}"> 프로모션이미지</c:if>
                            <c:if test="${imageInfo.image_type == '3'}"> 마네킹 촬영사진</c:if>
                        </h4>
                        </label>
                    </div>
                    <c:forEach items="${imageFileInfo}" varStatus="status"  var="file">
                    <div class="row" >
                            <label class="col-sm-2 control-label">Upload Image ${status.count} </label>
                            <div class="col-sm-10">
                                <div class="thumbnail">
                                    <img src="/resources/uploadimages/${file.image_name}" alt="${file.image_name}"/>
                                    <div class="caption">
                                        <p>FileName : <small>${file.image_name}</small></p>
                                    </div>
                                </div>
                            </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <h3 class="page-header">연결 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">
                    <div class="row"  style="display:block;padding:10px">

                        <c:if test="${imageInfo.product_type == '1' && imageInfo.product_gubun == '1'}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">상품 코드 </label>
                                <label class="col-sm-10">
                                    <h4>${imageInfo.product_code}</h4>
                                </label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">상품명 </label>
                                <label class="col-sm-10">
                                    <h4> ${imageInfo.product_name}</h4>
                                </label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">URL 정보 </label>
                                <label class="col-sm-10">
                                    <h4>${imageInfo.urlinfo}</h4>
                                </label>
                            </div>
                        </c:if>
                        <c:if test="${imageInfo.product_type == '1'  && imageInfo.product_gubun == '2'}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">URL 정보 </label>
                                <label class="col-sm-10">
                                    <h4>${imageInfo.direct_url2}</h4>
                                </label>
                            </div>
                        </c:if>
                        <c:if test="${imageInfo.product_type == '2' && imageInfo.product_gubun == '2'}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">URL 정보 </label>
                                <label class="col-sm-10">
                                    <h4>${imageInfo.direct_url}</h4>
                                </label>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <c:if test="${imageInfo.status != '1'}">
                        <a class="btn btn-success" href="/imgManage/edit?image_seq=${imageInfo.image_seq}" role="button">수정</a>
                        <a class="btn btn-warning" href="/imgManage/delete?image_seq=${imageInfo.image_seq}" role="button">삭제</a>
                    </c:if>
                    <a class="btn btn-primary" href="/imgManage/list" role="button">목록</a>
                </div>
            </div>
        </form>
    </article>
</div>

<script>
    if("${resultMessage}" != ""){
        alert("${resultMessage}")
    }
</script>
<jsp:include page="/include_bottom" flush="true" />

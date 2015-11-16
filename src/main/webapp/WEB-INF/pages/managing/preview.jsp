<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <form class="form-horizontal" action="/imgmanager/edit2?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="image_seq" value="${imageInfo.image_seq}" />
            <h1 id="type" class="page-header">이미지<small> 미리보기</small></h1>
            <div class="row" style="padding:20px">
                <div class="form-group">
                    <label class="col-sm-2 control-label">카테고리</label>
                    <label class="col-sm-3 control-label">
                        <h4>운동용품</h4>
                    </label>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">조직명</label>
                    <label class="col-sm-3 control-label">
                        <h4>천호점</h4>
                    </label>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">매장명</label>
                    <label class="col-sm-3 control-label">
                        <h4>나이키골프</h4>
                    </label>
                </div>
            </div>

            <h3 class="page-header">연결 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">URL 정보 </label>
                        <label class="col-sm-3 control-label">
                        <h4>
                            <c:if test="${imageInfo.image_type == '1'}"> 로고</c:if>
                            <c:if test="${imageInfo.image_type == '2'}"> 프로모션이미지</c:if>
                            <c:if test="${imageInfo.image_type == '3'}"> 마네킹 촬영사진</c:if>
                        </h4>
                        </label>
                    </div>

                    <div class="row" >
                        <label class="col-sm-2 control-label">Upload Images </label>
                        <c:forEach items="${imageFileInfo}" varStatus="status"  var="file">
                            <div class="col-sm-4">
                                <div class="thumbnail">
                                    <img src="/resources/uploadimages/${file.image_name}" alt="${file.image_name}"/>
                                    <div class="caption">
                                        <h3>Image ${status.count}</h3>
                                        <p>FileName : <small>${file.image_name}</small></p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <h3 class="page-header">연결 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">
                    <div class="row" id="urlview" style="display:block;padding:10px">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">상품 코드 </label>
                            <label class="col-sm-3 control-label">
                                <h4>${imageInfo.product_code}</h4>
                            </label>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">상품명 </label>
                            <label class="col-sm-3 control-label">
                                <h4> ${imageInfo.product_name}</h4>
                            </label>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">URL 정보 </label>
                            <label class="col-sm-3 control-label">
                                <h4>${imageInfo.urlinfo}</h4>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-6">
                    <a class="btn btn-primary" href="/imgmanager/list" role="button">이미지 목록</a>
                    <a class="btn btn-success" href="/imgmanager/edit?image_seq=${imageInfo.image_seq}" role="button">수정</a>
                    <a class="btn btn-warning" href="/imgmanager/delete?image_seq=${imageInfo.image_seq}" role="button">삭제</a>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include_top" flush="true" />
<div class="contentwrap">
    <article class="container">
        <form class="form-horizontal"  name="imgfrm" id="imgfrm"  onsubmit="return onSubmitcheck();" method="post" enctype="multipart/form-data">
            <input type="hidden" name="image_seq" value="${imageInfo.image_seq}" />
            <h1 id="type" class="page-header">이미지<small>수정</small></h1>
            <div class="row" style="padding:20px">

                <div class="form-group">
                    <label for="status" class="col-sm-2 control-label">승인 여부 </label>
                    <div class="col-sm-10">
                        <select id="status" name="status" class="input-xlarge">
                            <option value="1" <c:if test="${imageInfo.status == '1'}">selected</c:if>>승인 요청</option>
                            <option value="2" <c:if test="${imageInfo.status == '2'}">selected</c:if>>승인 취소(대기)</option>
                            <option value="3" <c:if test="${imageInfo.status == '3'}">selected</c:if>>반려</option>
                            <option value="4" <c:if test="${imageInfo.status == '4'}">selected</c:if>>승인</option>
                        </select>
                        <p class="help-block">* 승인 요청 시에는 해당 정보의 수정/삭제가 불가능 합니다.</p>
                    </div>
                </div>


                <div class="form-group">
                    <label for="category_name" class="col-sm-2 control-label">카테고리</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="category_name" placeholder="카테고리" value="${imageInfo.category_name}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="group_name" class="col-sm-2 control-label">조직명</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="group_name" placeholder="조직명" value="${imageInfo.group_name}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="shop_name" class="col-sm-2 control-label">매장명</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="shop_name" placeholder="매장명" value="${imageInfo.shop_name}" readonly>
                    </div>
                </div>
            </div>

            <h3 class="page-header">이미지 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">
                    <div class="form-group">
                        <label for="image_type" class="col-sm-2 control-label">구분</label>
                        <div class="col-sm-10">
                            <select id="image_type" name="image_type" class="input-xlarge">
                                <option value="1" <c:if test="${imageInfo.image_type == '1'}">selected</c:if>>로고</option>
                                <option value="2" <c:if test="${imageInfo.image_type == '2'}">selected</c:if>>프로모션 이미지</option>
                                <option value="3" <c:if test="${imageInfo.image_type == '3'}">selected</c:if>>마네킹 촬영 이미지</option>
                            </select>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <c:forEach items="${imageFileInfo}" varStatus="status"  var="file">
                    <div class="row" >
                        <label class="col-sm-2 control-label">Upload Images ${status.count}</label>
                        <div class="col-sm-10" id="imageDiv${status.count}">
                            <div class="thumbnail">
                                <img src="/resources/uploadimages/${file.image_name}" alt="${file.image_name}"/>
                                <div class="caption">
                                    <h3>Image ${status.count} <a href="javascript:deleteImg('imageDiv${status.count}','/imgGrant/deleteFile?image_files_seq=${file.image_files_seq}');" class="btn btn-primary" role="button">삭제</a></h3>
                                    <p>FileName : <small>${file.image_name}</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div id="imageuploadzone" class="row" >
                        <div class="form-group">
                            <label for="image01" class="col-sm-2 control-label">이미지1</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" name="imageFiles" id="image01" onchange="readURL(this,1)" multiple><img id="thumbnail1"  width="0" height="0"/>
                            </div>
                        </div>
                    </div>
                    <div class="row text-right">
                        <span class="btn btn-success fileinput-button">
                            <i class="glyphicon glyphicon-plus"></i>
                            <span id="addFile">이미지 필드 추가</span>
                        </span>

                    </div>
                </div>
            </div>


            <h3 class="page-header">연결 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">
                    <div class="row" style="padding:10px">
                        <div class="form-group">
                            <label for="product_code" class="col-sm-2 control-label">상품 코드</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="product_code" id="product_code" placeholder="상품 코드" value="${imageInfo.product_code}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="product_name" class="col-sm-2 control-label">상품명</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="product_name" id="product_name" placeholder="상품명"  value="${imageInfo.product_name}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="urlinfo" class="col-sm-2 control-label">URL 정보 </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="urlinfo" id="urlinfo" placeholder="URL 정보 " value="${imageInfo.urlinfo}" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">정보 수정</button>
                    <a class="btn btn-warning" href="/imgGrant/delete?image_seq=${imageInfo.image_seq}" role="button">정보 삭제</a>
                    <a class="btn btn-default" href="/imgGrant/list" role="button">이미지 목록</a>

                </div>
            </div>
        </form>
    </article>
</div>

<script>
    if("${resultMessage}" != ""){
        alert("${resultMessage}")
    }

    $(document).ready(function() {
        $('#addFile').click(function() {
            var fileIndex = $('input[type=file]').length + 1;
            $('#imageuploadzone')
                    .append('<div class="form-group"><label for="imageFiles' + fileIndex + '" class="col-sm-2 control-label">이미지' + fileIndex + '</label><div class="col-sm-4"><input type="file" class="form-control" name="imageFiles" id="imageFiles' + fileIndex + '"  onchange="readURL(this,' + fileIndex + ')" multiple><img id="thumbnail' + fileIndex + '"  width="0" height="0"/></div></div>');

        });
    });
    function readURL(input,targetId) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#thumbnail'+targetId).attr('src', e.target.result);
                $('#thumbnail'+targetId).attr('width', 100);
                $('#thumbnail'+targetId).attr('height', 100);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    function deleteImg(imageDiv,targetUrl){
        $.ajax({
            url : targetUrl,
            method: 'get',
            success : function(data) {
                $("#"+imageDiv).hide(1000);
                alert( "삭제되었습니다. ");
            }
        });
    }
    function onSubmitcheck(){
        if(!confirm("해당 정보에 대해 " +$("#status option:selected").text()+"을 진행하시겠습니까?")){
            return false;
        }else{
            document.imgfrm.action="/imgGrant/edit2?${_csrf.parameterName}=${_csrf.token}"
            return true;
        }
        return false;
    }
</script>
<jsp:include page="/include_bottom" flush="true" />

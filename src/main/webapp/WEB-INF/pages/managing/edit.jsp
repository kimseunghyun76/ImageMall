<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <form class="form-horizontal" action="/imgmanager/edit2?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="image_seq" value="${imageInfo.image_seq}" />
            <h1 id="type" class="page-header">이미지<small>수정</small></h1>
            <div class="row" style="padding:20px">
                <div class="form-group">
                    <label for="a" class="col-sm-2 control-label">카테고리</label>
                    <div class="col-sm-4">
                        <input type="hidden" name="category_seq" value="${imageInfo.category_seq}" />
                        <input type="text" class="form-control" id="a" placeholder="카테고리" value="운동용품" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="b" class="col-sm-2 control-label">조직명</label>
                    <div class="col-sm-4">
                        <input type="hidden" name="group_seq" value="${imageInfo.group_seq}" />
                        <input type="text" class="form-control" id="b" placeholder="조직명" value="천호점" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="c" class="col-sm-2 control-label">매장명</label>
                    <div class="col-sm-4">
                        <input type="hidden" name="shop_seq" value="${imageInfo.shop_seq}" />
                        <input type="text" class="form-control" id="c" placeholder="매장명" value="나이키골프" readonly>
                    </div>
                </div>
            </div>

            <h3 class="page-header">이미지 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">
                    <div class="form-group">
                        <label for="image_type" class="col-sm-2 control-label">구분</label>
                        <div class="col-sm-4">
                            <select id="image_type" name="image_type" class="input-xlarge">
                                <option value="1" <c:if test="${imageInfo.image_type == '1'}">selected</c:if>>로고</option>
                                <option value="2" <c:if test="${imageInfo.image_type == '2'}">selected</c:if>>프로모션이미지</option>
                                <option value="3" <c:if test="${imageInfo.image_type == '3'}">selected</c:if>>마네킹 촬영사진</option>
                            </select>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="row" >
                        <label class="col-sm-2 control-label">Upload Images </label>
                    <c:forEach items="${imageFileInfo}" varStatus="status"  var="file">
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <img src="/resources/uploadimages/${file.image_name}" alt="${file.image_name}" width="200"/>
                                <div class="caption">
                                    <h3>Image ${status.count} <a href="#" class="btn btn-primary" role="button">삭제</a></h3>
                                    <p>FileName : <small>${file.image_name}</small></p>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                    <div id="imageuploadzone" class="row" >
                        <div class="form-group">
                            <label for="image01" class="col-sm-2 control-label">이미지1</label>
                            <div class="col-sm-4">
                                <input type="file" class="form-control" name="imageFiles" id="image01" onchange="readURL(this,1)" ><img id="thumbnail1"  width="0" height="0"/>
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
                    <div class="form-group">
                        <label for="connection_type" class="col-sm-2 control-label">구분</label>
                        <div class="col-sm-4">
                            <select id="connection_type" name="connection_type" class="input-xlarge">
                                <option value="1" <c:if test="${imageInfo.connection_type == '1'}">selected</c:if>>URL</option>
                                <option value="2" <c:if test="${imageInfo.connection_type == '2'}">selected</c:if>>상품</option>
                            </select>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="row" id="urlview" style="display:block;padding:10px">
                        <div class="form-group">
                            <label for="urlinfo" class="col-sm-2 control-label">URL 정보 </label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="urlinfo" id="urlinfo" placeholder="URL 정보 " value="${imageInfo.urlinfo}" >
                            </div>
                        </div>
                    </div>

                    <div class="row" id="productview" style="display:none;padding:10px">
                        <div class="form-group">
                            <label for="product_seqname" class="col-sm-2 control-label">상품 정보</label>
                            <div class="col-sm-4">
                                <input type="hidden" name="product_seq" value="${imageInfo.product_seq}" />
                                <input type="text" class="form-control" id="product_seqname" placeholder="상품 정보" readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="product_codename" class="col-sm-2 control-label">상품 코드</label>
                            <div class="col-sm-4">
                                <input type="hidden" name="product_code" value="${imageInfo.product_code}" />
                                <input type="text" class="form-control" id="product_codename" placeholder="상품 코드" readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="product_name" class="col-sm-2 control-label">상품명</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="product_name" placeholder="상품명"  value="${imageInfo.product_name}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-primary">정보 수정</button>
                    <a class="btn btn-default" href="/imgmanager/list" role="button">이미지 목록</a>
                </div>
            </div>
        </form>
    </article>
</div>

<script>
    $("#connection_type").change(function(){
        $( "#connection_type option:selected" ).each(function() {
            chooseLayer($( this ).val());
        });
    });
    function chooseLayer(ctype){
        if(ctype=='1'){
            $("#urlview" ).show( "slow" );
            $("#productview" ).hide( "slow" );
        }else{
            $("#urlview" ).hide( "slow" );
            $("#productview" ).show( "slow" );
        }
    }
    chooseLayer('${imageInfo.connection_type}');
    if("${resultMessage}" != ""){
        alert("${resultMessage}")
    }

    $(document).ready(function() {
        $('#addFile').click(function() {
            var fileIndex = $('input[type=file]').length + 1;
            $('#imageuploadzone')
                    .append('<div class="form-group"><label for="imageFiles' + fileIndex + '" class="col-sm-2 control-label">이미지' + fileIndex + '</label><div class="col-sm-4"><input type="file" class="form-control" name="imageFiles" id="imageFiles' + fileIndex + '"  onchange="readURL(this,' + fileIndex + ')" ><img id="thumbnail' + fileIndex + '"  width="0" height="0"/></div></div>');

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
</script>
<jsp:include page="/include_bottom" flush="true" />

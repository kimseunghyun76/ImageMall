<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <form class="form-horizontal" onsubmit="return onSubmitcheck();" action="/imgmanager/write2?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
            <h1 id="type" class="page-header">이미지<small>등록</small></h1>
            <div class="row" style="padding:20px">
                <div class="form-group">
                    <label for="a" class="col-sm-2 control-label">카테고리</label>
                    <div class="col-sm-4">
                        <input type="hidden" name="category_seq" value="1" />
                        <input type="text" class="form-control" id="a" placeholder="카테고리" value="운동용품" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="b" class="col-sm-2 control-label">조직명</label>
                    <div class="col-sm-4">
                        <input type="hidden" name="group_seq" value="1" />
                        <input type="text" class="form-control" id="b" placeholder="조직명" value="천호점" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="c" class="col-sm-2 control-label">매장명</label>
                    <div class="col-sm-4">
                        <input type="hidden" name="shop_seq" value="1" />
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
                                <option value="1">로고</option>
                                <option value="2">프로모션이미지</option>
                                <option value="3">마네킹 촬영사진</option>
                            </select>
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div id="imageuploadzone" class="row" >
                        <div class="form-group">
                            <label for="imageFiles01" class="col-sm-2 control-label">이미지1</label>
                            <div class="col-sm-4">
                                <input type="file" class="form-control" name="imageFiles" id="imageFiles01" onchange="readURL(this,1)" multiple/><img id="thumbnail1"  width="0" height="0"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="imageFiles02" class="col-sm-2 control-label">이미지2</label>
                            <div class="col-sm-4">
                                <input type="file" class="form-control" name="imageFiles" id="imageFiles02" onchange="readURL(this,2)" multiple><img id="thumbnail2"  width="0" height="0"/>
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
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="product_code"  id="product_code" placeholder="상품 코드" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="product_name" class="col-sm-2 control-label">상품명</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="product_name" id="product_name" placeholder="상품명" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="urlinfo" class="col-sm-2 control-label">URL 정보 </label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="urlinfo" id="urlinfo" placeholder="URL 정보">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-primary">저장 등록</button>
                    <a class="btn btn-default" href="/imgmanager/list" role="button">이미지 목록</a>
                </div>
            </div>
        </form>
    </article>
</div>

<script>

    if("${resultMessage}" != ""){
        alert("${resultMessage}");
        location.href="/imgmanager/list";
    }
    function onSubmitcheck(){
        return true;
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
</script>

<jsp:include page="/include_bottom" flush="true" />

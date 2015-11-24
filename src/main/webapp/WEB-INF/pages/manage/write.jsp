<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <form class="form-horizontal" name="imgfrm" id="imgfrm" onsubmit="return onSubmitcheck();" method="post" enctype="multipart/form-data">
            <h1 id="type" class="page-header">이미지<small>등록</small></h1>
            <h3 class="page-header">이미지 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">

                    <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">승인 여부 </label>
                        <div class="col-sm-10">
                            <select id="status" name="status" class="input-xlarge">
                                <option value="1">승인 요청</option>
                                <option value="2">승인 취소(대기)</option>
                            </select>
                            <p class="help-block">* 승인 요청 시에는 해당 정보의 수정/삭제가 불가능 합니다.</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="image_type" class="col-sm-2 control-label">구분</label>
                        <div class="col-sm-10">
                            <select id="image_type" name="image_type" class="input-xlarge">
                                <option value="1">로고</option>
                                <option value="2">프로모션 이미지</option>
                                <option value="3">마네킹 촬영 이미지</option>
                            </select>
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div id="imageuploadzone" class="row" >
                        <div class="form-group">
                            <label for="imageFiles01" class="col-sm-2 control-label">이미지1</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" name="imageFiles" id="imageFiles01" onchange="readURL(this,1)" multiple/><img id="thumbnail1"  width="0" height="0"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="imageFiles02" class="col-sm-2 control-label">이미지2</label>
                            <div class="col-sm-10">
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
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="product_code"  id="product_code" placeholder="상품 코드" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="product_name" class="col-sm-2 control-label">상품명</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="product_name" id="product_name" placeholder="상품명" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="urlinfo" class="col-sm-2 control-label">URL 정보 </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="urlinfo" id="urlinfo" placeholder="URL 정보">
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">정보 등록</button>
                    <a class="btn btn-default" href="/imgManage/list" role="button">이미지 목록</a>
                </div>
            </div>
        </form>
    </article>
</div>

<script>

    if("${resultMessage}" != ""){
        alert("${resultMessage}");
        location.href="/imgManage/list";
    }
    function onSubmitcheck(){
        if(!confirm("해당 정보 승인 요청을 진행하시겠습니까?")){
            return false;
        }else{
            document.imgfrm.action="/imgManage/write2?${_csrf.parameterName}=${_csrf.token}";
            return true;
        }
        return false;
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

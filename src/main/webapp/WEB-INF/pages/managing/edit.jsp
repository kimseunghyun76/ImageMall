<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <form class="form-horizontal" action="javascript:location.href='/imgmanager/list'">
            <h1 id="type" class="page-header">이미지<small>수정</small></h1>
            <div class="row" style="padding:20px">
                <div class="form-group">
                    <label for="a" class="col-sm-2 control-label">카테고리</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="a" placeholder="카테고리" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="b" class="col-sm-2 control-label">조직명</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="b" placeholder="조직명" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="c" class="col-sm-2 control-label">매장명</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="c" placeholder="매장명" readonly>
                    </div>
                </div>
            </div>

            <h3 class="page-header">이미지 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">
                    <div class="form-group">
                        <label for="userrole" class="col-sm-2 control-label">구분</label>
                        <div class="col-sm-4">
                            <select id="userrole" name="userrole" class="input-xlarge">
                                <option value="">선택</option>
                                <option value="logo">로고</option>
                                <option value="promotion">프로모션이미지</option>
                                <option value="picture">마네킹 촬영사진</option>
                            </select>
                            <a class="btn btn-default" href="/admin/list" role="button">미리 보기</a>
                            <p class="help-block"></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="image01" class="col-sm-2 control-label">이미지1</label>
                        <div class="col-sm-4">
                            <input type="file" class="form-control" id="image01" placeholder="카테고리" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="image02" class="col-sm-2 control-label">이미지2</label>
                        <div class="col-sm-4">
                            <input type="file" class="form-control" id="image02" placeholder="카테고리" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="image03" class="col-sm-2 control-label">이미지3</label>
                        <div class="col-sm-4">
                            <input type="file" class="form-control" id="image03" placeholder="카테고리" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="image04" class="col-sm-2 control-label">이미지4</label>
                        <div class="col-sm-4">
                            <input type="file" class="form-control" id="image04" placeholder="카테고리" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="image05" class="col-sm-2 control-label">이미지5</label>
                        <div class="col-sm-4">
                            <input type="file" class="form-control" id="image05" placeholder="카테고리" >
                        </div>
                    </div>
                </div>
            </div>


            <h3 class="page-header">연결 정보</h3>
            <div class="row" style="padding:20px">
                <div class="row" style="padding:10px">
                    <div class="form-group">
                        <label for="viewtype" class="col-sm-2 control-label">구분</label>
                        <div class="col-sm-4">
                            <select id="viewtype" name="viewtype" class="input-xlarge">
                                <option value="urlview">URL</option>
                                <option value="productview">상품</option>
                            </select>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="row" id="urlview" style="display:block;padding:10px">
                        <div class="form-group">
                            <label for="urlinfo" class="col-sm-2 control-label">URL 정보 </label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="urlinfo" placeholder="URL 정보 " >
                            </div>
                        </div>
                    </div>

                    <div class="row" id="productview" style="display:none;padding:10px">
                        <div class="form-group">
                            <label for="productinfo" class="col-sm-2 control-label">상품 정보</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="productinfo" placeholder="상품 정보" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="productcode" class="col-sm-2 control-label">상품 코드</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="productcode" placeholder="상품 코드" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="productname" class="col-sm-2 control-label">상품명</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="productname" placeholder="상품명" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $("#viewtype").change(function(){
                    $( "#viewtype option:selected" ).each(function() {
                        if($( this ).val()=="urlview"){
                            $("#urlview" ).show( "slow" );
                            $("#productview" ).hide( "slow" );
                        }else{
                            $("#urlview" ).hide( "slow" );
                            $("#productview" ).show( "slow" );
                        }
                    });
                })
            </script>
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
<jsp:include page="/include_bottom" flush="true" />
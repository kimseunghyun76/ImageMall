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
                            <option value="3" <c:if test="${imageInfo.status == '3'}">selected</c:if>>반려</option>
                            <option value="4" <c:if test="${imageInfo.status == '4'}">selected</c:if>>승인</option>
                        </select>
                        <p class="help-block">* 승인 요청 시에는 해당 정보의 수정/삭제가 불가능 합니다.</p>
                    </div>
                </div>


                <div class="form-group">
                    <label for="category_now_name" class="col-sm-2 control-label">카테고리</label>
                    <div class="col-sm-10">
                        <c:if test="${my_user_role == '1'}">
                            <input type="text" class="form-control" id="category_now_name" name="category_now_name"  value="${imageInfo.category_now_name}" maxlength="40" readonly>
                        </c:if>
                        <c:if test="${my_user_role != '1'}">
                            <select id="category_now_name" name="category_now_name" class="input-xlarge" >
                                <option <c:if test="${imageInfo.category_now_name == '화장품'}">selected</c:if>>화장품</option>
                                <option <c:if test="${imageInfo.category_now_name == '명품/잡화'}">selected</c:if>>명품/잡화</option>
                                <option <c:if test="${imageInfo.category_now_name == '여성패션'}">selected</c:if>>여성패션</option>
                                <option <c:if test="${imageInfo.category_now_name == '영캐쥬얼'}">selected</c:if>>영캐쥬얼</option>
                                <option <c:if test="${imageInfo.category_now_name == '진,이지'}">selected</c:if>>진,이지</option>
                                <option <c:if test="${imageInfo.category_now_name == '남성패션'}">selected</c:if>>남성패션</option>
                                <option <c:if test="${imageInfo.category_now_name == '유아동/문화'}">selected</c:if>>유아동/문화</option>
                                <option <c:if test="${imageInfo.category_now_name == '스포츠/레져'}">selected</c:if>>스포츠/레져</option>
                                <option <c:if test="${imageInfo.category_now_name == '리빙/가전'}">selected</c:if>>리빙/가전</option>
                                <option <c:if test="${imageInfo.category_now_name == '리빙/가전'}">selected</c:if>>리빙/가전</option>
                                <option <c:if test="${imageInfo.category_now_name == '식품'}">selected</c:if>>식품</option>
                                <option <c:if test="${imageInfo.category_now_name == '기타'}">selected</c:if>>기타</option>
                            </select>
                        </c:if>
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="group_now_name" class="col-sm-2 control-label">조직명</label>
                    <div class="col-sm-10">
                        <c:if test="${my_user_role != '3'}">
                            <input type="text" class="form-control" id="group_now_name" name="group_now_name"  value="${imageInfo.group_now_name}" maxlength="40" readonly>
                        </c:if>
                        <c:if test="${my_user_role == '3'}">
                            <select id="group_now_name" name="group_now_name" class="input-xlarge" >
                                <option <c:if test="${imageInfo.group_now_name == '본사'}">selected</c:if>>본사</option>
                                <option <c:if test="${imageInfo.group_now_name == '압구정본점'}">selected</c:if>>압구정본점</option>
                                <option <c:if test="${imageInfo.group_now_name == '천호점'}">selected</c:if>>천호점</option>
                                <option <c:if test="${imageInfo.group_now_name == '신촌점'}">selected</c:if>>신촌점</option>
                                <option <c:if test="${imageInfo.group_now_name == '미아점'}">selected</c:if>>미아점</option>
                                <option <c:if test="${imageInfo.group_now_name == '중동점'}">selected</c:if>>중동점</option>
                                <option <c:if test="${imageInfo.group_now_name == '판교점'}">selected</c:if>>판교점</option>
                                <option <c:if test="${imageInfo.group_now_name == '부산점'}">selected</c:if>>부산점</option>
                                <option <c:if test="${imageInfo.group_now_name == '대구점'}">selected</c:if>>대구점</option>
                                <option <c:if test="${imageInfo.group_now_name == '울산점'}">selected</c:if>>울산점</option>
                                <option <c:if test="${imageInfo.group_now_name == '울산동구점'}">selected</c:if>>울산동구점</option>
                                <option <c:if test="${imageInfo.group_now_name == '기타'}">selected</c:if>>기타</option>
                            </select>
                        </c:if>
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="shop_now_name" class="col-sm-2 control-label">매장명</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="shop_now_name" name="shop_now_name" placeholder="매장명"  value="${imageInfo.shop_now_name}" maxlength="40"  <c:if test="${my_user_role == '1'}">readonly</c:if>>
                        <p class="help-block"></p>
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
                <div class="form-group">
                    <label for="product_search" class="col-sm-2 control-label"></label>
                    <div class="col-sm-5">
                        <select id="product_type" name="product_type" class="input-xlarge">
                            <option value="1" selected>상품</option>
                            <option value="2">기타</option>
                        </select>
                    </div>
                    <div class="col-sm-5">
                        <select id="product_gubun" name="product_gubun" class="input-xlarge">
                            <option value="1" selected>상품검색</option>
                            <option value="2">직접입력</option>
                        </select>
                        <p class="help-block"></p>
                    </div>
                </div>
                <!--상품 검색 -->
                <div class="row" style="padding:10px" id="product_div" style="display:none;padding:10px">
                    <div class="row" style="padding:10px">

                        <div class="form-group">
                            <label for="product_search" class="col-sm-2 control-label">상품명 검색</label>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <input type="text" name="product_search" id="product_search" class="form-control" placeholder="상품명 Search for..." onkeypress="return enterKey(event);" />
                                      <span class="input-group-btn">
                                        <button class="btn btn-default" type="button" id="searchProduct">상품검색</button>
                                      </span>
                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->
                        </div>

                        <div class="form-group">
                            <label for="product_search" class="col-sm-2 control-label"></label>
                            <div class="col-lg-8">
                                <div class="productSearchBox" id="productSearchBox" style="display:none">
                                    <div class="modal-header">
                                        <button type="button" class="close" id="searchProductboxClose"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="productViewTitle">검색중....</h4>
                                    </div>
                                    <div class="modal-body" id="productView">
                                        잠시만 기다려 주세요...
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="product_name" class="col-sm-2 control-label">상품명</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="product_name" id="product_name" placeholder="상품명"  value="${imageInfo.product_name}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="product_code" class="col-sm-2 control-label">상품 코드</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="product_code" id="product_code" placeholder="상품 코드" value="${imageInfo.product_code}">
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


                <!--상품 직접 입력-->
                <div class="row" style="padding:10px" id="direct_div" style="display:none;padding:10px">
                    <div class="row" style="padding:10px">
                        <div class="form-group">
                            <label for="direct_url" class="col-sm-2 control-label">URL 정보</label>
                            <div class="col-sm-10">

                                <!-- HTML to write -->
                                <a id="popover1" data-placement='top' data-content="" href='#' data-trigger="hover">예시</a>
                                http://www.thehyundai.com
                                <input type="text" class="form-control" name="direct_url"  id="direct_url"  value="${imageInfo.direct_url}">
                            </div>
                        </div>
                    </div>
                </div>
                <!--기타  입력-->
                <div class="row" style="padding:10px" id="etc_div" style="display:none;padding:10px">
                    <div class="row" style="padding:10px">
                        <div class="form-group">
                            <label for="direct_url" class="col-sm-2 control-label">URL 정보</label>
                            <div class="col-sm-10">

                                <!-- HTML to write -->
                                <a id="popover2" data-placement='top' data-content="" href='#' data-trigger="hover">예시</a>
                                http://www.thehyundai.com
                                <input type="text" class="form-control" name="direct_url2"  id="direct_url2"  value="${imageInfo.direct_url2}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">수정</button>
                    <a class="btn btn-warning" href="/imgGrant/delete?image_seq=${imageInfo.image_seq}" role="button">삭제</a>
                    <a class="btn btn-default" href="/imgGrant/list" role="button">목록</a>

                </div>
            </div>
        </form>
    </article>
</div>

<div id="popover_content_wrapper2" style="display: none">
    <div>
        /front/pda/itemPtc.thd?slitmCd=[상품코드]<br/>
        /front/pda/itemPtc.thd?sectId=[매장코드]&slitmCd=[상품코드]
    </div>
</div>
<div id="popover_content_wrapper1" style="display: none">
    <div>
        <b>기획전</b><br/>
        /front/dps/exhibition.thd (기획전 메인)<br/>
        /front/dpa/searchSpexSectItem.thd?sectId=[매장코드]<br/><br/>
        <b>이벤트</b><br/>
        /front/eva/evntMainPage.thd (이벤트 메인)<br/>
        /front/eva/evntHPointDtl.thd?prmoNo=[프로모션코드] (더머니리워드)<br/>
        /front/eva/evntHPointDtl.thd?prmoNo=[프로모션코드] (더머니리워드)<br/>
        /front/eva/evntPatternedDetail.thd?prmoNo=[프로모션코드] (정형)<br/>
        /front/eva/evntNonPatterned.thd?prmoNo=[프로모션코드] (비정형)<br/><br/>
        <b>대카테고리, 중카테고리, 소카테고리</b><br/>
        /front/dpa/searchSectItem.thd?sectId=[매장코드]<br/><br/>
        <b>브랜드매장</b><br/>
        /front/dpa/searchSectItem.thd?brndCd=[브랜드코드]<br/><br/>
        <b>스토어픽매장</b><br/>
        /front/dpa/storPiupSearchSect.thd<br/><br/>
        <b>마이샵</b><br/>
        /front/dpm/myShopHome.thd (마이샵 메인)<br/>
        /front/dpm/othersMyShop.thd?myshNo=[마이샵코드]<br/><br/>
        <b>점별매장</b><br/>
        /front/dpa/searchSectItem.thd?venCd=[점코드]<br/><br/>
        <b>매거진</b><br/>
        /front/dpm/myShopHome.thd (마이샵 메인)<br/>
        /front/dpn/MgzDetail.thd?mgzNo=[매거진코드]<br/><br/>
        <b>키워드 베스트</b><br/>
        /front/dpd/wkBestScwd.thd<br/><br/>
        <b>연령대별 베스트</b><br/>
        /front/dpd/wkBestCust.thd<br/><br/>
        <b>더드림딜 매장</b><br/>
        /front/dpa/searchSpexSectItem.thd?sectId=[매장코드]<br/><br/></div>
</div>


<script>
    $(document).ready(function(){
        $('#popover1').popover({
            html : true,
            content: function() {
                return $('#popover_content_wrapper1').html();
            }
        });

        $('#popover2').popover({
            html : true,
            content: function() {
                return $('#popover_content_wrapper2').html();
            }
        });
    });

    $("#product_type").change(function(){
        $( "#product_type option:selected" ).each(function() {
            if($( this ).val()=="1"){
                $("#product_div" ).show( "fast" );
                $("#direct_div" ).hide( "fast" );
                $("#etc_div" ).hide( "fast" );

                $("#product_gubun").attr('disabled', false);
                $('#product_gubun').val('1');
            }else{
                $("#product_div" ).hide( "fast" );
                $("#direct_div" ).show( "fast" );
                $("#etc_div" ).hide( "fast" );

                $("#product_gubun").attr('disabled', true);
                $('#product_gubun').val('2');
            }
        });
    })

    $("#product_gubun").change(function(){
        $( "#product_gubun option:selected" ).each(function() {
            if($( this ).val()=="1"){
                $("#product_div" ).show( "fast" );
                $("#direct_div" ).hide( "fast" );
                $("#etc_div" ).hide( "fast" );
            }else{
                $("#product_div" ).hide( "fast" );
                $("#direct_div" ).hide( "fast" );
                $("#etc_div" ).show( "fast" );
            }
        });
    })

    <c:if test="${imageInfo.product_type == '1' && imageInfo.product_gubun == '1'}">
    $("#product_div" ).show();
    $("#direct_div" ).hide();
    $("#etc_div" ).hide();
    </c:if>

    <c:if test="${imageInfo.product_type == '1'  && imageInfo.product_gubun == '2'}">
    $("#product_div" ).hide();
    $("#direct_div" ).hide();
    $("#etc_div" ).show();
    </c:if>
    <c:if test="${imageInfo.product_type == '2' && imageInfo.product_gubun == '2'}">
    $("#product_div" ).hide();
    $("#direct_div" ).show();
    $("#etc_div" ).hide();
    </c:if>

</script>
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

<script>
    // 상품 정보 수정 Start
    function enterKey(e) {
        if (e.keyCode == 13) {
            searchProcess();
            return false;
        }
        return true;
    }

    $('#searchProductboxClose').on('click', function (e) {
        $("#productSearchBox").hide();
    });

    $('#searchProduct').on('click', function (e) {
        searchProcess();
    });
    function searchProcess(){
        $("#productSearchBox").show();

        if($("#product_search").val() =="" || $("#product_search").val().length <= 1) {
            $("#productViewTitle").text("상품명을 2자이상 입력해 주세요.");
            $("#productView").text("다른 검색어로 검색 해주세요.");
            return false;
        }else{
            $.ajax({
                type: 'post',
                url: '/imgManage/productList.json?${_csrf.parameterName}=${_csrf.token}',
                dataType: 'json',
                data: {
                    product_name : $("#product_search").val()
                },
                success: function(data) {

                    if(data.totalCount == '0'){
                        $("#productViewTitle").html("<strong>"+$("#product_search").val() + "</strong>으로 일치하는 정보가 없습니다.");
                        $("#productView").text("다른 검색어로 검색 해주세요.");
                    }else{
                        $("#productViewTitle").html("<strong>"+$("#product_search").val() + "</strong>으로 검색 결과");
                        var list = data.resultList;
                        var content = "<table cellpadding='2' cellspacing='2' border='0'>";
                        content = "<tr><th>#</th><th>상품명</th><th>상품코드</th><th>상품URL</th><th></th></tr>";
                        for(i = 0 ; i < list.length ; i++){
                            content += "<tr>";
                            content += "<td style='padding:5px'>" + (i+1) +"</td>";
                            content += "<td style='padding:5px'>" + list[i].product_name +"</td>";
                            content += "<td style='padding:5px'>" + list[i].product_code +"</td>";
                            content += "<td style='padding:5px'>" + list[i].urlinfo +"</td>";
                            content += '<td style="padding:5px"> <button type="button" class="btn btn-primary" onclick="selectProduct(\''+list[i].product_name+'\',\''+list[i].product_code+'\',\''+list[i].urlinfo+'\');">선택</button></td>';
                            //선택하면 창이 닫히고, 값이 메인 창에 값을 넣어주는 액션을 진행한다.
                            content += "</tr>"
                        }
                        content += "</table>";
                        //2.가져온 값을 아래 modal-body에 넣어 준다.
                        $("#productView").html(content);
                    }
                },
                error: function(request, status, error) {
                    //2.가져온 값을 아래 modal-body에 넣어 준다.
                    $("#productViewTitle").text("상품정보 서버에 일시적인 장애가 있습니다. 잠시 후에 이용해 주세요");
                    $("#productView").text("");
                }
            });
        }
    }
    function selectProduct(productName,productCode,productUrl){
        $("#product_name").val(productName);
        $("#product_code").val(productCode);
        $("#urlinfo").val(productUrl);
        $("#productSearchBox").hide();
    }

    // 상품 정보 수정 End
</script>
<jsp:include page="/include_bottom" flush="true" />

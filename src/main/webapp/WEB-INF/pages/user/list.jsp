<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>회원 정보 <small>관리</small></h1>
        </div>

        <div class="row">
            <div class="col-md-8"></div>
            <div class="col-md-4">
                <div class="row text-right">
                    <a class="btn btn-default" href="javascript:alert('준비중입니다.');" role="button">대량회원등록</a>
                    <a class="btn btn-default" href="/admin/write" role="button">회원등록</a>
                    <a class="btn btn-default" href="#" role="button">조회</a>
                </div>
            </div>
        </div>

        <div class="row" style="padding:20px;">
            <div class="row" style="border:2px solid #e5e5e5;">
                <div class="row" style="padding:5px">
                    <div class="col-md-6">
                        <label for="inputNumber">카테고리</label>
                        <input type="text" class="form-control" id="inputNumber" placeholder="카테고리">
                    </div>

                    <div class="col-md-6">
                        <label for="inputNumber">조직명</label>
                        <input type="text" class="form-control" id="inputNumber" placeholder="조직명">
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-6">
                        <label for="inputNumber">매장명</label>
                        <input type="text" class="form-control" id="inputNumber" placeholder="매장명">
                    </div>

                    <div class="col-md-6">
                        <label for="inputId">아이디</label>
                        <input type="text" class="form-control" id="inputId" placeholder="아이디">
                    </div>
                </div>
                <div class="row" style="padding:10px">
                    <div class="col-md-12">
                        <label for="userrole" style="padding-right:40px">권한  </label>
                        <select id="userrole" name="userrole" class="input-xlarge">
                            <option value="superadmin">최고관리자</option>
                            <option value="admin">관리자</option>
                            <option value="user">사용자</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="padding:8px;">
            <div class="table-responsive">
                <table class="table table-condensed">
                    <tr class="active">
                        <td class="active">No</td>
                        <td class="active">ID</td>
                        <td class="active">Name</td>
                        <td class="active">Info</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>admin</td>
                        <td>관리자</td>
                        <td>
                            <a class="btn btn-success" href="/admin/edit" role="button">정보 수정</a>
                            <a class="btn btn-warning" href="/admin/edit" role="button">정보 삭제</a>
                        </td>

                    </tr>
                    <tr>
                        <td>2</td>
                        <td>tester</td>
                        <td>김수로</td>
                        <td>
                            <a class="btn btn-success" href="/admin/edit" role="button">정보 수정</a>
                            <a class="btn btn-warning" href="/admin/edit" role="button">정보 삭제</a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>hyundai00</td>
                        <td>홍길동</td>
                        <td>
                            <a class="btn btn-success" href="/admin/edit" role="button">정보 수정</a>
                            <a class="btn btn-warning" href="/admin/edit" role="button">정보 삭제</a>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>hyundai01</td>
                        <td>박남정</td>
                        <td>
                            <a class="btn btn-success" href="/admin/edit" role="button">정보 수정</a>
                            <a class="btn btn-warning" href="/admin/edit" role="button">정보 삭제</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </article>
</div>
<jsp:include page="/include_bottom" flush="true" />
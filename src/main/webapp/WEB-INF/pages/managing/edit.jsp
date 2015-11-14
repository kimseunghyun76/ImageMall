<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />

<div class="container">
    <div class="row">
        <div class="col-lg-12 ">
            <form class="form-horizontal" action='' method="POST">
                <fieldset>
                    <div id="legend">
                        <legend class="">회원 정보 수정</legend>
                    </div>
                    <div class="control-group">
                        <!-- Username -->
                        <label class="control-label"  for="username">이름</label>
                        <div class="controls">
                            <input type="text" id="username" name="username" placeholder="" class="input-xlarge">
                            <p class="help-block">Username can contain any letters or numbers, without spaces</p>
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- E-mail -->
                        <label class="control-label" for="email">조직명</label>
                        <div class="controls">
                            <input type="text" id="email" name="email" placeholder="" class="input-xlarge">
                            <p class="help-block">Please provide your E-mail</p>
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- Password-->
                        <label class="control-label" for="password">매장명</label>
                        <div class="controls">
                            <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
                            <p class="help-block">Password should be at least 4 characters</p>
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- Password-->
                        <label class="control-label" for="password">카테고리</label>
                        <div class="controls">
                            <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
                            <p class="help-block">Password should be at least 4 characters</p>
                        </div>
                    </div>


                    <div class="control-group">
                        <!-- Password-->
                        <label class="control-label" for="password">권한</label>
                        <div class="controls">
                            <select name=role class="input-xlarge">
                                <option value="chief">최고관리자</option>
                                <option value="admin">관리자</option>
                                <option value="user">사용자</option>
                            </select>

                            <p class="help-block">Password should be at least 4 characters</p>
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- Button -->
                        <div class="controls">
                            <button class="btn btn-info" onclick="location.href='/admint'">수정</button>
                            <button class="btn btn-info" onclick="location.href='/admin'">닫기</button>
                        </div>
                    </div>
                </fieldset>
            </form>

        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->

<jsp:include page="/include_bottom" flush="true" />
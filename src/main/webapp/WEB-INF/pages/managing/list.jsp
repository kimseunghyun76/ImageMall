<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />

<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>회원 정보 <small>관리</small></h1>
        </div>

        <div class="control-group">
            <!-- Button -->
            <div class="controls ">
                <a class="btn btn-default" href="javascript:alert('준비중입니다.');" role="button">대량회원등록</a>
                <a class="btn btn-default" href="/admin/write" role="button">회원등록</a>
                <a class="btn btn-default" href="#" role="button">조회</a>
            </div>
        </div>

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
                    <td>정보수정</td>
                </tr>
            </table>
        </div>
    </article>
</div>
<jsp:include page="/include_bottom" flush="true" />
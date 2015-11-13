<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include_top" flush="true" />


<div class="container">
    <div class="row">
        <div class="dropdown">
            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                구분
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="#">로고</a></li>
                <li><a href="#">프로모션이미지</a></li>
                <li><a href="#">마네킹 촬영사진</a></li>
            </ul>
        </div>


        <form method="POST" action="uploadMultipleFile" enctype="multipart/form-data">
            File1 to upload: <input type="file" name="file"><br />
            Name1: <input type="text" name="name"><br /> <br />
            File2 to upload: <input type="file" name="file"><br />
            Name2: <input type="text" name="name"><br /> <br />
            <input type="submit" value="Upload"> Press here to upload the file!
        </form>
    </div>
</div>





<jsp:include page="/include_bottom" flush="true" />

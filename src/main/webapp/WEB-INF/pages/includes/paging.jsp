<%@ page language="java" contentType="text/html; charSet=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row text-center">
    <nav>
        <ul class="pagination pagination-lg">
            <li>
                <a href="javascript:goPage(${param.firstPageNo})" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
                <c:choose>
                    <c:when test="${i eq param.pageNo}">
                        <li class="active"><a href="javascript:goPage(${i})">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="javascript:goPage(${i})">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <li>
                <a href="javascript:goPage(${param.finalPageNo})" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
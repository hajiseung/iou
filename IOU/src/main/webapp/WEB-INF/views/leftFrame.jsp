<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul id="titleList">
			<c:forEach var="list" items="${list }">
				<li>
					<a href="#" id="listUrl" class="${list.url }" onclick="resetPage(this)">&nbsp; &nbsp; ${list.title }</a>
					<a href="#" id="deletebtn" class="${list.url }" onclick="deleteUrl(this)">x</a>
				</li>
			</c:forEach>
		</ul>
	<br />
	<button onclick="main()">추가</button>
</body>
</html>
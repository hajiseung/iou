<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>즐겨찾기 등록</title>
<style>
*{
	margin: 0px;
	padding: 0px;
}
a{
	text-decoration: none;
	color: black;
}
div{
	padding: 30px;
}
th{
	font-size: 30px;
	float: left;
}
input{
	background-color: #00bfff;
}
button{
	margin-top:20px;
	background-color: #00bfff;
	width: 300px;
	color: white;
	font-size: 15px;
	font-weight:bold;
	border-radius: 5px;
}
#insertUrl{
 width: 50px;
}

#title, #url{
	width: 500px;	
	font-size: 30px;
	margin-left: 50px;
}
#submit{
	width: 80px;
	color: white;
	font-size: 20px;
	font-weight:bold;
	border-radius: 5px;
}

#leftBar{
	float: left;
	border-right: 3px solid #00bfff;
}
#rightBar{
	width: 800px;
	margin: auto;
}
#deletebtn{
	color: #00bfff;
	float: right;
}
#deletebtn:hover {
	color: red;
}
#titlelist{
	margin: 10px;
	font-size: 25px;
}
#titlelist li{
	margin: 10px;
}
</style>
</head>
<body>
 <frameset cols="20%">
 	<frame src = "leftFrame" name="left">
 </frameset>
	<%-- <div id="leftBar">
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
	</div> --%>
	<div id="rightBar">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" id="title"/></td>
			</tr>	
			<tr>
				<th>URL</th>
				<td><input type="text" id="url"/></td>
			</tr>	
			<tr>
				<td></td>
				<td style="float: right;"><button id="insertUrl" onclick="insertUrl()">저장</button></td>
			</tr>
		</table>
	</div>

</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

function main(){
	var check = confirm('새로운 URL을 추가하시겠습니까?');
	if(check == true){
		location.href="${pageContext.request.contextPath}/";
	}
};
function insertUrl(){
var url = '${pageContext.request.contextPath}/insertUrl';
var title = $('#title').val();
var urlData = $('#url').val();
	$.ajax({
		url:url,
		data:{
			"title":title,
			"url":urlData
		},
		type:'POST',
		dataType:'JSON',
		success:function(response){
				$('#titleList').append('<li><a href="'+response.url+'">'+response.title+'<a href="#" id="deletebtn" class="'+response.url+'" onclick="deleteUrl(this)">x</a></li>');
				$('#title').val('');
				$('#url').val('');
		}
	});
};
function deleteUrl(data){
	var check = confirm('삭제하시겠습니까?');
	var deleteurl = $(data).attr('class');

	if(check == true){
		location.href = "${pageContext.request.contextPath}/deleteUrl?url="+deleteurl;
	}
};

function resetPage(data){
	$('#rightBar').load($(data).attr('class'));
	/* $('#rightBar').html($(data).attr('class')); */
};

</script>
</html>

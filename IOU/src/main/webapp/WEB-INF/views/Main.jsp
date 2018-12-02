<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>즐겨찾기 등록</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/theme.css">
</head>
<body>
	<div class="sidenav" id="h_leftBar">
		<table>
			<ul id="h_titleList">
				<c:forEach var="list" items="${list }">
				<tr>
					<td><li><a href="#" id="h_listUrl" class="${list.url }" onclick="resetPage(this)" >${list.title }</a></li></td><td><a href="#" id="h_deletebtn" class="${list.url }" onclick="deleteUrl(this)">x</a></td></tr>
				</c:forEach>
			</ul>
		</table>
		<br />
		<button id="h_button" onclick="main()">추가</button>
	</div>
	
	<div id="h_rightBar">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" id="h_title"/></td>
			</tr>	
			<tr>
				<th>URL</th>
				<td><input type="text" id="h_url"/></td>
			</tr>	
			<tr>
				<td></td>
				<td style="float: right;"><button id="h_insertUrl" onclick="insertUrl()">저장</button></td>
			</tr>
		</table>
	</div>
	<div id="h_content"></div>
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
var title = $('#h_title').val();
var urlData = $('#h_url').val();
	$.ajax({
		url:url,
		data:{
			"title":title,
			"url":urlData
		},
		type:'POST',
		dataType:'JSON',
		success:function(response){
				$('#h_titleList').append('<tr><td><li><a href="'+response.url+'">'+response.title+'</li></td><td><a href="#" id="h_deletebtn" class="'+response.url+'" onclick="deleteUrl(this)">x</a></td></tr>');
				$('#h_title').val('');
				$('#h_url').val('');
				location.reload();
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
	/* $('#rightBar').load($(data).attr('class')); */
	/* $('#rightBar').html($(data).attr('class')); */
	$('#h_rightBar').empty();
	/* $('#h_rightBar').load($(data).attr('class')); */
	$('#h_content').load($(data).attr('class'));
};

//crossDomain 해결코드
$(function() {
 $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
    if (options.crossDomain && jQuery.support.cors) {
       options.url = "https://cors-anywhere.herokuapp.com/" + options.url;
    }
 });
});
</script>
</html>

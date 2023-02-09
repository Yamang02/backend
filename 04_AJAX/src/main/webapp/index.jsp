<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>AJAX(Asynchronous Javascript And XML)</title>
</head>
<body>
	<h1>AJAX(Asynchronous Javascript And XML)</h1>

	<h2>1. Javascript를 이용한 AJAX 테스트</h2>
	<h3>1) GET 방식으로 서버에 데이터 전송 및 응답</h3>

	<button onclick="jsAjaxTest1();">Get 방식 전송</button>

	<p id="p1"></p>

	<h3>2) POST 방식으로 서버에 데이터 전송 및 응답</h3>

	<button onclick="jsAjaxTest2();">POST 방식 전송</button>

	<p id="p2"></p>





	<script>
		function jsAjaxTest1() {
			//1. XMLHttpRequest 객체 생성
			let xhr = new XMLHttpRequest();

			/* 
			 // 구버전을 위한 호환성 코드입니다. 더 이상 이렇게 작성하지 않아도 됩니다.
			 var httpRequest;
			 if (window.XMLHttpRequest) { // 모질라, 사파리, IE7+ ...
			 httpRequest = new XMLHttpRequest();
			 } else if (window.ActiveXObject) { // IE 6 이하
			 httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			 }
			 */

			// 2. onreadystatechange 속성에 콜백 함수 지정
			xhr.onreadystatechange = function() {
				// 1) 서버 응답 상태 확인
				// 0 : 요청이 초기화되지 않은 상태
				// 1: 서버와 연결이 설정된 생태
				// 2: 서버가 요청을 받은 상태
				// 3: 서버가 요청을 처리하는 상태
				// 4: 서버가 요청에 대한 처리를 끝내고 응답을 준비하는 상태

				console.log('readyState : ' + xhr.readyState);

				if (xhr.readyState == 4) {
					// 2) HTTP 응답 상태 코드 확인
					// 200 : OK
					// 404 : NOT Found
					// 500 : Internal Server Error
					// ...

					console.log("status : " + xhr.status)

					if (xhr.status === 200) {
						// 서버에서 응답한 데이터를 담고있는 속성
						console.log(xhr.responseText);
						document.getElementById("p1").innerHTML = xhr.responseText;


					} else {
						console.log("통신 실패 : " + xhr.status);
					}

				}

			};

			// 3. open() 호출
			xhr.open('GET', '${pageContext.request.contextPath}/jsAjax.do?name=문인수&age=19',
							true);

			// 4. send() 호출
			xhr.send();

		}
	</script>




	<script>
		function jsAjaxTest2() {
			//1. XMLHttpRequest 객체 생성
			let xhr = new XMLHttpRequest();
			
			//2. onreadystatechange 속성에 콜백 함수 지정
			xhr.onreadystatechange = () => {
				if(xhr.readyState === XMLHttpRequest.DONE) {
					if(xhr.status === 200) {
						console.log('통신 성공 : ' + xhr.status)
						document.getElementById("p2").innerHTML = xhr.responseText;
					} else {
						console.log('통신 실패 : ' + xhr.status)
					}
				}
				console.log(xhr.readyState);
			};
			
			//3 open() 호출
			xhr.open('Post','${pageContext.request.contextPath}/jsAjax.do', true);
			
			// * POST 요청의 경우 send() 호출 전에 아래와 같이 요청 헤더러를 추가해야 한다.
			xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
// 			xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded; charset=UTF-8');
			// charset을 미리 헤드에 설정해서 보내면 dopost에서 따로 설정을 할 필요가 없다.
			
			//4 send() 호출
			xhr.send('name=홍길동&age=24');
		}
	</script>
	<hr>

	<h2>2. jQuery를 이용한 AJAX 테스트</h2>
	<h3>1) GET 방식으로 서버에 데이터 전송 및 응답</h3>

	<label for="input">입력 :</label>
	<input type="text" id="input" size="30">

	<br>

	<label for="output">출력 :</label>
	<input type="text" id="output" size="30" readonly>

	<br>
	<br>

	<button id="btn1">GET 방식 전송</button>

	<h3>2) POST 방식으로 서버에 데이터 전송 및 응답</h3>

	<label for="name">이름 :</label>
	<input type="text" id="name">

	<br>

	<label for="age">나이 :</label>
	<input type="text" id="age">

	<br>

	<label for="output2">출력 :</label>
	<input type="text" id="output2" size="30" readonly>

	<br>
	<br>

	<button id="btn2">POST 방식 전송</button>

	<hr>

	<h3>3) 서버에 데이터 전송 후 응답을 객체(Object)로 받기</h3>
	<label for="userNo">회원 번호 : </label>
	<input type="text" id="userNo">
	<button id="btn3">조회</button>

	<p id="p3"></p>

	<h3>4) 서버에 데이터를 전송 후, 응답을 리스트(List)로 받기</h3>
	<label><input type="radio" name="gender" value="남자" checked>남자 </label>
	<label><input type="radio" name="gender" value="여자">여자 </label>

	<button id="btn4">조회</button>

	<p id="p4"></p>

	<script>
		$(document).ready(function() {
			$('#btn1').on('click', function() {
			let input = $('#input').val();
			
			$.ajax({
				// 전송 방식
				type: 'GET',
				
				// 요청 URL
				url: '${ pageContext.request.contextPath}/jqAjax1.do',
				
				// 요청시 전달할 파라미터 설정
				data: {
					input // 'input' : input
					},
					// AJAX 통신 성공 시 실행될 콜백 함수
					 success : function(data) {
						console.log(data);
						$('#output').val(data);
					},
					
					/*
					// AJAX 통신 실패 시 실행될 콜백 함수
					 error : function(error) {
						console.log(error);
					},
					
					// AJAX 성공 실패와 상관없이 실행될 콜백 함수
					complete: function() {
						console.log("complete 콜백 함수 실행");
					} 
					success : data => console.log(data), */
					error : error => console.log(error),
					complete : () => console.log("complete 콜백 함수 실행") 
			});
			});
			
			$('#btn2').on('click', function() {
				let name = $('#name').val();
				let age = $('#age').val();
			
				$.ajax({
					type: 'POST',
					url: '${ pageContext.request.contextPath}/jqAjax1.do',
					data : {
						name,
						age,
					},
					success : (data) => {
						console.log(data);
						$('#output2').val(data);
					},
					error : (error) => {
						console.log(error);
					}
				});
			});
			
			
			$('#btn3').on('click', function() {
				let userNo = $('#userNo').val();
				
				$.ajax({
					type : 'GET',
					url : '${ pageContext.request.contextPath}/jsonAjax.do',
					data : {
						userNo
					},
					success : (obj) => {
						let result ='';
						
						console.log(obj);
						
						if(obj !== null) {
							result = '회원 번호 : ' + obj.no + '<br>이름 : ' + obj.name + '<br>성별 : ' + obj.gender;
						} else {
							result = '사용자 정보가 없습니다.';
						}

						$('#p3').html(result);	
						
					},
					error: (error) => {
						console.log(error);
					}
					
				})
				
			}) 
			
			$('#btn4').on('click', function() {
				let gender  = $('input[name=gender]:checked').val();
				
				$.ajax({
					type : 'POST',
					url : '${ pageContext.request.contextPath}/jsonAjax.do' ,
					dataType: 'json',
					data : {
						gender
					},
					success : (list) => {
						let result = "";
						$.each(list, (i) => {
							result += result = '회원 번호 : ' + list[i].no 
												+ '<br>이름 : ' + list[i].name 
												+ '<br>성별 : ' + list[i].gender 
												+ '<br><br>';
						});
						
						$('#p4').html(result);
						
					},
					error : (error) => {
						console.log(error);
					}
				})
				
			}) 
			
		});	
	</script>




</body>
</html>
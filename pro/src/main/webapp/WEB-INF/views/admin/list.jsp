<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>환영합니다</title>

<!-- Bootstrap Core CSS -->
<link href="/pro/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="/pro/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="/pro/resources/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="/pro/resources/css/creative.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<style type="text/css">
body{
		margin-left: 5px;
	}
.text-faded {
	color: black;
}

.cook {
	background-color: #FFFFCC;
}
.mat {
	background-color: #FFFFFF;
}

#top {
	text-align: right;
}

.cookhr {
	width: 100px;
}
.fcolor{
		color: #999999;
	}
	.img-responsive{
		height: 250px;
		width: 500px;
	}
</style>

</head>

<body id="page-top">

	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="/pro"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<%
							if (session.getAttribute("id") != null) {
						%> <a class="page-scroll" href="#about">로그아웃</a> <%
 	} else if (session.getAttribute("str") != null) {
 %> <a class="page-scroll" href="#about">회원가입</a>
						<%
							} else {
						%> <a class="page-scroll" href="#about">로그인</a>
						<%
							}
						%>

					</li>
					<li><a class="page-scroll" href="#services">푸드 레시피</a></li>
					<li><a class="page-scroll" href="#portfolio">푸드 사진</a></li>
					<li><a class="page-scroll" href="#contact">문의</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<header>
		<div class="header-content">
			<div class="header-content-inner">
				<h1 id="homeHeading">요리사이트</h1>
				<hr>
				<p>레시피를 부탁해</p>
				<a href="#services" class="btn btn-primary btn-xl page-scroll">레시피
					이동</a>
			</div>
		</div>
	</header>

	<section class="bg-primary" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<%
						if (session.getAttribute("id") != null) {
							String name = (String) session.getAttribute("id");
					%>
						<h2 class="section-heading"><%= name %>님 환영합니다</h2>
                    	<hr class="light">
                    	<a href="/pro/logout.do" class="page-scroll btn btn-default btn-xl sr-button fcolor">로그아웃</a>
                    	<a class="page-scroll btn btn-default btn-xl sr-button fcolor" href="/pro/basketList.do">즐겨찾기목록</a>
                    	<form action="/pro/idDel.do/<%= name %>" method="post" id="idDel">
                    	<input type="hidden" name="_method" value="delete">
                    	<button type="submit" class="page-scroll btn btn-default btn-xl sr-button fcolor">회원탈퇴</button>
                    	</form>
					<%
						} else if (session.getAttribute("str") != null) {
					%>
					<h2 class="section-heading">회원가입</h2>
					<hr class="light">
					<form id="insertform" action="/pro/insert.do" method="post">
						<p class="text-faded">
							<label for="id" class="text-faded fcolor2">아이디</label> <input type="text"
								id="id" name="id" class="text-faded" maxlength="8" size="8" /> <input
								type="hidden" id="hid" name="hid" value="0" />

							<button id="idChk" type="button" class="text-faded fcolor2">중복확인</button>
						</p>
						<p class="text-faded">
							<label for="pw" class="text-faded fcolor2">비밀번호</label> <input
								type="password" id="pw" name="pw" maxlength="8" size="8"
								class="text-faded" />
						</p>
						<p class="text-faded">
							<label for="pwChk" class="text-faded fcolor2">비밀번호확인</label>
							</td> <input type="password" id="pwChk" name="pwChk" maxlength="8"
								size="8" class="text-faded" />
						</p>

						<button type="submit"
							class="page-scroll btn btn-default btn-xl sr-button fcolor">입력</button>
						<a href="/pro"
							class="page-scroll btn btn-default btn-xl sr-button fcolor">취소</a>

					</form>
					<%
						} else {
					%>
					<h2 class="section-heading">로그인</h2>
					<hr class="light">
					<form action="/pro/login.do" method="post">
						<p class="text-faded">
							id <input type="text" name="adminId" id="adminId" maxlength="8"
								size="8" />&nbsp; pw <input type="password" name="adminPw"
								id="adminPw" maxlength="8" size="8" />
						</p>
						<button type="submit"
							class="page-scroll btn btn-default btn-xl sr-button fcolor">로그인</button>
						<a href="/pro/join.do"
							class="page-scroll btn btn-default btn-xl sr-button fcolor">회원가입</a>
					</form>

					<%
						}
					%>
				</div>
			</div>
		</div>
	</section>




	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">푸드레시피</h2>
					<hr class="primary">
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 text-center">
					<div class="service-box">
						<a href="/pro/cooklist.do" id="clist"> <i
							class="fa fa-4x fa-diamond text-primary sr-icons">List</i>
						</a>
					</div>
				</div>
				<%
					if (session.getAttribute("id") != null) {
				%>
				<div class="col-lg-4 col-md-6 text-center">
					<div class="service-box">
						<a href="#list" id="cadd"> <i
							class="fa fa-4x fa-paper-plane text-primary sr-icons">Add</i>
						</a>
					</div>
				</div>
				<%
					}
				%>
				<div class="col-lg-4 col-md-6 text-center">
					<div class="service-box" id="csearch">
						<a href="#list"> <i
							class="fa fa-4x fa-newspaper-o text-primary sr-icons"> Search</i>
						</a>
					</div>
				</div>

			</div>
		</div>
	</section>



	<section class="no-padding" id="portfolio">
		<div class="container-fluid">
			<div class="row no-gutter popup-gallery">
				<c:forEach items="${alist }" var="bean" end="7">
					<div class="col-sm-6 col-md-3">
						<a href="${bean.path }" class="portfolio-box"> <img
							src="${bean.path }" class="img-responsive" alt="" />
							<div class="portfolio-box-caption">
								<div class="portfolio-box-caption-content">
									<div class="project-category text-faded">${bean.title }</div>

								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>





	<section id="list">

<!-- 요리레시피 상세보기 -->
		<div class="row" id="cookdetail">
			<div class="col-xs-12">
			 <div class="alert alert-warning" role="alert"><h1>상세보기</h1></div>
			 
			<table class="table text-center">
			<%
                	if(session.getAttribute("id")!=null){
			%>
			
			<tr>
					<td>
								<input type="hidden" id="bean_num" value="${bean.cook_num }" />
								<%if(session.getAttribute("basket")!=null){ %>
								<button type="button" class="btn btn-primary text-faded" id="bdelbtn"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></button>
								<%}else{%>
								<button type="button" class="btn btn-primary text-faded" id="baddbtn"><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span></button>
								<%} %>
							</td>
						</tr>
			<%} %>
			
			<tr>
				<td><img src="${bean.path}" width="400px" height="256px"></td>
		
			</tr>
			<tr>
				<td><h1><b>${bean.title }</b></h1></td>
			</tr>
			<tr>
				<td><h4><b>준비물</b></h4><br/><br/>${bean.mat }</td>
			</tr>
			<tr>
				<td><h4><b>만드는 방법</b></h4><br/><br/>${bean.text }
				</td>
			</tr>
				<%
                	if(session.getAttribute("id")!=null){
                		String id = (String)session.getAttribute("id");
                		if(id.equals("admin")){
                %>
			<tr>
				<td>
					<form action="/pro/cookDel.do/${bean.cook_num }" method="post">
					<button type="button" class="btn btn-primary text-faded" id="modify">수정</button>
						<input type="hidden" name="_method" value="delete" />
						<input type="hidden" name="str" id="str" value="${bean.path }" />
						<button type="submit" class="btn btn-danger text-faded">삭제</button>
					</form>
				</td>
			</tr>
				<%
                	}
					}
                		%>
			</table>
			</div>
</div>

<!--  요리레시피 수정 -->
		<div class="row" id="cookmodify">
			<div class="col-xs-12">
			<div class="alert alert-warning" role="alert"><h3>수정</h3></div>
				<form id="cookmdy" class="form-horizontal" action="/pro/cookmodify.do/${bean.cook_num }" method="post" enctype="multipart/form-data">
				  <div class="form-group">
				    <input type="hidden" name="_method" value="put"/>
				    <label for="modifytitle" class="col-sm-2 control-label">요리제목</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="modifytitle" id="modifytitle" placeholder="요리제목을 입력하세요" value="${bean.title }">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="cookmat" class="col-sm-2 control-label">요리재료</label>
				    <div class="col-sm-10">
				      <textarea class="form-control cookmat" name="modifymat" id="modifymat" rows="5" placeholder="요리재료를 입력하세요" >${bean.mat }</textarea>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="cooktext" class="col-sm-2 control-label">요리방법</label>
				    <div class="col-sm-10">
				      <textarea class="form-control cookmat" name="modifytext" id="modifytext" rows="15" placeholder="요리방법을 입력하세요">${bean.text }</textarea>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="cookimg" class="col-sm-2 control-label">요리이미지</label>
				    <div class="col-sm-10">
				      <input type="file" class="form-control" name="filename2" id="filename2" placeholder="이미지 파일을 선택하세요"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="btn-group" role="group">
				      <button type="submit" class="btn btn-default">수정</button>
				      <button type="reset" class="btn btn-default">취소</button>
				      </div>
				    </div>
				  </div>
				</form>
			</div>
		</div>

		<!-- 요리레시피 등록 -->
		<div class="row" id="cookadd">
			<div class="col-xs-12">
				<div class="alert alert-warning" role="alert">
					<h3>등록</h3>
				</div>
				<form id="cookinsert" class="form-horizontal"
					action="/pro/cookinsert.do" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="cooktitle" class="col-sm-2 control-label">요리제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="cooktitle"
								id="cooktitle" placeholder="요리제목을 입력하세요">
						</div>
					</div>
					<div class="form-group">
						<label for="cookmat" class="col-sm-2 control-label">요리재료</label>
						<div class="col-sm-10">
							<textarea class="form-control cookmat" name="cookmat"
								id="cookmat" rows="5" placeholder="요리재료를 입력하세요"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="cooktext" class="col-sm-2 control-label">요리방법</label>
						<div class="col-sm-10">
							<textarea class="form-control cookmat" name="cooktext"
								id="cooktext" rows="15" placeholder="요리방법을 입력하세요"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="cookimg" class="col-sm-2 control-label">요리이미지</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" name="filename1"
								id="filename1" placeholder="이미지 파일을 선택하세요" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="btn-group" role="group">
								<button type="submit" class="btn btn-default">입력</button>
								<button type="reset" class="btn btn-default">취소</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>



		<!-- 요리레시피 검색 -->
		<div class="row" id="cooksearch">
			<div class="col-xs-12">
				<div class="alert alert-warning" role="alert">
					<h3>검색</h3>
				</div>
				<div>
					<form action="/pro/searchTitle.do" method="post">
						<label for="tags">Tags: </label> <input type="text" name="tags"
							id="tags">
						<button id="searchbtn">clcik</button>
					</form>
				</div>
			</div>
		</div>
		
		
		
	</section>



	




	<aside class="bg-dark">
		<div class="container text-center">
			<div class="call-to-action">
				<h2>나만의 레시피를 공유해봐요!</h2>
			</div>
		</div>
	</aside>






	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<h2 class="section-heading">문의 사항</h2>
					<hr class="primary">
					<p>연 락 처</p>
				</div>
				<div class="col-lg-4 col-lg-offset-2 text-center">
					<i class="fa fa-phone fa-3x sr-contact"></i>
					<p>123-456-6789</p>
				</div>
				<div class="col-lg-4 text-center">
					<i class="fa fa-envelope-o fa-3x sr-contact"></i>
					<p>
						<a href="mailto:your-email@your-domain.com">SpringProject@startbootstrap.com</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<!-- jQuery -->
	<script src="/pro/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/pro/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="/pro/resources/vendor/scrollreveal/scrollreveal.min.js"></script>
	<script
		src="/pro/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Theme JavaScript -->
	<script src="/pro/resources/js/creative.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			$('#cookadd').hide();
			$('#cookmodify').hide();
			$('#cooksearch').hide();

			$('#idChk').on('click', function() {
				$.ajax({
					url : "idck.do",
					dataType : 'html',
					type : 'post',
					data : ({
						id : $("#id").val()
					}),
					success : function(data) {
						if ($.trim(data) == 'YES') {
							alert("사용 가능합니다.");
							$("#hid").val("1");
						} else {
							alert("사용 불가능합니다.");
							$("#id").val("");
						}
					}
				});
			});
			$('#insertform').on('submit', function() {
				if ($("#id").val() == "") {
					alert("아이디를 꼭 입력하세요!");
					$("#id").focus();
					return false;
				} else if ($("#hid").val() == "0") {
					alert("아이디 중복검사 하세요!");
					return false;
					$("#id").focus();
				} else if ($("#pw").val() == "") {
					alert("비밀번호를 꼭 입력하세요!");
					$("#pw").focus();
					return false;
				} else if ($('#pw').val().length <= 5) {
					alert("6자리 ~ 8자리 입니다!");
					$("#pw").val("");
					$("#pw").focus();
					return false;
				} else if (!isNaN($("#pw").val())) {
					alert("영문자/숫자 조합으로 하세요!");
					$("#pw").val("");
					$("#pw").focus();
					return false;
				} else if ($("#pw").val() != $("#pwChk").val()) {
					alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
					$("#pwChk").val("");
					$("#pwChk").focus();
					return false;
				} else {
					alert("정상적으로 가입완료");
				}
			});

			$('#cookinsert').on('submit', function() {
				if ($("#cooktitle").val() == "") {
					alert("요리제목을 꼭 입력하세요!");
					$("#cooktitle").focus();
					return false;
				} else if ($("#cookmat").val() == "") {
					alert("요리재료를 꼭 입력하세요!");
					return false;
					$("#cookmat").focus();
				} else if ($("#cooktext").val() == "") {
					alert("요리방법을 꼭 입력하세요!");
					return false;
					$("#cooktext").focus();
				} else if ($("#filename1").val() == "") {
					alert("요리이미지를 꼭 업로드하세요!");
					return false;
					$("#filename1").focus();
				} else {
					alert("정상적으로 업로드 완료");
				}
			});

			$('.more').on('click', function() {
				$(this).css('display', "none");//more버튼 숨기기
				var index = $(".more").index(this);
				var cookts = $(".cookt").eq(index);
				$('.fold').eq(index).show();
				cookts.show();
			});

			$('.fold').on('click', function() {
				$(this).css('display', "none");//more버튼 숨기기
				var index = $(".fold").index(this);
				var cookts = $(".cookt").eq(index);
				$('.more').eq(index).show();
				cookts.hide();
			});
			$('#cookmdy').on('submit',function(){
				if ($("#modifytitle").val() == "") {
				    alert("요리제목을 꼭 입력하세요!");
				    $("#modifytitle").focus();
				    return false;
				}else if($("#modifymat").val() == ""){
					alert("요리재료를 꼭 입력하세요!");
					return false;
					$("#modifymat").focus();
				}else if($("#modifytext").val() == ""){
					alert("요리방법을 꼭 입력하세요!");
					return false;
					$("#modifytext").focus();
				}else if($("#filename2").val() == ""){
					alert("요리이미지를 꼭 업로드하세요!");
					return false;
					$("#filename2").focus();
				}else{
					alert("정상적으로 수정 완료");
				}
			});
			
			$('#modify').on('click',function(){
				$('#cookadd').hide();
				$('#cookdetail').hide();
				$('#cookmodify').show();
				
				var dbMat = $('#modifymat').val();
				var dbTxt = $('#modifytext').val();
				dbMat = dbMat.replace(/<br>/g, '\n');
				dbTxt = dbTxt.replace(/<br>/g, '\n');
				$('#modifymat').text(dbMat);
				$('#modifytext').text(dbTxt);
				
			});
			
			
			$(function() {
				$("#tags").autocomplete({
					source : function(request, response) {
						//많이 봤죠? jquery Ajax로 비동기 통신한 후
						//json객체를 서버에서 내려받아서 리스트 뽑는 작업
						$.ajax({
							//호출할 URL
							url : "/pro/search.do",
							//우선 jsontype json으로
							type : "post",
							dataType : "json",
							// parameter 값이다. 여러개를 줄수도 있다.
							data : {
								//request.term >> 이거 자체가 text박스내에 입력된 값이다.
								searchValue : request.term
							},
							success : function(result) {
								//return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다.
								response($.map(result, function(item) {
									return {
										//label : 화면에 보여지는 텍스트
										//value : 실제 text태그에 들어갈 값
										//본인은 둘다 똑같이 줬음
										//화면에 보여지는 text가 즉, value가 되기때문 
										label : item.data,
										value : item.data
									}
								}));
							}
						});
					},
					//최소 몇자 이상되면 통신을 시작하겠다라는 옵션
					minLength : 1,
					//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현
					//구현없으면 단순 text태그내에 값이 들어간다.
					select : function(event, ui) {
					}
				});
			})
			
			$('#cadd').on('click',function(){
			$('#cookdetail').hide();
			$('#cookmodify').hide();
			$('#cookadd').show();
			$('#cooksearch').hide();
		});
		$('#csearch').on('click',function(){
			$('#cookdetail').hide();
			$('#cookmodify').hide();
			$('#cooksearch').show();
			$('#cookadd').hide();
		});
		
		$('#baddbtn').on('click',function(){
			 $.ajax({
					url:"/pro/basketInsert.do",
					type: 'post',
					dataType: 'json',
					data: ({
						cook_num: $("#bean_num").val()
					}),
					success: function(data){
						alert(data.result);
						$('#bdelbtn').show();
						$('#baddbtn').hide();
						location.reload();
					}
			 });
		});
		
		$('#bdelbtn').on('click',function(){
			 $.ajax({
					url:"/pro/basketDel.do",
					type: 'post',
					dataType: 'json',
					data: ({
						cook_num: $("#bean_num").val()
					}),
					success: function(data){
						alert(data.rs);
						$('#bdelbtn').hide();
						$('#baddbtn').show();
						location.reload();
					}
			 });
		});
			
			
			$('#idDel').on('submit',function(){
				var result = confirm('정말 탈퇴하시겠습니까?');

			    if(result) {
			    	return true;
			    }
			    return false;
			});

		});
	</script>

</body>
</html>

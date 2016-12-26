<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
    <!-- jQuery -->
    <script src="/pro/resources/vendor/jquery/jquery.min.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="/pro/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="/pro/resources/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="/pro/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="/pro/resources/js/creative.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#check').on('click',function(){
			  $.ajax({
					url:"search.do",
					dataType:'html',
					type: 'post',
					data: ({
						id: $("#id").val()
					}),
					success: function(data){
						 $(data.title).each(function(){
							   alert(this.title);
						  });
					}
			 });
		});
		
})
</script>
</head>

<label for="id">제목 : </label>
<input type="text" id="id" name="id" />
<button id="check">click</button>
<body>
</body>
</html>
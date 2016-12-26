<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$( "#searchtext" ).autocomplete({
    			source : function( request, response ) {
    				//많이 봤죠? jquery Ajax로 비동기 통신한 후
    				//json객체를 서버에서 내려받아서 리스트 뽑는 작업
    		        $.ajax({
    		        	//호출할 URL
    		            url: "/pro/search.do",
    		            //우선 jsontype json으로
    		            dataType: "json",
    		            type: "get",
    		            // parameter 값이다. 여러개를 줄수도 있다.
    		            data: {
    		              //request.term >> 이거 자체가 text박스내에 입력된 값이다.
    		              searchValue: request.term
    		            },
    		            success: function( result ) {
    		            	//return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다.
    		                response( 
    		                	$.map( result, function( item ) {
    		                			return {
    		                			//label : 화면에 보여지는 텍스트
    		                			//value : 실제 text태그에 들어갈 값
    		                			//본인은 둘다 똑같이 줬음
    		                			//화면에 보여지는 text가 즉, value가 되기때문 
    		                  				label: item.data,
    		                  				value: item.data
    		                			}
    		              		})
    		              	);
    		            }
    		          });
    		    },
     		    //최소 몇자 이상되면 통신을 시작하겠다라는 옵션
    			minLength: 2,
    			//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현
    			//구현없으면 단순 text태그내에 값이 들어간다.
    			select: function( event, ui ) {}
    		});
})
</script>
</head>

<label for="searchtext">제목 : </label>
<input type="text" id="searchtext" name="searchtext" />

<body>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<table>
				<tr>
					<th>사번</th>
					<th>이름</th>
					<th>날짜</th>
					<th>금액</th>
				</tr>
				<c:forEach items="${alist }" var="bean">
				<tr>
					<td>
						${bean.title }
					</td>
					<td>
						${bean.mat }
					</td>
					<td>
						${bean.text }
					</td>
					<td>
						${bean.path }
					</td>
				</tr>
				</c:forEach>
				
			</table>
</body>
</html>

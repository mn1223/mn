<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer>
	<table>
		<tr>
			<td><a>회사소개</a></td>
			<td><a>개인정보취급방침</a></td>
			<td><a>서비스약관</a></td>
			<td><a>제휴문의</a></td>
			<td><a>이메일수집거부</a></td>
			<td></td>
		</tr>
		<tr>
			<td><a>로고</a></td>
			<td><a>주소</a><br /> <a>카피라이트</a></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</footer>

<style>

footer table {
	position: absolute;
	top: 50%;
	left: 0;
	transform: translate(0, -50%);
	width: 100%;
	height: 80%;
}

footer table tr td:last-child {
	width: 40%;
}

footer table tr:first-child td:not (:last-child ), footer table tr:nth-child(2) td:first-child
	{
	text-align: center;
}

footer table tr td {
	border-top: 1px solid black;
}

footer table tr:nth-child(2) td {
	border-bottom: 1px solid black;
}

footer {
	position: absolute;
	bottom: 0;
	height: 1.4rem;
	width: 100%;
}
</style>
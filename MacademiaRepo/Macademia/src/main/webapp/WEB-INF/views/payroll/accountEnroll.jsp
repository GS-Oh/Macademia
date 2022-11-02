<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 스위트 알랏 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>


		<script>
			Swal.fire({
			title: "${loginMember.name} --- ${loginMember.account}",
			text: "자동이체 계좌등록을 하시겠습니까?",
			icon: "question",
			showConfirmButton: false,
			footer: '<h3><a href="/md/payroll/account" style="background-color: #6667AB; color:white; text-decoration:none;">계좌 등록하기</a></h3>'
			}).then((result) => {
			  if (result.isConfirmed) {
				  	alert('didi');
				  	Swal.disableButtons();
				  }
			})
		</script>


















</body>
</html>
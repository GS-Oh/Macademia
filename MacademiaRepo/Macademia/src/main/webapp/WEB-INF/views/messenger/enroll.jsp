<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%@ include file="/resources/css/common/common.css" %>

	<style>
	
	    <%@ include file="/resources/css/messenger/commonAside.css" %>


		main{
			display: grid;
			grid-template-rows: 10% 40% auto;
			margin-top:20px;
		}

		#profile-title > h1{
			border-left: 5px solid #1315a6;
			padding-left: 15px;
		}
	
		#profile-main-content > form{
			font-size: 1.5rem;

			height: 100%;
			display: grid;
			grid-template-columns: 1fr 1.5fr 1fr;
			grid-template-rows: 1fr 1fr 1fr;
			border: 3px solid #1315a6;
			border-radius: 15px;
			align-items: center;
			text-align: center;
		}

		#main-content-img-wrap{
			grid-row: span 3;
			width: 100%;
			height: 100%;
			padding:10px 20px;
			border: 1px solid black;
		}

		
		#profile-main-content>form>div>button{
			width: 80%;
		}


		#profile-bottom-content{
			margin-top: 50px;
			display: grid;
			grid-template-rows: repeat(7, 1fr);
			align-items: center;
		}

    </style>
</head>
<body>


    <div id="wrap">

		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
        </header>
		<aside>		
			<%@ include file="/WEB-INF/views/messenger/commonAside.jsp" %>
		</aside>        

        <main>
            
			<div id="profile-title" style="margin-top: 20px;"><h1>메신저 등록하기</h1></div>

			<div id="profile-main-content">
				<form action="/md/messenger/enroll" method="post" enctype="multipart/form-data">
					<div id="main-content-img-wrap" >
						<img id="profile-img-thumb" src="" alt="" width="100%" height="90%" style="border:1px solid black">
						<input type="file" name="profile" style="height: 10%; width: 100%;" >
					</div>
					<div>직원명${loginMember.name}</div>
					<div>3-공백</div>
					<div style="grid-row: span 2;"><textarea name="introduce" id="" rows="9" style="width:90%;" placeholder="자기소개글을 작성해주세요"></textarea></div>
					<div><input type="submit" name="content" class="btn btn-primary btn-lg" style="color: white; width: 50%;" value="등록하기"></div>
					<div>6-공백</div>
				</form>
			</div>

			<div id="profile-bottom-content">
				<div class="badge bg-secondary"><h3>부서명-직책 ${loginMember.dept}-${loginMember.position}</h3></div>
				<div class="badge bg-secondary"><h3>주소-${loginMember.address}</h3></div>
				<div class="badge bg-secondary"><h3>이메일주소-${loginMember.email}</h3></div>
			</div>
			
        </main>


    </div>
    
    <script>
	    // 파일 있는지 확인하기
	    const fileInputTag = document.querySelector('input[name=profile]');
		
	    // 해당파일에 변화가 생기면 함수가 작동하도록 설정
	    fileInputTag.onchange = function(){
	    
	        //썸네일 보여줄 img태그 가져오기 (url 값 변경할 애 가져오기)
	        const imgTag = document.querySelector('#profile-img-thumb');
	        
	        //파일에 어떤 변화가 생긴건치 체크 --- 파일 추가하였을때 동작하도록 해주자
	        if(fileInputTag.files.length > 0){
	            
	            //파일 준비
	            const fr = new FileReader();
	            
	            //파일 읽기
	            fr.readAsDataURL(fileInputTag.files[0]);
	            
	            //파일 다 읽어오면 동작하는 함수 생성
	            fr.onload = function(data){
	                //썸네일img태그의 src 경로를 - 읽어온 파일의 url로 변경해주기
	                imgTag.src = data.target.result;
	            }
	        }else{
	            imgTag.src = "";
	        }
	    }
	</script>
    
    

</html>
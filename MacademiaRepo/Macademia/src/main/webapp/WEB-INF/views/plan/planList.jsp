<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<style>
ul, li{
list-style:none;
}
#content{
width:100vw;
height:80vh;

display: flex;

}
#side_menu{
width:15vw;
height:80vh;
border-radius:0 7px 7px 0 ;

background-color:#6667AB;
}
#center_menu{
width:70vw;
height:80vh;
border: 1px solid blue;

}
#right_menu{
width:20vw;
height:80vh;
background-color:#6667AB;
}
#test{
width: 100px;
height: 100px;
border: 1px solid red;
}
#menu{
width:100%;
margin:0;
padding:0;
margin-top:30px;
border-top:1px solid #fff;
}
#menu li{
text-align:center;
width:100%;
height:5%;
color: white;
border-bottom:1px solid #fff;

}
#right_menu{
}

</style>
	<title>마카데미아</title>
	
	<%@include file="/resources/css/common/common.css" %>
	
</head>
<body>
	
	
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		
		<div id="content">
		
			<div id="side_menu">
			<ul id="menu">
				
			<li>일정관리</li>
			<li>일정관리</li>
			<li>일정관리</li>
			<li>일정관리</li>
			</ul>
				
			</div>
			<div id="center_menu"></div>
			<div id="right_menu"></div>
		</div>	
			
		
	

</body>
</html>

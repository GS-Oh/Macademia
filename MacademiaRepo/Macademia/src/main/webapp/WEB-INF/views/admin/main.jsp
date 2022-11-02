<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>관리자</title>
	
	<%@include file="/resources/css/common/common.css" %>
	<%-- <%@include file="/resources/css/admin/common.css" %> --%>
	
<style id="react-tooltip" data-styled="active" data-styled-version="5.3.3"></style>
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async="" src="https://snap.licdn.com/li.lms-analytics/insight.min.js"></script>
<script type="text/javascript" integrity="sha384-0wxZnftk3sv9AeFAckGNlxBwZkOhfIFJHC27hmtbSnUTiKRiRXr1F7ftmkmxIYR6" crossorigin="anonymous" async="" src="https://cdn.amplitude.com/libs/amplitude-8.15.0-min.gz.js"></script>
<script src="https://connect.facebook.net/signals/config/195175789451413?v=2.9.86&amp;r=stable" async=""></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
<script type="text/javascript" async="" src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8"></script>
<script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-?????"></script>

<script>
	!function(e,t,a,n,g){e[n]=e[n]||[],e[n].push({"gtm.start":(new Date).getTime(),event:"gtm.js"});
	var m=t.getElementsByTagName(a)[0],r=t.createElement(a);
	r.async=!0,r.src="https://www.googletagmanager.com/gtm.js?id=GTM-WDK2LC2"
	, m.parentNode.insertBefore(r,m)}(window,document,"script","dataLayer")</script>
	<meta charset="utf-8">
	<link rel="shortcut icon" href="/favicon.ico">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<meta name="theme-color" content="#000000">
	<meta name="google" content="notranslate">
	<meta name="facebook-domain-verification" content="vo5n55gdznhztzukk13vb1m2ghig9y">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
<!-- 	 <link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css//bootstrap-select.min.css"> -->
	<link rel="stylesheet" href="/css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="/webapp/resources/css/admin/bootstrap-select-min.css">
	<link rel="stylesheet" href="/webapp/resources/css/admin/bootstrap.min.css">
	<link rel="stylesheet" href="/webapp/resources/css/admin/icon.css">
	<link rel="stylesheet" href="/webapp/resources/css/admin/root.css">
	<link rel="stylesheet" href="/webapp/resources/css/admin/common.css">



<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/50/9/intl/ja_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/50/9/intl/ja_ALL/util.js"></script>


</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
			<%@include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>
		</aside>
		<main>
			<%@include file="/WEB-INF/views/admin/main-content.jsp" %>
		</main>
	</div>

</body>
</html>
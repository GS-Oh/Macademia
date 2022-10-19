<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>관리자</title>
	
	<%@include file="/resources/css/common/common.css" %>
	<%-- <%@include file="/resources/css/admin/common.css" %> --%>
	
<style id="react-tooltip" data-styled="active" data-styled-version="5.3.3">
	.__react_component_tooltip{
		border-radius:3px;display:inline-block;
		font-size:13px;left:-999em;opacity:0;padding:8px 21px;
		position:fixed;
		pointer-events:none;
		transition:opacity 0.3s ease-out;top:-999em;visibility:hidden;z-index:999
	}
	.__react_component_tooltip.allow_hover,.__react_component_tooltip.allow_click{
		pointer-events:auto
	}
	.__react_component_tooltip:before,.__react_component_tooltip:after{
		content:"";width:0;height:0;position:absolute
	}
	.__react_component_tooltip.show{
		opacity:0.9;margin-top:0px;margin-left:0px;visibility:visible
	}
	.__react_component_tooltip.type-dark{
		color:#fff;background-color:#222
	}
	.__react_component_tooltip.type-dark.place-top:after{
		border-top-color:#222;
		border-top-style:solid;
		border-top-width:6px
	}
	.__react_component_tooltip.type-dark.place-bottom:after{
		border-bottom-color:#222;
		border-bottom-style:solid;
		border-bottom-width:6px
	}
	.__react_component_tooltip.type-dark.place-left:after{
		border-left-color:#222;border-left-style:solid;border-left-width:6px
	}
	.__react_component_tooltip.type-dark.place-right:after{
		border-right-color:#222;border-right-style:solid;border-right-width:6px
	}
	.__react_component_tooltip.type-dark.border{
		border:1px solid #fff
	}
	.__react_component_tooltip.type-dark.border.place-top:before{
		border-top:8px solid #fff
	}
	.__react_component_tooltip.type-dark.border.place-bottom:before{
		border-bottom:8px solid #fff
	}
	.__react_component_tooltip.type-dark.border.place-left:before{
		border-left:8px solid #fff
	}
	.__react_component_tooltip.type-dark.border.place-right:before{
		border-right:8px solid #fff
	}
	.__react_component_tooltip.type-success{
		color:#fff;background-color:#8DC572
	}
	.__react_component_tooltip.type-success.place-top:after{
		border-top-color:#8DC572;border-top-style:solid;border-top-width:6px
	}
	.__react_component_tooltip.type-success.place-bottom:after{
		border-bottom-color:#8DC572;border-bottom-style:solid;border-bottom-width:6px
	}
	.__react_component_tooltip.type-success.place-left:after{
		border-left-color:#8DC572;border-left-style:solid;border-left-width:6px
	}
	.__react_component_tooltip.type-success.place-right:after{
		border-right-color:#8DC572;border-right-style:solid;border-right-width:6px
	}
	.__react_component_tooltip.type-success.border{border:1px solid #fff}
	.__react_component_tooltip.type-success.border.place-top:before{border-top:8px solid #fff}
	.__react_component_tooltip.type-success.border.place-bottom:before{border-bottom:8px solid #fff}
	.__react_component_tooltip.type-success.border.place-left:before{border-left:8px solid #fff}
	.__react_component_tooltip.type-success.border.place-right:before{border-right:8px solid #fff}
	.__react_component_tooltip.type-warning{color:#fff;background-color:#F0AD4E}
	.__react_component_tooltip.type-warning.place-top:after{border-top-color:#F0AD4E;border-top-style:solid;border-top-width:6px}
	.__react_component_tooltip.type-warning.place-bottom:after{
		border-bottom-color:#F0AD4E;border-bottom-style:solid;border-bottom-width:6px
	}
	.__react_component_tooltip.type-warning.place-left:after{border-left-color:#F0AD4E;border-left-style:solid;border-left-width:6px}
	.__react_component_tooltip.type-warning.place-right:after{border-right-color:#F0AD4E;border-right-style:solid;border-right-width:6px0}
	.__react_component_tooltip.type-warning.border{border:1px solid #fff}
	.__react_component_tooltip.type-warning.border.place-top:before{
		border-top:8px solid #fff
	}
	.__react_component_tooltip.type-warning.border.place-bottom:before{
		border-bottom:8px solid #fff
	}.__react_component_tooltip.type-warning.border.place-left:before{border-left:8px solid #fff}
	.__react_component_tooltip.type-warning.border.place-right:before{border-right:8px solid #fff}
	.__react_component_tooltip.type-error{color:#fff;background-color:#BE6464}
	.__react_component_tooltip.type-error.place-top:after{border-top-color:#BE6464;border-top-style:solid;border-top-width:6px}
	.__react_component_tooltip.type-error.place-bottom:after{
		border-bottom-color:#BE6464;border-bottom-style:solid;border-bottom-width:6px
	}
	.__react_component_tooltip.type-error.place-left:after{
		border-left-color:#BE6464;border-left-style:solid;border-left-width:6px
	}
	.__react_component_tooltip.type-error.place-right:after{
		border-right-color:#BE6464;border-right-style:solid;border-right-width:6px
	}
	.__react_component_tooltip.type-error.border{border:1px solid #fff}
	.__react_component_tooltip.type-error.border.place-top:before{border-top:8px solid #fff}
	.__react_component_tooltip.type-error.border.place-bottom:before{border-bottom:8px solid #fff}
	.__react_component_tooltip.type-error.border.place-left:before{border-left:8px solid #fff}
	.__react_component_tooltip.type-error.border.place-right:before{border-right:8px solid #fff}
	.__react_component_tooltip.type-info{color:#fff;background-color:#337AB7}
	.__react_component_tooltip.type-info.place-top:after{border-top-color:#337AB7;border-top-style:solid;border-top-width:6px}
	.__react_component_tooltip.type-info.place-bottom:after{
		border-bottom-color:#337AB7;border-bottom-style:solid;border-bottom-width:6px
	}
	.__react_component_tooltip.type-info.place-left:after{
		border-left-color:#337AB7;border-left-style:solid;border-left-width:6px
	}
	.__react_component_tooltip.type-info.place-right:after{
		border-right-color:#337AB7;border-right-style:solid;border-right-width:6px
	}
	.__react_component_tooltip.type-info.border{border:1px solid #fff}
	.__react_component_tooltip.type-info.border.place-top:before{border-top:8px solid #fff}
	.__react_component_tooltip.type-info.border.place-bottom:before{border-bottom:8px solid #fff}
	.__react_component_tooltip.type-info.border.place-left:before{border-left:8px solid #fff}
	.__react_component_tooltip.type-info.border.place-right:before{border-right:8px solid #fff}
	.__react_component_tooltip.type-light{color:#222;background-color:#fff}
	.__react_component_tooltip.type-light.place-top:after{border-top-color:#fff;border-top-style:solid;border-top-width:6px}
	.__react_component_tooltip.type-light.place-bottom:after{
		border-bottom-color:#fff;border-bottom-style:solid;border-bottom-width:6px
	}
	.__react_component_tooltip.type-light.place-left:after{border-left-color:#fff;border-left-style:solid;border-left-width:6px}
	.__react_component_tooltip.type-light.place-right:after{border-right-color:#fff;border-right-style:solid;border-right-width:6px}
	.__react_component_tooltip.type-light.border{border:1px solid #222}
	.__react_component_tooltip.type-light.border.place-top:before{border-top:8px solid #222}
	.__react_component_tooltip.type-light.border.place-bottom:before{border-bottom:8px solid #222}
	.__react_component_tooltip.type-light.border.place-left:before{border-left:8px solid #222}
	.__react_component_tooltip.type-light.border.place-right:before{border-right:8px solid #222}
	.__react_component_tooltip.place-top{margin-top:-10px}
	.__react_component_tooltip.place-top:before{
		border-left:10px solid transparent;border-right:10px solid transparent;bottom:-8px;left:50%;margin-left:-10px
	}
	.__react_component_tooltip.place-top:after{
		border-left:8px solid transparent;border-right:8px solid transparent;bottom:-6px;left:50%;margin-left:-8px
	}
	.__react_component_tooltip.place-bottom{margin-top:10px}
	.__react_component_tooltip.place-bottom:before{
		border-left:10px solid transparent;border-right:10px solid transparent;top:-8px;left:50%;margin-left:-10px
	}
	.__react_component_tooltip.place-bottom:after{
		border-left:8px solid transparent;border-right:8px solid transparent;top:-6px;left:50%;margin-left:-8px
	}
	.__react_component_tooltip.place-left{margin-left:-10px}
	.__react_component_tooltip.place-left:before{
		border-top:6px solid transparent;border-bottom:6px solid transparent;right:-8px;top:50%;margin-top:-5px
	}
	.__react_component_tooltip.place-left:after{
		border-top:5px solid transparent;border-bottom:5px solid transparent;right:-6px;top:50%;margin-top:-4px
	}
	.__react_component_tooltip.place-right{margin-left:10px}
	.__react_component_tooltip.place-right:before{
		border-top:6px solid transparent;border-bottom:6px solid transparent;left:-8px;top:50%;margin-top:-5px
	}
	.__react_component_tooltip.place-right:after{
		border-top:5px solid transparent;border-bottom:5px solid transparent;left:-6px;top:50%;margin-top:-4px
	}
	.__react_component_tooltip .multi-line{
		display:block;padding:2px 0px;text-align:center
	}
</style>
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
	<link rel="manifest" href="/manifest.json">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="/css/datepicker.min.css">
	<link rel="stylesheet" href="/css/icon.css">
	<link rel="stylesheet" href="/css/root.css">
	<link rel="stylesheet" href="/css/common.css">
	<link href="/static/css/7.dd179363.chunk.css" rel="stylesheet">
	<link href="/static/css/main.8f6e9e96.chunk.css" rel="stylesheet">
	
	<style type="text/css">
	body.imp-payment-progress {
		position: static
	}
	body.imp-payment-progress > :not(.imp-dialog) {display: none}
.imp-dialog {display : none; position : fixed; top : 0; bottom : 0;left : 0; right : 0; width : 100%; height: 100%; z-index:99999;}
.imp-dialog .imp-frame-pc.imp-frame-danal, .imp-dialog .imp-frame-pc.imp-frame-danal_tpay { 
	left:50% !important; margin-left:-345px; width:720px !important; height:700px !important; margin-top: 50px;
}
.imp-dialog .imp-frame-pc.imp-frame-mobilians { 
	left:50% !important; margin-left:-410px; width:820px !important; height:700px !important; margin-top: 50px;
}
.imp-dialog .imp-header {
	display:none; background:transparent; position:absolute; top:0; left:0; right:0; height:25px;
}
.imp-dialog .imp-close {
	text-decoration : none; position : absolute; top : 10px; right : 10px; 
	cursor : pointer; 
	background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAAAV1JREFUOBHNkz1Ow0AQhWMHioggUSFEyRGAggp6KqDhDHAFOioU/loQoqDlGhyAgmtQ0gEO31jz1iPbcZyOlUY7fvvem9mdZDD472vY0mDegrVBGaBF54qELuPYSNQkc4FjkHNCAu2JSLLkHxvsZ+Gg9FAXUw4M+CI+8zy/cuIvezQ1sx9iDOeS/YOwZT7m0VgqcITgOpwars5WOXvke9vPY8EgqVIJTxDeVXCZWWdPZLuOL9fOZ35G03tnjbyznS4zDaPNWe91iNE+hGlRFK/s74R19k0stNJ1six7w/QlqPXWAepOdWUbwDPULeKAPL7p3GGohMzqA7DzY0xvRWSfayrCCsIHBHGaKmTTr/+kQo0q1busuZl+Z+ktocrUOr2ppM3/tKY9hDiBuOfkaCa9TE8BLhyUXpxUYQSy7qiun0gh0W02wWbyYhUJgkcj7cMpRb2JsBfhNjrqBfwBsGIgzBGH3EgAAAAASUVORK5CYII=');
}
.imp-dialog.pc .imp-frame-danal-certification {
	width:410px !important;height:660px !important;margin:10px auto;background: #fff;
}
.imp-dialog.pc.certification-danal {
	background: rgb(255, 255, 255);background: rgba(0,0,0,0.5);
}
.imp-dialog.pc.certification-danal .imp-header {
	display:block; width: 410px;margin:0 auto;
}
.imp-dialog.pc.certification-danal .imp-header .imp-close {
	top:18px; right:25px; width:19px; height:19px;
}
.imp-dialog.mobile.ios {
	position:absolute;
}
.imp-dialog.mobile.certification-danal .imp-header {
	display:block;
}
.imp-dialog.mobile.certification-danal .imp-header .imp-close {
	top:6px; right:10px; width:19px; height:19px;
}
.imp-dialog.pc.payment-settle_firm {
	background: rgb(221, 221, 221);background: rgba(0,0,0,0.5);
}
.imp-dialog.pc .imp-frame-settle_firm.layer {
	width:410px !important;height:700px !important;margin:10px auto;background: #fff;
}
.imp-dialog.pc.payment-kakaopay {
	background: rgb(221, 221, 221);background: rgba(0,0,0,0.5);
}
.imp-dialog.pc.payment-kakaopay .imp-frame-kakaopay {
	width: 426px !important; height: 550px !important; left: 50% !important; 
	top: 50% !important; margin-left:-213px !important;margin-top: -275px !important;
}
</style>

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
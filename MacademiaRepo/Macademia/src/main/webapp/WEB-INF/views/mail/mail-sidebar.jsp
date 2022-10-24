<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	main{
		margin: 0;
	}
    #side-wrap{
        font-size: 16px;
        background-color: #6667AB;
        width: 20vw;
        height: 90vh;
        padding: 10px;
    }
    #side-wrap div{
        border: 1px solid white;
        margin: 10px;
        color: white;
    }
     #side-wrap div a{
        color: white;
    }
</style>

<aside class="mail-aside">
				<div class="mail-btn-group">
					<a href="/md/mail/write" class="mail-btn">메일쓰기</a>
					<a href="/md/mail/write" class="mail-btn">내게쓰기</a>
				</div>
				<ul class="mail-menu">
					<li class="active">
						<a href="/md/mail/main">전체 메일함 <span>89</span></a>
					</li>
					<li>
						<a href="/md/mail/receive">받은 메일함</a><span>65</span>
					</li>
					<li>
						<a href="/md/mail/send">보낸 메일함 <span>24</span></a>
					</li>
					<li>
						<a href="#">휴지통<span>0</span></a>
					</li>
				</ul>
			</aside>

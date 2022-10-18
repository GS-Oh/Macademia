<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #side-wrap{
        font-size: 16px;
        color: white;
        background-color: #6667AB;
        width: 20vw;
        height: 90vh;
        padding: 10px;
    }
    #side-wrap a{
        color: white;
    }
    #side-wrap div{
        border: 1px solid black;
        margin: 10px;
    }
    .side-main-category>div{
        /* display: none; */
        font-size: 14px;
    }
</style>


<!-- <script>
    $(function(){
       
        $('.side-main-category').click(function(){
            $('.side-sub-category').hide();
            $(this).children().show();
        })
        
    });
</script> -->

<div id="side-wrap">
    
    <div class="side-main-category">근태 관리
        
        <div class="side-sub-category"><a href="${root}/employee/myAtdc">나의 근태현황</a></div>
        <div class="side-sub-category"><a href="${root}/employee/deptAtdc">부서별 근태현황</a></div>

    </div>

   <div class="side-main-category">휴가 관리

        <div class="side-sub-category"><a href="">나의 휴가현황</a></div>
        <div class="side-sub-category"><a href="">부서별 휴가현황</a></div>

    </div>
    
</div>

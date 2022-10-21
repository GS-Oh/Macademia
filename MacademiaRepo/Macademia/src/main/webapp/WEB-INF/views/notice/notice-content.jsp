<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>

<style>
    *, ::after, ::before {
        box-sizing: border-box;
    }

    div {
        display: block;
    }

    #wrapper, .id-wrapper {
        min-height: 100vh;
        padding: 32px;
        transition: padding 0.3s ease;
        background: #fff;
    }

    
    #ct {
        position: relative;
        display: flex;
        flex: 1 0 auto;
        flex-direction: column;
    }

    #ct > div{
        width: 100%;
        min-width: 1024px;
        max-width: none;
        padding: 32px;
    }

    #ct > .container {
        width: 100%;
        min-width: 1024px;
        max-width: none;
        padding: 32px;
        margin-right: auto;
        margin-left: auto;
    }


    .bread-title {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding-bottom: 28px;
    }

    #ct > div > div > div.title > h2{
        font-size: 24px;
        margin: 0;
        line-height: 1.33;
        font-weight: 600;
    }

    .btn-primary {
        background: #086bde;
        border-color: transparent !important;
        color: #fff !important;
    }

    .btn {
        min-width: 57px;
        height: 36px;
        padding: 5px 16px 7px 16px;
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
        box-shadow: none !important;
        color: #484848;
    }

    #ct > div > table{
        margin: 0;
        padding: 0;
    }
    .table {
        margin: 0;
    }
    .table-fixed {
        table-layout: fixed;
    }
    .table {
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
    }

    .sr-only {
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        overflow: hidden;
        clip: rect(0, 0, 0, 0);
        white-space: nowrap;
        border: 0;    
    }

    caption {
        padding-top: 0.75rem;
        padding-bottom: 0.75rem;
        color: #6c757d;
        text-align: left;
        caption-side: bottom;
    }

    colgroup {
        display: table-column-group;
    }

    thead {
        display: table-header-group;
        vertical-align: middle;
        border-color: inherit;
    }

    tr {
        display: table-row;
        vertical-align: inherit;
        border-color: inherit;
    }

    .table thead th {
        height: 24px;
        padding: 4px;
        border: 0;
        border-bottom: 2px solid #e0e0e0;
        font-size: 12px;
        line-height: 1.33;
        color: #767676;
    }

    tbody {
        display: table-row-group;
        vertical-align: middle;
        border-color: inherit;
    }
    #ct > div > table > tbody > tr > td {
        display: table-cell;
        padding: 32px 0;
        border: 0 !important;
        background: transparent !important;
        font-weight: 500;
        cursor: default !important;
        color: #484848;
        text-align: left;
    }


    .mb-4, .my-4 {
        margin-bottom: 1.5rem !important;
    }

    p {
        display: block;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
    }

    

   
    

    </style>
</head>
<body>
   <div>
       <div></div>
       <div id="ct">
           <div class="container">
               <div class="bread-title">
                   <div class="title"><span class="breadcrumb"></span>
                       <h2 class="h3">공지사항</h2>
                   </div>
                   <div class="btn btn-primary" data-toggle="modal">공지사항 추가</div>
               </div>
               <table class="table table-hover table-fixed">
                   <caption class="sr-only">공지사항 </caption>
                   <colgroup>
                       <col>
                       <col style="width: 160px;">
                       <col style="width: 160px;">
                   </colgroup>
                   <thead>
                       <tr>
                           <th scope="col">제목</th>
                           <th scope="col">작성일</th>
                           <th scope="col"></th>
                       </tr>
                   </thead>
                   <tbody>
                    <tr>
                        <td class="wide">
                            <div data-toggle="modal"> 55</div>
                        </td>
                        <td class="wide">2022년 10월 21일(금)</td>
                        <td class="wide">
                            <div class="btn text-primary cursor-pointer">앱 알림 보내기</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="wide">
                            <div data-toggle="modal"> 444</div>
                        </td>
                        <td class="wide">2022년 10월 21일(금)</td>
                        <td class="wide">
                            <div class="btn text-primary cursor-pointer">앱 알림 보내기</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="wide">
                            <div data-toggle="modal"> 444</div>
                        </td>
                        <td class="wide">2022년 10월 21일(금)</td>
                        <td class="wide">
                            <div class="btn text-primary cursor-pointer">앱 알림 보내기</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="wide">
                            <div data-toggle="modal"> 111</div>
                        </td>
                        <td class="wide">2022년 10월 21일(금)</td>
                        <td class="wide">
                            <div class="btn text-primary cursor-pointer">앱 알림 보내기</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="wide">
                            <div data-toggle="modal"> 이건제목</div>
                        </td>
                        <td class="wide">2022년 10월 21일(금)</td>
                        <td class="wide">
                            <div class="btn text-primary cursor-pointer">앱 알림 보내기</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="wide">
                            <div data-toggle="modal"> 테스트123</div>
                        </td>
                        <td class="wide">2022년 10월 21일(금)</td>
                        <td class="wide">
                            <div class="btn text-primary cursor-pointer">앱 알림 보내기</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="wide">
                            <div data-toggle="modal"> 123123</div>
                        </td>
                        <td class="wide">2022년 10월 21일(금)</td>
                        <td class="wide">
                            <div class="btn text-primary cursor-pointer">앱 알림 보내기</div>
                        </td>
                    </tr>
                </tbody>
               </table>
           </div>
       </div>
       <div></div>
       <div id="errorToast" class="toast toast-danger" data-delay="3000" style="position: fixed; bottom: 16px; right: 8px;">
           <div class="toast-body">
               <div class="toast-body-content">
                   <p><br></p>
               </div>
               <div class="ml-auto text-nowrap"><button type="button" class="close" data-dismiss="toast"><i class="ic-close text-secondary"></i></button></div>
           </div>
       </div>
       <div id="toastGreen" class="toast toast-success" data-delay="3000" style="position: fixed; bottom: 16px; right: 8px;">
           <div class="toast-body">
               <div class="toast-body-content">
                   <p><br></p>
               </div>
               <div class="ml-auto text-nowrap"><button type="button" class="close" data-dismiss="toast"><i class="ic-close text-secondary"></i></button></div>
           </div>
       </div>
       <div class="sc-iwjdpV fwkUUr">
           <div id="modal5" class="modal fade" tabindex="-1" role="dialog">
               <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered   " role="document">
                   <div class="modal-content  ">
                       <div class="modal-body-header">
                           <h4 class="h4">(을)를 삭제하시겠습니까?</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="material-icons">close</span></button>
                       </div>
                       <div class="modal-body"></div>
                       <div class="modal-footer" style="z-index: 100;"><button type="button" class="btn">취소</button><button type="button" class="btn btn-primary ">확인</button></div>
                   </div>
               </div>
           </div>
       </div>
       <div class="sc-iwjdpV fwkUUr">
           <div id="modal5" class="modal fade" tabindex="-1" role="dialog">
               <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
                   <div class="modal-content max-height-initial ">
                       <div class="modal-body-header">
                           <h4 class="h4">댓글달기</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="material-icons">close</span></button>
                       </div>
                       <div class="modal-body">
                           <div class="modal-body-content">
                               <div class="form-group">
                                   <div class="position-relative">
                                       <div><textarea class="form-control" rows="7" placeholder="댓글을 입력해주세요" name="replyContent"></textarea></div>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="modal-footer" style="z-index: 100;">
                           <div><button type="button" class="btn btn-secondary mr-1">취소</button><button type="button" class="btn btn-primary">확인</button></div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>
</body>
</html>
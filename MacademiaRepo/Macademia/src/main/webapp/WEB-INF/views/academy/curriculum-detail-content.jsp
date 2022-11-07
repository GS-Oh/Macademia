<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 도로명주소 검색 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/js/search-address/search-address.js"></script>    

<style>
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
        -ms-overflow-style: none;
    }
    ::-webkit-scrollbar {
    display: none;
    }
    
    #add-curriculum-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        row-gap: 10px;
    }
    #add-curriculum-content-wrap-head{
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 10vh;
    }

    /* 본문내용 */
    #add-curriculum-area{
        /* border: 1px solid black; */
    }
    .table-head-area{
        background-color: #6667AB;
        color: white;
    }

    /* 카테고리/강의명 설정 부분 */
    #add-curriculum-area-top{
        display: grid;
        grid-template-columns: 1fr 4fr 2fr;
        margin-bottom: 50px;
    }
    #curriculum-img-area{
        display: grid;
        justify-items: center;
        align-items: center;
    }
    #curriculum-img-area>img{
        width: 200px;
        height: 150px;
    }
    #curriculum-img-area>input{
        width: 200px;
    }

    .curriculum-head-area{
        color: white;
        display: grid;
        background-color: #6667AB;
        grid-template-rows: 50px 50px;
    }
    .curriculum-head-area>div{
        display: grid;
        justify-content: center;
        align-content: center;
        /* border-bottom: 1px solid lightgray; */
    }
    .curriculum-body-area{
        border-top: 1px solid lightgray;
        display: grid;
        grid-template-rows: 50px 50px;
    }
    .curriculum-body-area>div{
        display: grid;
        grid-template-columns: 1fr;
        justify-content: flex-start;
        align-content: center;
        border-bottom: 1px solid lightgray;
        padding: 0px 10px 0px 20px;
    }
    .curriculum-body-area textarea{
        margin: 10px 0px 10px 0px;
        padding: 10px 10px 10px 10px;
        resize: none;
    }
    .curriculum-body-area input, .curriculum-body-area select{
        height: 30px;
        padding-left: 10px;
    }

    /* 강의정보 부분 */
    #add-curriculum-area-mid{
        display: grid;
        grid-template-columns: 1fr 3fr 1fr 3fr;
        margin-bottom: 50px;
    }
    .mid-head-area{
        background-color: #6667AB;
        color: white;
        grid-template-rows: repeat(4, 50px);
        display: grid;
    }
    .mid-head-area>div{
        display: grid;
        justify-items: center;
        align-items: center;
        /* border-bottom: 1px solid lightgray; */
    }
    .mid-body-area{
        display: grid;
        grid-template-rows: repeat(4, 50px);
        grid-template-columns: 1fr;
        border-top: 1px solid lightgray;
    }
    .mid-body-area>div{
        display: grid;
        justify-items: flex-start;
        align-items: center;
        border-bottom: 1px solid lightgray;
        padding: 0px 10px 0px 20px;
    }
    .mid-body-area input, .mid-body-area select{
        padding-left: 10px;
        width: 100%;
        height: 30px;
    }

    /* 커리큘럼부분 */
    #add-curriculum-area-curriculum{
        margin-bottom: 50px;
    }
    #add-curriculum-area-curriculum-title{
        display: grid;
        grid-template-rows: 100px;
        justify-content: center;
        align-items: center;
        font-size: 18px;
    }
    #add-curriculum-area-curriculum-head{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 50px;
        justify-items: center;
        align-items: center;
        font-size: 13px;
        background-color: #6667AB;
        color: white;
    }
    .add-curriculum-area-curriculum-body{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: auto;
    }
    .add-curriculum-area-curriculum-body>div{
        display: grid;
        grid-template-columns: 1fr;
        justify-content: center;
        align-items: center;
        border-bottom: 1px solid lightgray;
        padding: 1vw;
    }
    .right-border{
        border-right: 1px solid lightgray;
    }
    #no-curriculum-inserted{
        height: 200px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    /* 학생리스트 */
    #student-list-area{
        margin-top: 20px;
        margin-bottom: 20px;
    }
    #student-list-area-mid{
        height: 50px;
        display: grid;
        grid-template-columns: 1fr 3fr 3fr;
        background-color: #6667AB;
        justify-items: center;
        align-items: center;
        color: white;
    }
    #student-list-area-bot{
        height: 300px;
        overflow-y: scroll;
    }
    .enrolled-students{
        width: 100%;
        height: 30px;
        border-bottom: 1px solid lightgray;
        display: grid;
        grid-template-columns: 1fr 3fr 3fr;
        justify-items: center;
        align-items: center;
    }
    .enrolled-students:hover{
        background-color: #6667AB;
        color: white;
        cursor: pointer;
    }
    #no-enrolled-student{
        height: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
      

    /* 하단버튼 */
    #create-btn-area{
        height: 4vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #create-btn-area>div, #create-btn-area>input{
        width: 100px;
        height: 30px;
        background-color: #6667AB;
        color: white;
        border: none;
        margin: 0px 5px 0px 5px;
    }
    #create-btn-area a{
        color: white;
        display: flex;
        width: 100%;
        height: 100%;
        align-items: center;
        justify-content: center;
    }
    #create-btn-area>div:hover, #create-btn-area>input:hover{
        font-weight: bolder;
    }

    /* 모달관련 */
    .addbgc{
        background-color: #6667AB;
        border: none;
        color: white;
    }
    .addbgc:hover{
        background-color: #6667AB;
        border: none;
        color: white;
        font-weight: bolder;
    }
    .modal-footer{
        display: flex;
        justify-content: center;
    }
    
</style>

<script>
    $(function(){
        let num;
        let l = $('.number').length
        
        for(num = 1; num <= l; num++){
            $('.number')[num-1].append(num);
        }

        $('.enrolled-students').on('click', function(){
            let no = $(this).children(1).val();
            location.href="${root}/academy/search/detail/" + no;
        });

    })
</script>


<div id="add-curriculum-content-wrap">
    <div id="add-curriculum-content-wrap-head">
        <h4>커리큘럼 상세조회</h4>
        <div>
            <button type="button" id="class-search-btn" class="addbgc btn" data-bs-toggle="modal" data-bs-target="#myModal">
                수강생조회
            </button>
            <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-1x">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        수강생 조회</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        
                        <div id="student-list-area">
                            <div id="student-list-area-mid">
                                <div>번호</div>
                                <div>이름</div>
                                <div>등록일자</div>
                            </div>
                            <div id="student-list-area-bot">
                                <c:if test="${not empty svo}">
                                    <c:forEach items="${svo}" var="e">
                                        <div class="enrolled-students">
                                            <input id="enrolled-student-number" type="hidden" value="${e.no}">
                                            <div class="number"></div>
                                            <div>${e.name}</div>
                                            <div>${e.joinDate}</div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty svo}">
                                    <div id="no-enrolled-student">수강생이 등록되지 않았습니다.</div>    
                                </c:if>
                            </div>
                        </div>
            
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                    <button type="button" id="modal-close-btn" class="addbgc btn" data-bs-dismiss="modal">닫기</button>
                    </div>
            
                </div>
                </div>
            </div>
        <!-- ---- -->
        </div>
    </div>

    <div id="add-curriculum-area">
        <div id="add-curriculum-area-top">
            <div class="curriculum-head-area">
                <div>카테고리</div>
                <div>강의명</div>
                <div>강의설명</div>
            </div>
            <div class="curriculum-body-area">
                <div>${cvo.categoryNo}</div>
                <div>${cvo.name}</div>
                <div><p>${cvo.description}</p></div>
            </div>
            <div id="curriculum-img-area">
                <img src="${root}/resources/upload/profile/classProfile/${cvo.fileName}" alt="강의이미지">
            </div>
            
        </div>
        
        <div id="add-curriculum-area-mid">
            <div class="mid-head-area">
                <div>정원</div>
                <div>강사</div>
                <div>개강일자</div>
                <div>시작시간</div>
            </div>

            <div class="mid-body-area">
                <div>${cvo.max} 명</div>
                <div>${cvo.memberNo} 강사님</div>
                <div>${cvo.beginDate}</div>
                <div>${cvo.startTime}</div>
            </div>

            <div class="mid-head-area">
                <div>비용</div>
                <div>강의실</div>
                <div>종강일자</div>
                <div>종료시간</div>
            </div>

            <div class="mid-body-area">
                <div>${cvo.fee}</div>
                <div>${cvo.classroom}</div>
                <div>${cvo.endDate}</div>
                <div>${cvo.finishTime}</div>
            </div>
            
        </div>

        <div id="add-curriculum-area-curriculum">
            <div id="add-curriculum-area-curriculum-title">
                <div>커리큘럼</div>
            </div>
            <div id="add-curriculum-area-curriculum-head">
                <div>단원명</div>
                <div>학습내용</div>
            </div>

            <c:if test="${not empty curVo}">
                <div class="add-curriculum-area-curriculum-body">
                    <c:forEach items="${curVo}" var="c">
                        <div class="right-border">
                            ${c.name}
                        </div>
                        <div>
                            ${c.content}
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <c:if test="${empty curVo}">
                <div id="no-curriculum-inserted">
                    커리큘럼이 등록되지 않았습니다.
                </div>
            </c:if>
        </div>

        
    </div>        

    <div id="create-btn-area">
        <div><a href="${root}/academy/curriculum/1">뒤로가기</a></div>
        <!-- <input type="submit" value="입력하기" id="submit-btn"> -->
    </div>
</div>
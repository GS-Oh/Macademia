<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 도로명주소 검색 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/js/search-address/search-address.js"></script>    

<style>
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
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
        justify-content: flex-start;
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
        padding: 0px 10px 0px 10px;
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
        padding: 0px 10px 0px 10px;
    }
    .mid-body-area input{
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
        grid-template-rows: 70px;
        justify-content: center;
        align-items: center;
        border-bottom: 1px solid lightgray;
        padding: 0vw 1vw 0vw 1vw;
    }
    .add-curriculum-area-curriculum-body>div>textarea{
        height: 50px;
        text-align: center;
        resize: none;
    }
    .right-border{
        border-right: 1px solid lightgray;
    }
    #add-curriculum-btn-area{
        height: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #add-curriculum-btn, #delete-curriculum-btn{
        width: 100px;
        height: 30px;
        border: 1px solid #6667AB;
        border-radius: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #6667AB;
        margin: 10px;
    }
    #add-curriculum-btn:hover, #delete-curriculum-btn:hover{
        background-color: #6667AB;
        border: none;
        color: white;
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
</style>

<script>
    $(function(){
        $('#add-curriculum-btn').click(function(){
            $('#curriculum-addition-area').append('<div class="add-curriculum-area-curriculum-body"><div class="right-border"><textarea name="" id="" cols="30" rows="10"></textarea></div><div><textarea name="" id="" cols="30" rows="10"></textarea></div></div>')
        })

        $('#delete-curriculum-btn').click(function(){
            $('#curriculum-addition-area').children("div:last").remove()
        })
    })
</script>

<form action="" method="post">
    <div id="add-curriculum-content-wrap">
        <div id="add-curriculum-content-wrap-head"><h4>커리큘럼 정보입력</h4></div>

        <div id="add-curriculum-area">
            <div id="add-curriculum-area-top">
                <div class="curriculum-head-area">
                    <div>카테고리 선택</div>
                    <div>강의명</div>
                    <div>강의설명</div>
                </div>
                <div class="curriculum-body-area">
                    <div>
                        <select name="" id="">
                        	<c:forEach items="${category}" var="c">
                            	<option value="">${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div><input type="text"></div>
                    <div><textarea name="" id="" cols="30" rows="10"></textarea></div>
                </div>
                <div id="curriculum-img-area">
                    <img src="" alt="강의이미지">
                    <input type="file">
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
                    <div><input type="number" min="0" max="100"></div>
                    <div>
						<select name="">
							<c:forEach items="${member}" var="m">
                            	<option value="">${m.name}</option>
                            </c:forEach>
						</select>
					</div>
                    <div><input type="date"></div>
                    <div id="class-time-line"><input type="time"></div>
                </div>

                <div class="mid-head-area">
                    <div>비용</div>
                    <div>강의실</div>
                    <div>종강일자</div>
                    <div>종료시간</div>
                </div>

                <div class="mid-body-area">
                    <div><input type="number"></div>
                    <div><input type="text"></div>
                    <div><input type="date"></div>
                    <div><input type="time"></div>
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

                <div class="add-curriculum-area-curriculum-body">
                    <div class="right-border">
                        <textarea name="" id="" cols="30" rows="10"></textarea>
                    </div>
                    <div>
                        <textarea name="" id="" cols="30" rows="10"></textarea>
                    </div>
                </div>
                <div id="curriculum-addition-area">
                    
                </div>
                

                <div id="add-curriculum-btn-area">
                    <div id="add-curriculum-btn"><i class="fa-solid fa-plus fa-1x"></i></div>
                    <div id="delete-curriculum-btn"><i class="fa-solid fa-minus fa-1x"></i></div>
                </div>

            </div>
        </div>        

        <div id="create-btn-area">
            <div><a href="${root}/academy/curriculum">뒤로가기</a></div>
            <input type="submit" value="입력하기">
        </div>
    </div>
</form>
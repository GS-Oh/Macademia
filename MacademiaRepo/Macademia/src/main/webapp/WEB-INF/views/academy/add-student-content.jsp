<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 도로명주소 검색 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/js/search-address/search-address.js"></script>  

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style>
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
    }
    #search-detail-edit-content-wrap>form{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh;
        row-gap: 10px;
    }
    #search-detail-edit-content-head{
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /* 정보부분 */
    #student-info-area{
        display: grid;
        grid-template-columns: 1fr 4fr;
        grid-auto-rows: 60px;
        align-content: center;
        border-top: 1px solid black;
        margin-bottom: 50px;
    }
    #student-profile, .comment-area{
        grid-row: span 4;
    }
    #student-profile>img{
        margin-bottom: 10px;
    }
    #student-name{
        grid-row: span 2;
        margin-top: 20px;
    }
    #student-name>h3{
        display: inline;
    }
    .info-title{
        border-right: 1px solid lightgray;
        border-top: 1px solid lightgray;
    }
    .info-border-top{
        border-top: 1px solid lightgray;
    }
    #student-info-area>div{
        padding: 15px 0px 0px 10px;
    }
    textarea{
        resize: none;
        padding-left: 10px;
        border-radius: 0px;
        width: 90%;
        height: 90%;
    }
    #student-info-area i{
        color: #6667AB;
        width: 30px;
    }
    #search-detail-edit-content-wrap>form input{
        border-radius: 0px;
        height: 30px;
        border: 1px solid gray;
    }
    #search-detail-edit-content-wrap>form input[type='file']{
        width: 160px;
        border: 0px;
    }
    #student-phone input, #student-email input{
        width: 200px;
    }
    #student-name input, #student-phone input, #student-email input{
        padding-left: 10px;
    }
    #student-dob>input{
        width: 140px;
        text-align: center;
    }
    #student-gender>input{
        margin-right: 10px;
    }
    #student-gender{
        display: grid;
        grid-template-columns: repeat(4, 30px);
        grid-auto-rows: 30px;
        align-items: center;
    }
    #student-addr-title{
        grid-row: span 2;
    }
    #student-addr{
        display: grid;
        grid-template-columns: 200px 100px 100px;
        column-gap: 10px;
        grid-row: span 2;
        text-align: center;
    }
    #sample4_jibunAddress{
        grid-column: span 2;
    }
    #student-addr>input{
        padding-left: 10px;
    }
    #addr-search-btn{
        background-color: #6667AB;
        color: white;
    }
    #student-degree>input, #student-major>input{
        width: 200px;
        padding-left: 10px;
    }
    #student-class>input{
        width: 400px;
        padding-left: 10px;
    }

    /* 하단버튼 */
    #edit-btn-area{
        height: 4vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #edit-btn-area>button, #edit-btn-area>input[type=submit]{
        width: 100px;
        height: 30px;
        background-color: #6667AB;
        color: white;
        border: none;
        margin: 0px 5px 0px 5px;
    }
    #edit-btn-area>button>a{
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    #edit-btn-area>button:hover, #edit-btn-area>input[type=submit]:hover{
        font-weight: bolder;
    }

    /* 페이징관련 */
    #page-area{
        height: 4vh;
        display: grid;
        grid-template-columns: repeat(9, 3vh);
        grid-template-rows: 3vh;
        justify-content: center;
        align-content: center;
        justify-items: center;
        align-items: center;
        column-gap: 5px;
    }
    #page-area>div{
        border: 1px solid gray;
        width: 100%;
        height: 100%;
    }
    #page-area a{
        display: flex;
        width: 100%;
        height: 100%;
        justify-content: center;
        align-items: center;
        color: #6667AB;
    }
    #page-area a>i{
        display: flex;
        width: 100%;
        height: 100%;
        justify-content: center;
        align-items: center;
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
    #modal-table-area{
        margin-bottom: 25px;
    }
    #modal-search-area{
        margin-top: 10px;
        margin-bottom: 25px;
    }
    #modal-body-head{
        background-color: #6667AB;
        color: white;
        display: grid;
        justify-items: center;
        align-items: center;
        grid-template-columns: 1fr 2fr 8fr 2fr 2fr;
        grid-template-rows: 30px;
        font-weight: bolder;
    }
    .modal-body-class-list{
        border-bottom: 1px solid lightgray;
        display: grid;
        justify-items: center;
        align-items: center;
        grid-template-columns: 1fr 2fr 8fr 2fr 2fr;
        grid-template-rows: 40px;
    }
    /* #class-label{
        border: 1px solid black;
        display: grid;
        grid-template-columns: 1fr 8fr 1fr 1fr;
        justify-items: center;
        align-items: center;
    } */
    
</style>

<script>
    $(function(){
        //이미지 썸네일 추가
        const fileInputTag = document.querySelector('input[name="f"]');

        fileInputTag.onchange = function(){
            const imgTag = document.querySelector('#student-profile-img');
            if(fileInputTag.files.length > 0){
                //파일 선택됨
                const fr = new FileReader();
                fr.onload = function(data){
                    imgTag.src = data.target.result;
                }
                fr.readAsDataURL(fileInputTag.files[0]);
            }else{
                imgTag.src="";
            }
        }

        console.log($('#class-name').text())
        // 선택한 강의 input에 넣기
        $('#modal-choice-btn').click(function(){
            let target = $('input[type=checkbox]:checked').val()
            console.log('target값 : ' + target)
            if(target == null){
                Swal.fire({
                    icon: 'warning',
                    title: '강의를 선택해주세요'
                });
            }else{
                let classNo = $('#enrolledClassNo').val()
                let className = $('#enrolledClass').val()
                classNo = target //hidden에 넘겨줄 값
                className = $('#class-name').html() //화면에 표시해줄 강의명
                $('input[type=checkbox]:checked').parent().siblings()
                console.log('hidden값 : ' + classNo)
            }

            document.querySelector('#modal-close-btn').click();
        });

        // submit confirm창에 swal 적용
        $('input[type=submit]').click(function(){
            // if(!confirm('정보를 입력할까요?')){
            //     return false;
            // }

            var confirm = function(msg, title) {
                swal({
                    title : title,
                    text : msg,
                    type : "warning",
                    showCancelButton : true,
                    confirmButtonClass : "btn-danger",
                    confirmButtonText : "예",
                    cancelButtonText : "아니오",
                    // closeOnConfirm : true,
                    closeOnCancel : true,
                    clickConfirm: true
                }, function(confirm) {
                    if (confirm) {
                        return true;
                    }else{
                        return false;
                    }
                });
            }

            confirm('새로운 수강생이 등록됩니다.','입력할까요?');
            
        });
    });
</script>

<div id="search-detail-edit-content-wrap">

    <form action="" method="post" enctype="multipart/form-data">

        <div id="search-detail-edit-content-head"><h4>수강생 정보입력</h4></div>

        <div id="student-info-area">
            <div id="student-profile">
                <img id="student-profile-img" src="" width="140px" height="180px" alt="수강생 프로필">
                <input type="file" name="f">
            </div>
            <div id="student-name">
                <i class="fa-solid fa-star-of-life fa-2xs" style="color:red"></i>
                <h3>
                    <input type="text" name="name" required placeholder="이름을 입력해주세요.">
                </h3>
            </div>
            <div id="student-phone">
                <i class="fa-solid fa-star-of-life fa-2xs" style="color:red"></i>
                <i class="fa-solid fa-mobile-screen-button fa-2xl"></i>
                <b><input type="text" name="phone" required placeholder="휴대폰 번호를 입력해주세요."></b>
            </div>
            <div id="student-email">
                <i class="fa-solid fa-star-of-life fa-2xs" style="color:red"></i>
                <i class="fa-solid fa-envelope fa-xl"></i>
                <b><input type="text" name="email" required placeholder="이메일 주소를 입력해주세요."></b>
            </div>
            <div class="info-title">
                <i class="fa-solid fa-star-of-life fa-2xs" style="color:red"></i>
                <b>생년월일</b>
            </div>
            <div class="info-border-top" id="student-dob">
                <input type="number" name="birth" min="1922" max="2022" required>
                <input type="number" name="birth" min="01" max="12" required>
                <input type="number" name="birth" min="01" max="31" required>
            </div>
            <div class="info-title">
                <i class="fa-solid fa-star-of-life fa-2xs" style="color:red"></i>
                <b>성별</b>
            </div>
            <div class="info-border-top" id="student-gender">
                <input type="radio" id="male" name="gender" value="M">
                <label for="male">남</label>
                <input type="radio" id="female" name="gender" value="F">
                <label for="female">여</label>
            </div>
            <div class="info-title" id="student-addr-title">
                <i class="fa-solid fa-star-of-life fa-2xs" style="color:red"></i>
                <b>주소</b>
            </div>
            <div class="info-border-top" id="student-addr">
                <input type="text" id="sample4_postcode" placeholder="우편번호">
                <input type="button" id="addr-search-btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="sample4_roadAddress" name="newAddress" placeholder="도로명주소">
                <input type="text" id="sample4_jibunAddress" name="oldAddress" placeholder="지번주소">
                <input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text" id="sample4_extraAddress" placeholder="참고항목">
            </div>
            <div class="info-title"><b>최종학력</b></div>
            <div class="info-border-top" id="student-degree"><input type="text" name="finalDegree"></div>
            <div class="info-title"><b>전공</b></div>
            <div class="info-border-top" id="student-major"><input type="text" name="major"></div>
            <div class="info-title"><b>수강</b></div>
            <div class="info-border-top" id="student-class">
                <input type="hidden" id="enrolledClassNo" value="0" name="enrolledClass">
                <input type="text" id="enrolledClass" disabled>
                <button type="button" id="class-search-btn" class="addbgc btn" data-bs-toggle="modal" data-bs-target="#myModal">
                    강의검색
                </button>
                <!-- The Modal -->
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                강의 검색</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div id="modal-search-area">
                                    <input type="search" placeholder="강의 검색">
                                    <input type="button" value="검색">
                                </div>
                                <div id="modal-table-area">
                                    <div id="modal-body-head">
                                        <div></div>
                                        <div>강의실</div>
                                        <div>강의명</div>
                                        <div>강사명</div>
                                        <div>개강일</div>
                                    </div>

									<c:forEach items="${classList}" var="l">
	                                    <div class="modal-body-class-list">
	                                        <div>
                                                <input type="checkbox" value="${l.no}">
                                            </div>
                                            <div>${l.classroom}</div>
                                            <div id="class-name">${l.name}</div>
                                            <div>${l.memberNo}</div>
                                            <div>${l.beginDate}</div>
	                                    </div>
                                    </c:forEach>
                                    
                                </div>
                    
                                <div id="page-area">
                                    <div><a href=""><i class="fa-solid fa-angles-left"></i></a></div>
                                    <div><a href=""><i class="fa-solid fa-angle-left"></i></a></div>
                                    <div><a href="">1</a></div>
                                    <div><a href="">2</a></div>
                                    <div><a href="">3</a></div>
                                    <div><a href="">4</a></div>
                                    <div><a href="">5</a></div>
                                    <div><a href=""><i class="fa-solid fa-angle-right"></i></a></div>
                                    <div><a href=""><i class="fa-solid fa-angles-right"></i></a></div>
                                </div>
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="button" id="modal-choice-btn" class="addbgc btn">선택</button>
                            <button type="button" id="modal-close-btn" class="addbgc btn" data-bs-dismiss="modal">닫기</button>
                            </div>
                    
                        </div>
                        </div>
                    </div>
                <!-- ---- -->
            </div>
            <div class="info-title comment-area"><b>코멘트</b></div>
            <div class="comment-area info-border-top"><textarea name="stdComment"></textarea></div>
        </div>

        <div id="edit-btn-area">
            <button><a href="${root}/academy/search">뒤로가기</a></button>
            <input type="submit" value="입력하기">
        </div>

    </form>

</div>
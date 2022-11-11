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
        /* display: inline-block; */
        width: 100%;
        height: 100%;
    }
    #edit-btn-area>button:hover, #edit-btn-area>input[type=submit]:hover{
        font-weight: bolder;
    }

    /* 페이징관련 */
    #page-area{
        height: 4vh;
        display: flex;
        flex-wrap: nowrap;
        justify-content: center;
        align-content: center;
        justify-items: center;
        align-items: center;
        column-gap: 5px;
    }
    #page-area>div{
        width: 3vh;
        height: 3vh;
    }
    #page-area a{
        display: flex;
        width: 100%;
        height: 100%;
        justify-content: center;
        align-items: center;
        color: #6667AB;
    }
    #page-area a:hover, #page-area a:hover>i{
        cursor: pointer;
        background-color: #6667AB;
        color: white;
        font-weight: bolder;
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
    .modal-body-no-class-list{
        display: flex;
        flex-wrap: nowrap;
        height: 40px;
        justify-content: center;
        align-items: center;
    }

</style>

<script>
    $(function(){
        let gender = '${svo.gender}'
        if(gender === 'M'){
            $('input[value="M"]').attr('checked', true)
        }else{
            $('input[value="F"]').attr('checked', true)
        }

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

        // 선택한 강의 input에 넣기
        $('#modal-choice-btn').click(function(){
            let target = $('input[type=checkbox]:checked').val()
            if(target == null){
                Swal.fire({
                    icon: 'warning',
                    title: '강의를 선택해주세요'
                });
            }else{
                let inputClassName = $('input[type=checkbox]:checked').parent().siblings('#class-name').text() //화면 input에 표시해줄 강의명
                $('#enrolledClassNo').attr('value', target);   //hidden에 넘겨줄 값
                $('#enrolledClass').attr('value', inputClassName);
                console.log('강의명 넘어온 input값 : ' + $('#enrolledClass').val());
                console.log('hidden값 : ' + $('#enrolledClassNo').val());

                document.querySelector('#modal-close-btn').click();
            }

        });
        
    });
</script>
</script>

<script>
    $(function(){
        let birth = '${svo.birth}'
        const year = birth.substring(0,4)
        const month = birth.substring(5,7)
        const date = birth.substring(8,11)

        $('input[id="year"]').attr('value', year)
        $('input[id="month"]').attr('value', month)
        $('input[id="date"]').attr('value', date)
    });
</script>

<div id="search-detail-edit-content-wrap">

    <form action="" method="post" enctype="multipart/form-data" onsubmit="return submitForm();">

        <div id="search-detail-edit-content-head"><h4>수강생 정보수정</h4></div>

        <div id="student-info-area">
            <div id="student-profile">
                <img src="${root}/resources/upload/profile/studentProfile/${svo.profile}" id="student-profile-img" width="160px" height="180px" alt="수강생 프로필">
                <input type="file" name="f">
            </div>
            <div id="student-name"><input type="hidden" name="name"><h3>${svo.name}</h3></div>
            <div>
                <i class="fa-solid fa-mobile-screen-button fa-2xl"></i>
                <b><input type="text" name="phone" value="${svo.phone}"></b>
            </div>
            <div>
                <i class="fa-solid fa-envelope fa-xl"></i>
                <b><input type="text" name="email" value="${svo.email}"></b>
            </div>
            <div class="info-title"><b>생년월일</b></div>
            <div class="info-border-top" id="student-dob">
                <input type="number" id="year" name="birth" value="" min="1922" max="2022">
                <input type="number" id="month" name="birth" value="" min="01" max="12">
                <input type="number" id="date" name="birth" value="" min="01" max="31">
            </div>
            <div class="info-title"><b>성별</b></div>
            <div class="info-border-top" id="student-gender">
                <input type="radio" id="m" name="gender" value="M" disabled>
                <label for="m">남</label>
                <input type="radio" id="f" name="gender" value="F" disabled>
                <label for="f">여</label>
            </div>
            <div class="info-title" id="student-addr-title"><b>주소</b></div>
            <div class="info-border-top" id="student-addr">
                <input type="text" id="sample4_postcode" value="" placeholder="우편번호">
                <input type="button" id="addr-search-btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="sample4_roadAddress" name="newAddress" value="${svo.newAddress}" placeholder="도로명주소">
                <input type="text" id="sample4_jibunAddress" name="oldAddress" value="${svo.oldAddress}" placeholder="지번주소">
                <input type="text" id="sample4_detailAddress" name="detailAddress" value="${svo.detailAddress}" placeholder="상세주소">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text" id="sample4_extraAddress" placeholder="참고항목">
            </div>
            <div class="info-title"><b>최종학력</b></div>
            <div class="info-border-top" id="student-degree"><input type="text" name="finalDegree" value="${svo.finalDegree}"></div>
            <div class="info-title"><b>전공</b></div>
            <div class="info-border-top" id="student-major"><input type="text" name="major" value="${svo.major}"></div>
            <div class="info-title"><b>수강</b></div>
            <div class="info-border-top" id="student-class">
                <input type="hidden" id="enrolledClassNo" value="${svo.enrolledClass}" name="enrolledClass">
                <input type="text" id="enrolledClass" value="${svo.enrolledClassName}" disabled>
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
                                <div id="modal-body-head">
                                    <div></div>
                                    <div>강의실</div>
                                    <div>강의명</div>
                                    <div>강사명</div>
                                    <div>개강일</div>
                                </div>
                                <div id="modal-table-area">

                                </div>
                    
                                <div id="page-area">
                                    
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
            <div class="comment-area info-border-top"><textarea name="stdComment" id="" cols="110" rows="8">${svo.stdComment}</textarea></div>
        </div>

        <div id="edit-btn-area">
            <button><a href="${root}/academy/search/detail">뒤로가기</a></button>
            <input type="submit" value="수정하기">
        </div>

    </form>

</div>

<!-- 모달 페이징 -->
<script>
    $('#myModal').on('show.bs.modal', selectClassList(1));
   
    function selectClassList(pnum){
        $.ajax({
            type : 'GET',
            url : '${root}/academy/classList/' + pnum,
            success : function(map){
                const list = map.classList.length

                if(map.classList.length > 0){
                    for(let i = 0; i < list; i++){
                        $('#modal-table-area').append('<div class="modal-body-class-list"> <div> <input type="checkbox" value="' + map.classList[i].no + '"> </div> <div>' + map.classList[i].classroom + '</div> <div id="class-name">' + map.classList[i].name + '</div> <div>' + map.classList[i].memberNo + '</div> <div>' + map.classList[i].beginDate + '</div> </div>');
                    }
                }else{
                    $('#modal-table-area').append('<div class="modal-body-no-class-list"> 목록이 존재하지 않습니다 </div>');
                }


                if(map.pvo.startPage > 5){
                    $('#page-area').append('<div><a onclick="f01(1);"><i class="fa-solid fa-angles-left"></i></a></div>');
                }

                if(map.pvo.startPage != 1){
                    $('#page-area').append('<div><a onclick="f01(' + (map.pvo.startPage-1) + ');"><i class="fa-solid fa-angle-left"></i></a></div>');
                }

                for(let i = map.pvo.startPage; i <= map.pvo.endPage; i++){
                    // $('#page-area').append('<div><a onclick="selectClassList(' + i + ')">' + i + '</a></div>');
                    $('#page-area').append('<div><a onclick="f01(' + i + ');">' + i + '</a></div>');
                }
                    
                if(map.pvo.endPage != map.pvo.maxPage){
                    $('#page-area').append('<div><a onclick="f01(' + (map.pvo.endPage+1) + ');"><i class="fa-solid fa-angle-right"></i></a></div>');
                }

                if(map.pvo.endPage != map.pvo.maxPage){
                    $('#page-area').append('<div><a onclick="f01(' + map.pvo.maxPage + ');"><i class="fa-solid fa-angles-right"></i></a></div>');
                }
            },
            error : function(x){
                console.log('not good');
            }
        });
    }

    function f01(pnum){
        $('#modal-table-area').html('');
        $('#page-area').html('');

        selectClassList(pnum);
    }

 
</script>


<script>
     // submit confirm창에 swal 적용
     function submitForm(){
            Swal.fire({
                title: '수강생 정보를 수정 하시겠습니까?',
                text: "입력하신 수강생 정보가 업데이트 됩니다.",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '예',
                cancelButtonText: '아니오'
            }).then(function(x){
                if(x.isConfirmed){
                    //submit
                    document.querySelector('form').submit();
                }
            });

            return false;
        }
</script>
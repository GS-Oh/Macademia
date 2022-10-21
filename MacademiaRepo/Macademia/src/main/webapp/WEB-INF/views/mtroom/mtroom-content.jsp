<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실</title>

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

    .ic-error:before {
        content: "\e912";
    }

    .__react_component_tooltip.place-right {
        margin-left: 10px;
    }

    .__react_component_tooltip.type-light {
        color: #222;
        background-color: #fff;
    }
    .tooltip-box {
        border-radius: 8px;
        box-shadow: 0 20px 32px -8px rgb(0 0 0 / 25%), 0 0 1px 0 rgb(0 0 0 / 31%);
        background-color: var(--white);
        padding: 16px;
        opacity: 1!important;
    }

    .__react_component_tooltip {
        border-radius: 3px;
        display: inline-block;
        font-size: 13px;
        left: -999em;
        opacity: 0;
        padding: 8px 21px;
        position: fixed;
        pointer-events: none;
        transition: opacity 0.3s ease-out;
        top: -999em;
        visibility: hidden;
        z-index: 999;
    }

    [class^="ic-"], [class*="ic-"] {
        font-family: 'icomoon' !important;
        speak: none;
        font-style: normal;
        font-weight: normal;
        font-variant: normal;
        text-transform: none;
        line-height: 1;
        font-size: 24px;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    .date-header {
        display: flex;
        align-items: center;
        justify-content: center;
    }
    

</style>
</head>

    <div id="ct">
        <div class="container">
            <div class="bread-title">
                <div class="title"><span class="breadcrumb"></span>
                    <h2 class="h3">회의실 예약 <span class="small">(1건)</span>
                        <br>
                        <div class="font-weight-medium">
                            <i class="ic-error cursor-pointer text-primary" data-tip data-for="mt-tip1" currentitem="false" style="font-size: 14px;">예약 Tip</i>
                            <div class="__react_component_tooltip place-right type-light tooltip-box" id="mt-tip1" data-id="tooltip" style="left: 340px; top: 150px;">
                                <div class="__react_component_tooltip place-right type-light tooltip-box __web-inspector-hide-shortcut__" id="mt-tip1" data-id="tooltip" style="left: 340px; top: 150px;"></div>
                                <div>타임 테이블 내 빈 곳을 클릭해서 예약해 주세요.</div>
                                <div>타임 테이블을 좌우로 드래그해서 시간을 변경할 수 있어요.</div>
                            </div>
                        </div>
                    </h2>
                </div>
                <div class="btn btn-primary" data-toggle="modal">회의실 추가/변경</div>
            </div>
            <div>
                <div>
                    <div class="">
                        <div class="date-header">
                            <div title="전날" class="mt-1"><i class="ic-arrow-left mr-3"></i>
                            </div>
                            <h3 class="week"><span class="cursor-pointer">2022년 10월 21일(금)</span></h3>
                            <div title="다음날" class="mt-1">
                                <i class="ic-arrow-right ml-3"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-inline mr-1 display-block">
                        <p class="display-block small">카테고리</p>
                        <div class="dropdown bootstrap-select">
                            <select class="selectpicker" name="category" tabindex="-98">
                                <option value="495">안녕하세요</option>
                                <option value="496">안녕하세요2</option>
                            </select>
                            <!-- <button type="button" class="btn dropdown-toggle btn-light" data-toggle="dropdown" role="button" title="안녕하세요">
                                <div class="filter-option">
                                    <div class="filter-option-inner">
                                        <div class="filter-option-inner-inner">안녕하세요</div>
                                    </div>
                                </div>
                            </button> -->
                            <div class="dropdown-menu " role="combobox" style="max-height: 401.512px; overflow: hidden; min-height: 0px;">
                                <div class="inner show" role="listbox" aria-expanded="false" tabindex="-1" style="max-height: 385.512px; overflow-y: auto; min-height: 0px;">
                                    <ul class="dropdown-menu inner show">
                                        <li class="selected active"><a role="option" class="dropdown-item selected active" aria-disabled="false" tabindex="0" aria-selected="true"><span class=" bs-ok-default check-mark"></span><span class="text">안녕하세요</span></a></li>
                                        <li><a role="option" class="dropdown-item" aria-disabled="false" tabindex="0" aria-selected="false"><span class=" bs-ok-default check-mark"></span><span class="text">안녕하세요2</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="react-calendar-timeline ">
                        <div class="rct-header-root" style="display: flex; width: 100%;">
                            <div style="width: 150px;"></div>
                            <div class="rct-calendar-header" style="overflow: hidden; width: calc(100% - 150px);">
                                <div class="rct-dateHeader" style="position: relative; width: 3246px; height: 30px;">
                                    <div style="text-align: center; left: -87.2432px; width: 90.1667px; position: absolute;">14:00</div>
                                    <div style="text-align: center; left: 2.92348px; width: 90.1667px; position: absolute;">15:00</div>
                                    <div style="text-align: center; left: 93.0901px; width: 90.1667px; position: absolute;">16:00</div>
                                    <div style="text-align: center; left: 183.257px; width: 90.1667px; position: absolute;">17:00</div>
                                    <div style="text-align: center; left: 273.423px; width: 90.1667px; position: absolute;">18:00</div>
                                    <div style="text-align: center; left: 363.59px; width: 90.1667px; position: absolute;">19:00</div>
                                    <div style="text-align: center; left: 453.757px; width: 90.1667px; position: absolute;">20:00</div>
                                    <div style="text-align: center; left: 543.923px; width: 90.1667px; position: absolute;">21:00</div>
                                    <div style="text-align: center; left: 634.09px; width: 90.1667px; position: absolute;">22:00</div>
                                    <div style="text-align: center; left: 724.257px; width: 90.1667px; position: absolute;">23:00</div>
                                    <div style="text-align: center; left: 814.423px; width: 90.1667px; position: absolute;">00:00</div>
                                    <div style="text-align: center; left: 904.59px; width: 90.1667px; position: absolute;">01:00</div>
                                    <div style="text-align: center; left: 994.757px; width: 90.1667px; position: absolute;">02:00</div>
                                    <div style="text-align: center; left: 1084.92px; width: 90.1667px; position: absolute;">03:00</div>
                                    <div style="text-align: center; left: 1175.09px; width: 90.1667px; position: absolute;">04:00</div>
                                    <div style="text-align: center; left: 1265.26px; width: 90.1667px; position: absolute;">05:00</div>
                                    <div style="text-align: center; left: 1355.42px; width: 90.1667px; position: absolute;">06:00</div>
                                    <div style="text-align: center; left: 1445.59px; width: 90.1667px; position: absolute;">07:00</div>
                                    <div style="text-align: center; left: 1535.76px; width: 90.1667px; position: absolute;">08:00</div>
                                    <div style="text-align: center; left: 1625.92px; width: 90.1667px; position: absolute;">09:00</div>
                                    <div style="text-align: center; left: 1716.09px; width: 90.1667px; position: absolute;">10:00</div>
                                    <div style="text-align: center; left: 1806.26px; width: 90.1667px; position: absolute;">11:00</div>
                                    <div style="text-align: center; left: 1896.42px; width: 90.1667px; position: absolute;">12:00</div>
                                    <div style="text-align: center; left: 1986.59px; width: 90.1667px; position: absolute;">13:00</div>
                                    <div style="text-align: center; left: 2076.76px; width: 90.1667px; position: absolute;">14:00</div>
                                    <div style="text-align: center; left: 2166.92px; width: 90.1667px; position: absolute;">15:00</div>
                                    <div style="text-align: center; left: 2257.09px; width: 90.1667px; position: absolute;">16:00</div>
                                    <div style="text-align: center; left: 2347.26px; width: 90.1667px; position: absolute;">17:00</div>
                                    <div style="text-align: center; left: 2437.42px; width: 90.1667px; position: absolute;">18:00</div>
                                    <div style="text-align: center; left: 2527.59px; width: 90.1667px; position: absolute;">19:00</div>
                                    <div style="text-align: center; left: 2617.76px; width: 90.1667px; position: absolute;">20:00</div>
                                    <div style="text-align: center; left: 2707.92px; width: 90.1667px; position: absolute;">21:00</div>
                                    <div style="text-align: center; left: 2798.09px; width: 90.1667px; position: absolute;">22:00</div>
                                    <div style="text-align: center; left: 2888.26px; width: 90.1667px; position: absolute;">23:00</div>
                                    <div style="text-align: center; left: 2978.42px; width: 90.1667px; position: absolute;">00:00</div>
                                    <div style="text-align: center; left: 3068.59px; width: 90.1667px; position: absolute;">01:00</div>
                                    <div style="text-align: center; left: 3158.76px; width: 90.1667px; position: absolute;">02:00</div>
                                </div>
                            </div>
                        </div>
                        <div class="rct-outer" style="height: 70px;">
                            <div class="rct-sidebar" style="width: 150px; height: 70px;">
                                <div style="width: 150px;">
                                    <div class="rct-sidebar-row rct-sidebar-row-even" style="height: 70px; line-height: 70px;">[안녕하세요]ㅂㅂㅂ</div>
                                </div>
                            </div>
                            <div class="rct-scroll" style="width: 1082px; height: 90px; cursor: default; position: relative;">
                                <div style="position: absolute; inset: 0px;">
                                    <div class="rct-vertical-lines">
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: -87.2432px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: 2.92348px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: 93.0901px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: 183.257px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: 273.423px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: 363.59px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: 453.757px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: 543.923px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: 634.09px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-4 " style="pointer-events: none; top: 0px; left: 724.257px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-vl-first rct-day-5 " style="pointer-events: none; top: 0px; left: 814.423px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 904.59px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 994.757px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1084.92px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1175.09px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1265.26px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1355.42px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1445.59px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1535.76px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1625.92px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1716.09px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1806.26px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1896.42px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 1986.59px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2076.76px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2166.92px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2257.09px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2347.26px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2437.42px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2527.59px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2617.76px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2707.92px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2798.09px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-5 " style="pointer-events: none; top: 0px; left: 2888.26px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-vl-first rct-day-6 " style="pointer-events: none; top: 0px; left: 2978.42px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-6 " style="pointer-events: none; top: 0px; left: 3068.59px; width: 90.1667px; height: 70px;"></div>
                                        <div class="rct-vl rct-day-6 " style="pointer-events: none; top: 0px; left: 3158.76px; width: 90.1667px; height: 70px;"></div>
                                    </div>
                                    <div class="rct-horizontal-lines">
                                        <div class="rct-hl-even " style="width: 3246px; height: 70px;"></div>
                                    </div>
                                    <div class="rct-items">
                                        <div title="123" class="rct-item " style="font-size: 12px; color: rgb(32, 114, 5); cursor: pointer; background: rgba(160, 239, 134, 0.6); border: 1px solid rgb(32, 114, 5); z-index: 80; border-radius: 4px; position: absolute; box-sizing: border-box; left: 1648.47px; top: 5px; width: 90.1667px; height: 30px; line-height: 30px;">
                                            <div style="overflow: hidden; padding-left: 3px; text-overflow: ellipsis; white-space: nowrap; height: 60px;"><b>123</b>
                                                <div>박성현</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sc-iwjdpV fwkUUr">
                        <div id="modal5" class="modal fade" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered   " role="document">
                                <div class="modal-content max-height-initial ">
                                    <div class="modal-body-header">
                                        <h4 class="h4">회의실 예약하기</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="material-icons">close</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="modal-body-content">
                                            <form>
                                                <div class="form-group"><span class="control-label">날짜</span>
                                                    <div class="position-relative">2022년 10월 21일</div>
                                                </div>
                                                <div class="form-group"><span class="control-label">회의시간</span>
                                                    <div class="position-relative"><input type="text" class="form-control number" title="내용 입력" placeholder="00" name="startHour" value="17"><span class="margin-hr-10">:</span><input type="text" class="form-control number" title="내용 입력" placeholder="00" name="startMin" value="15"><span class="margin-hr-10">-</span><input type="text" class="form-control number" title="내용 입력" placeholder="00" name="endHour" value="18"><span class="margin-hr-10">:</span><input type="text" class="form-control number" title="내용 입력" placeholder="00" name="endMin" value="15"></div>
                                                </div>
                                                <div class="form-group"><span class="control-label">제목</span>
                                                    <div class="position-relative"><input type="text" class="form-control" title="제목 입력" placeholder="제목 입력" name="selectedItem:title" value=""></div>
                                                </div>
                                                <div class="form-group"><span class="control-label">내용</span>
                                                    <div class="position-relative"><textarea class="form-control" rows="7" name="selectedItem:content"></textarea></div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="z-index: 100;"><button type="button" class="btn btn-link text-red">삭제</button><button type="button" class="btn btn-primary ">확인</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sc-iwjdpV fwkUUr">
                        <div id="modal5" class="modal fade" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered   " role="document">
                                <div class="modal-content  ">
                                    <div class="modal-body-header">
                                        <h4 class="h4">날짜를 선택해주세요.</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="material-icons">close</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group"><span class="control-label">날짜</span>
                                            <div class="position-relative"><input type="text" class="form-control input-datepicker" placeholder="날짜를 선택해주세요." readonly="" value=""></div>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="z-index: 100;"><button type="button" class="btn btn-primary ">확인</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>
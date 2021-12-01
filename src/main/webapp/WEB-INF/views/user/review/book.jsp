<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />


		<meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Script-Type" content="text/javascript">
        <meta http-equiv="Content-Style-Type" content="text/css">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <style>
/*         body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select{margin:0;padding:0} */
/*         body,input,textarea,select,button,table{font-family:'돋움',Dotum,AppleGothic,sans-serif;font-size:12px} */
        img,fieldset{border:0}
        ul,ol{list-style:none}
        em,address{font-style:normal}
        a{text-decoration:none}
        a:hover,a:active,a:focus{text-decoration:underline}
        .search_book {margin: 10px;}
        .result{ margin: 20px;}
        .srch{width:100%;padding:5px 0; margin: 0px 10px;}
        .srch legend{overflow:hidden;visibility:hidden;position:absolute;top:0;left:0;width:1px;height:1px;font-size:0;line-height:0}
        .srch{color:#c4c4c4;text-align:left}
        .srch select,.srch input{margin:-1px 0 1px;font-size:12px;color:#373737;vertical-align:middle}
        .srch .keyword{margin-left:1px;padding:2px 3px 5px;border:1px solid #b5b5b5;font-size:12px;line-height:15px}
        .tbl_type,.tbl_type th,.tbl_type td{border:0}
        .tbl_type{width:100%;border-bottom:2px solid #dcdcdc;font-family:Tahoma;font-size:11px;text-align:center;border-spacing:0;}
        .tbl_type caption{display:none}
        .tbl_type th{padding:7px 0 4px;border-top:2px solid #dcdcdc;background-color:#f5f7f9;color:#666;font-family:'돋움',dotum;font-size:12px;font-weight:bold}
        .tbl_type td{padding:6px 0 4px;border-top:1px solid #e5e5e5;color:#4c4c4c}
        </style>
        
        
        <div class="search_book">
        <fieldset class="srch">
                <legend>검색영역</legend>
                <input type="text" name="query" id="query" accesskey="s" title="검색어" class="keyword" />
                <input type="button" id="search" name="search" alt="검색" onclick="callAjax( $('#query').val() );" value="검색" />
        </fieldset>
        
        <table border="1" summary="책검색 API 결과" class="tbl_type">
        <caption>책검색 API 결과</caption>
                <colgroup>
                        <col width="10%">
                        <col width="20%">
                        <col width="15%">
                        <col width="15%">
                        <col width="15%">
                        <col width="10%">
                        <col width="15%">
                </colgroup>
                <thead>
                        <tr>
                        <th scope="col">책표지</th>
                        <th scope="col">책이름</th>
                        <th scope="col">저자</th>
                        <th scope="col">출판사</th>
                        <th scope="col">출판년도</th>
                        <th scope="col">가격</th>
                        <th scope="col">ISBN</th>
                        </tr>
                </thead>
                <tbody id="list">
                        <tr class="__oldlist" style="">
                                <td colspan="7">검색 결과가 없습니다.</td>
                        </tr>
                        <tr class="__template" style="display: none">
                                <td><img src="#image#"  width="50px" height="70px" /></td>
                                <td><a href="#link#" target="_blank">#title#</a></td>
                                <td>#author#</td>
                                <td>#publisher#</td>
                                <td>#pubdate#</td>
                                <td>#price#</td>
                                <td>#isbn#</td>
                        </tr>
                </tbody>
        </table>
        </div>



<script type="text/javascript">
//         $('#search').click( function() {
//                 if( $('#query').val() != '' ) {
//                 	callAjax($('#query').val());
//                 	$('#name').val("");
//                 } else if ( $('#query').val() == '') {
//             		alert('검색어를 입력해 주세요');
//             		$('#query').focus();
//                 }
//         });

        function callAjax(query) {
        	console.log("bbb")

			$.ajax({
                        url: "/searchBook",
                        dataType:'json',
                        type:'post',
                        data:{'query':query},
                        headers: { 'X-Naver-Client-Id': "qRxWO46cR3KnAJeibbcy", 'X-Naver-Client-Secret': "tkYW0s1NFR"},
                        success:function(result) {
//                         	console.log("-result-")
//                         	console.log(result.responseBody)
                        	
                        	var responseBody = JSON.parse(result.responseBody);
                        	
                                $('#result').html('');
                                
//                                 if(responseBody['channel']['display'] > 0){
//                                         $('.__oldlist').remove();
//                                         for(var i in responseBody['channel']['item']){
//                                                 var item = result['channel']['item'][i];
//                                                 $html = template('__template', item);
//                                                 $html.addClass('__oldlist');
//                                                 $('#list').append($html);
//                                                 $('.__oldlist').show();
//                                         }
                                if(responseBody['display'] > 0){
                                	
                                	$('.__oldlist').remove();
                                        for(var i=0; i<responseBody.display; i++){
                                                var item = responseBody['items'][i];
                                                $html = template('__template', item);
                                                $html.addClass('__oldlist');
                                                $('#list').append($html);
                                                $('.__oldlist').show();
                                        }
                                        
                                }else{
                                        $('#result').html('');
                                        $('#result').append("데이터가 없거나 정상적으로 로딩 되지 않았습니다.");
                                }
                        }
                });
        }

        function template(template_id, params){
                var c = $('.' + template_id).clone();
                var html = $('<div>').append(c).html();
                for(var key in params){
                        html = html.replace(new RegExp('#' + key + '#', 'g'), params[key]);
                }
                html = html.replace(/#template_([^#]*)#/g, '$1');
                var $html = $(html).removeClass(template_id).removeClass('__template');
                return $html;
        }
</script>




<c:import url="/WEB-INF/views/user/layout/footer.jsp" />
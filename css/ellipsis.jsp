<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>말줄임</title>
    <c:import url="/include/head.jsp" />
    <style>
        table td{text-align: center;}
        .ex1 a span{display: inline-block; width: calc(100% - 30px);
            overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
        .ex2 a{
            position: relative;
            display: -webkit-box;
            overflow: hidden;
            text-overflow: ellipsis;
            -webkit-box-orient: vertical;
            -webkit-line-clamp : 2;
        }
        .cut{display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
        .cut1{display: -webkit-box!important; -webkit-line-clamp:1; -webkit-box-orient: vertical; white-space: normal; word-break: break-all; overflow: hidden; text-overflow:ellipsis;}
        .cut2{display: -webkit-box!important; -webkit-line-clamp:2; -webkit-box-orient: vertical; white-space: normal; word-break: break-all; overflow: hidden; text-overflow:ellipsis;}

        /*!*cut*!
        .cut{
            display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
        &1{overflow: hidden; text-overflow: ellipsis;  white-space: normal; word-wrap: break-word; display: -webkit-box !important; -webkit-line-clamp: 1; -webkit-box-orient: vertical;}
        &2{overflow: hidden; text-overflow: ellipsis;  white-space: normal; word-wrap: break-word; display: -webkit-box !important; -webkit-line-clamp: 2; -webkit-box-orient: vertical;}
        }*/

    </style>
</head>
<body>
<main>
    <section class="section">
        <h1>white-space</h1>
        <article class="explanation">
            <ul>
                <li>
                    <span class="exp-typeA">스페이스/탭</span> (연속된 스페이스와 탭 처리)
                    <p> 병합 : 1개의 공백, 보존 : 입력 그대로 출력</p>
                </li>
                <li>
                    <span class="exp-typeA">줄바꿈</span>
                    <p>병합 :  1개의 공백, 보존 : 입력된 그대로 출력</p>
                </li>
                <li>
                    <span class="exp-typeA">자동 줄바꿈</span> (내용이 영역의 크기를 벗어날 때)
                    <p>'O' : 자동으로 줄바꿈하여 영역 내에 내용 표시 , 'X' : 영역을 벗어나더라도 입력된 대로 출력</p>
                </li>
            </ul>
        </article>
        <table class="tableTypeA" style="width: 1000px;">
            <thead>
            <tr>
                <th></th>
                <th>스페이스/탭</th>
                <th>줄바꿈</th>
                <th>자동 줄바꿈</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <th>normal</th>
                    <td>병합</td>
                    <td>병합</td>
                    <td>O</td>
                </tr>
                <tr>
                    <th>nowrap</th>
                    <td>병합</td>
                    <td>병합</td>
                    <td>x</td>
                </tr>
                <tr>
                    <th>pre</th>
                    <td>보존</td>
                    <td>보존</td>
                    <td>x</td>
                </tr>
                <tr>
                    <th>pre-wrap</th>
                    <td>보존</td>
                    <td>보존</td>
                    <td>O</td>
                </tr>
                <tr>
                    <th>pre-line</th>
                    <td>병합</td>
                    <td>보존</td>
                    <td>O</td>
                </tr>
            </tbody>
        </table>
    </section>
    <section class="section">
        <h1>ellipsis</h1>
        <article class="explanation ex1">
            <span class="exp-typeB">예제 1 (영역을 벗어나면 말줄임)</span>
            <a href=""><span>텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.</span>
                <img src="../static/images/ico_new.png" alt="New">
            </a>
        </article>
        <article class="explanation ex2">
            <span class="exp-typeB">예제 1 (최대 2줄 노출 )</span>
            <a href="">텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.</a>
            <br>
            <a href="">두 줄이 안 넘으면 전체가 다 노출 되어 보이지요😊</a>
        </article>
        <article class="explanation cutWrap">
            <p class="cut">텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.</p>
            <p class="cut1">텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.</p>
            <p class="cut cut1">텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.</p>
            <p class="cut cut2">텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.텍스트가 길어지면 자동으로 말줄임이 됩니다.</p>
        </article>
    </section>
</main>
</body>
</html>

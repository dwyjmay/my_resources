window.onload = function () {
    new ClipboardJS('.copy');
    const codeAreaList = document.querySelectorAll(".code");
    const htmlTextList = document.querySelectorAll(".view");
    for ( let i = 0; i < htmlTextList.length; i++ ) {
        codeAreaList[i].innerHTML += `<button class="copy" data-clipboard-target="#code`+i+`">COPY</button>`;
    }
    const textareaDOMList = document.querySelectorAll(".code textarea");
    for ( let i = 0; i < htmlTextList.length; i++ ) {
        textareaDOMList[i].value = htmlTextList[i].innerHTML;
        //console.log(textareaDOMList);
        textareaDOMList[i].id = "code"+i;
    }
}
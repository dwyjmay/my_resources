 gsap.registerPlugin(ScrollTrigger);
const demoVideo1 = document.getElementById('demo_Video1');
const demoVideo1Context = demoVideo1.getContext('2d'); //render a image inside our <canvas>

//캔버스의 너비와 높이 설정
demoVideo1.height = screen.height;
demoVideo1.width = screen.width;

//dognut 비디오에 관련된 정보를 불러온다.
const demoVideo1Info = {
    totalFrames : 440,
    totalTime : 7, //how long does it take
    images : [],
    currentFrame : 0,
    currentImage : (index)=>`./images/Dognut/Dognut${index.toString().padStart(3,0)}.jpg`
}

/*
    currentImage : (index)=>`./images/Dognut/Dognut${index}.jpg` 이렇게 받을 경우
    실제로 파일명 형식이 DognutXXX.jpg 이므로  숫자가 세자리이기 때문에 파일을 못찾는다.
    그래서
    ${idnex} 를 string 으로 형변환을 해준 다음에    → .toString()
    .padStart(몇자리 숫자로 지정할 것인지, 모자를 경우 어떤 것으로 채울것인지)를 이용한다!
    😘console.log(demoVideo1Info.currentImage(10));  확인
*/

 /* 단계별 접근 : easy */
 // const img = new Image();
 // img.src=demoVideo1Info.currentImage(440);
 // console.log(img.src)
 // img.onload=()=>demoVideo1Context.drawImage(img,0, 0);

 /* 단계별 접근 : normal */
 for(let i = 0; i<=demoVideo1Info.totalFrames; i++){
     const img = new Image();
     img.src=demoVideo1Info.currentImage(i);
     demoVideo1Info.images.push(img);
     //totalFrame 개수만큼 image 객체 생성 후  demoVideo1Info.images의 배열안에 push
 }
 //console.log(demoVideo1Info.images)

 gsap.to(demoVideo1Info,{
     currentFrame: demoVideo1Info.totalFrames,
     snap:"currentFrame",
     ease:"none",
     scrollTrigger:{
         trigger:demoVideo1,
         start: 'top',
         end:`bottom+=${demoVideo1Info.totalFrames*demoVideo1Info.totalTime}`,
         scrub:true,
         pin:true,
         markers:true
     },
     onUpdate:render,
 })

 demoVideo1Info.images[0].onload=()=>{
     demoVideo1Context.drawImage(
         demoVideo1Info.images[0],
         0,
         0)
 }

 function render(){
   console.log(demoVideo1Info.currentFrame)
     demoVideo1Context.drawImage(
         demoVideo1Info.images[demoVideo1Info.currentFrame],
         0,
         0)
 }


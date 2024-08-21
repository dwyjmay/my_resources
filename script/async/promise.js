/*
Promise is a javascript object for ASYNCHRONOUS operation
Promise 의 state : pending(수행 중), fulfilled(완료) rejected(실패)
Promise의 Producer vs Consumer
*/

//1.Producer(생성자)

const promise = new Promise((resolve,reject)=>{
    //doing some heavy work.
    console.log('doing something')
    setTimeout(()=>{
        //경우1⭐
        //resolve('ellie') // some heavy work 가 성공적으로 이루어져 resolve 콜백함수를 부르고, 값을 'ellie'를 넘겨준다.

        //경우2⭐
        reject(new Error('no network')) // 실패했을 경우 reject 콜백함수를 부름.
        /*  Uncaught(발생한 error에 대해 핸들링 작업이 필요함) (in promise) Error: no network   */
    },2000)
})

/* 새로운 프로미스가 생성될 때 , executer 가 바로 실행된다.(doing something이 바로 출력된다)
    👉🏻사용자가 요구하지 않았는데도 실행되는 격이기 때문에 .. 이 점을 유의해야한다.
*/

//2.Consumer (then, catch, finally)
promise.then((value)=>{ //promise 실행이 잘 되었을 때 ...  resolve로 전달된 'ellie'라는 값이 value 파라미터가 됨.
    console.log(value)
}).catch(err=>console.log(err)) //promise의 then을 호출하면,  똑같은 promise를 리턴 , 리턴된 promise의 catch를 다시 ㅎ ㅗ출함
    .finally(()=>console.log('finally'))



//3. Promise Chaining
const fetchNumber = new Promise((resolve,reject)=>{
    setTimeout(()=>resolve(1),1000)
})

fetchNumber.then(num=>num*2) // 2    (...1초 후 결과 반환)
    .then(num=>num*3) //6
    .then(num=>{
        return new Promise(resolve=>{
            setTimeout(()=>{resolve(num-1)},1000) //5 (...1초 후 결과 반환)
        })
    })
    .then(num=>console.log(num))

//총 소요시간 2초

//4.오류 처리

const getHen = ()=> new Promise((resolve,reject)=>{
    const inputValue = prompt('값을 입력하세요')
    if(inputValue === '🐔'){
        resolve(inputValue)
    }
})

getHen().then(console.log)
    .catch(console.log)





//4.오류 처리

const getHen = ()=> new Promise((resolve,reject)=>{
    const inputValue = prompt('값을 입력하세요')
    if(inputValue === '🐔'){
        resolve(inputValue)
    } else{
        reject(new Error('input wrong'))
    }
})

const getEgg = (hen)=>new Promise((resolve, reject) => {
    if(hen==='🐔'){
        resolve(` ${hen} => 🥚`)
    } else{
        reject(new Error (`error🚨 : input is ${hen}`))
    }
})

getHen().then(console.log)
    .catch(err=>{return '🍞'})
    .then(getEgg())



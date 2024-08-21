/*
function printImmediately(print){
    print();
}

printImmediately(()=>console.log('hello'));

function printWithDelay(print,timeout){
    setTimeout(print,timeout)
}

printWithDelay(()=>console.log('async callback'),1000)*/

class UserStorage{
    loginUser(id,password,onSuccess,onError){
        setTimeout(()=>{
            if(
                (id==='ellie' && password==='dream') ||
                (id==='coder' && password === 'academy')
            ){
                onSuccess(id);
            } else{
                onError(new Error('not found'))
            }
        },2000)
    }

    getRoles(user,onSuccess,onError){
        setTimeout(()=>{
            if(user==='ellie'){
                onSuccess({name:'ellie',role:'admin'})
            }else{
                onError(new Error('no access'))
            }
        },1000)
    }
}

const userStorage = new UserStorage()
const id = prompt('enter your id');
const password = prompt('enter your password');
userStorage.loginUser(id,password,(id)=>{
    userStorage.getRoles(id,
                (result)=>{alert(`hello ${result.name}, you have a ${result.role} role :) `)},
                (error)=>{console.log(error)}
    ) },
    (error)=>{console.log(error)}
)


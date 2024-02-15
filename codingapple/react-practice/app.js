/* eslint-disable */
/* 위의 코드는 warning 메시지를 없애준당 */

import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
import * as React from 'react'

function App() {
    let [title, myTitle] = useState(['남자 코트 추천','강남우동 맛집','파이썬 독학']);
    let [logo, setLogo] = useState('React blog');
    let [goood, addFunc] = useState([0,2,4]);
    // 동적 ui를 만드는 2단계
    const [modal,setModal] = useState(false); // 0 과 1 로 구분해도 되고, true false, hide show 다 가능
    const[num, setNum]=useState(2);

    //인풋값 저장을 위한 state 생성 (변수도될듯 ...)
    const [inputVal,setInput]=useState('')

    return (
        <div className="App">
            <div className='black-nav'>
                <h4 style={{ color: 'cornflowerblue', fontSize: '32px' }}>{logo}</h4>
            </div>
            <button onClick={()=>{
                let copy = [...title.sort()];
                myTitle(copy);
            }}>가나다 순으로 정렬하는 버튼</button>

            <button onClick={()=>{
                let copy = [...title];
                copy[0]='하늘색 코트 추천';
                myTitle(copy)
            }}>제목 변경하기버튼 </button>
            {

                title.map(function(a,i){// a = array의 데이터!!, i는 반복문 돌때마다 0부터 1씩 증가하는 정수
                    return(
                        <div className='list' key={i}>  {/* 반복문으로 html을 생성하면 key=html 마다 다른 숫자 추가해줘야 함..! */}
                            <h4 onClick={() => {setModal(!modal); setNum(i)}}>{a} <span onClick={(e) =>{
                                let data = [...goood]
                                data[i] = data[i]+1
                                addFunc(data);
                                e.stopPropagation();
                            } }>👍</span>{goood[i]}</h4>
                            <p>2월 17일 발행</p>
                            <button onClick={()=>{
                                title.splice(i,1); //(a,b) 내가 삭제하고자 하는 a번째 항목 으로부터 b개 삭제
                                goood.splice(i,1);
                                let arr = [...title];
                                let arr2 = [...goood];
                                myTitle(arr);
                                addFunc(arr2);
                            }}>삭제</button>
                        </div>
                    )
                })
            }

            {/* <input></input> 리액트에서는 반드시 태그를 하나 열었으면 닫아야하고 아니면 <input />
        <input onChange={()=>{}}    인풋에 뭔가 입력했을 때 코드를 실행하고 싶다면 사용 (onInput도 비슷)
        ex) <input onChange={(e)=>{console.log(e.target.value) e.stopPropagation();}}/>

        (e) => {e.stopPropagation(); }  을 적어줘야 상위요소로 퍼지는 이벤트버블링이 막아진다!

        여러가지 이벤트 핸들러
        onMouseOver={}, onScroll={해당 요소의 스크롤바를 조정할 때마다 동작함.}
     */}
            {/* input에 입력한 값 저장하기 보통 state로 */}
            <input onChange={(e)=>{setInput(e.target.value); console.log(inputVal)}}/>
            <button onClick={()=>{
                title.unshift(inputVal);
                goood.unshift(8);
                let arr = [...title]
                let arr2 = [...goood]
                myTitle(arr);
                addFunc(arr2);
            }}>글 발행 버튼</button>
            {/*
    위의 코드를 실행해보면 알겠지만 처음 입력에는 값이 들어오지 않을것이다. (state변경 함수는 좀 늦게처리됨. :: 비동기처리)
      setInput()이 완료되기 전에 console.log를 실행해주는 ..

      숙제 ::
      버튼누르면 글 하나 (위에)추가되는 기능 만들기
      1.html 직접 만드는게아님
      1.array에 자료추가하는 방법 활용

      글마다 삭제버튼을 만들어주기.
      삭제버튼 클릭 시  해당 글이 삭제되는 기능 만들기
      1. state 조작하면 됨

    */}
            <Modal3></Modal3>

            {modal == true?  <Modal bgColor={'cornflowerblue'} title={title} myTitle={myTitle} num={num}/> : null}
        </div>
    );
}
{/* 동적 UI 만드는 단계
      1. HTML, CSS 로 미리 디자인 완성
      2. UI 현재 상태를 state로 저장
      3. state에 따라 UI 가 어떻게 보일지 작성
      */}

// 동적 ui를 만드는 1단계
function Modal(props){
    /* 부모에 let [num, setNum]을 써서  props를 활용해도 되고 애초에 state를 자식에 만들어도 된다.  하지만 state만드는 곳은 state를 사용하는 컴포넌트 중
    최상위의 컴포넌트에다 만드는것이 맞음
    const [num,setNum] = useState(0);
    */
    return(
        <div className="modal" style={{background:props.bgColor}}>
            <h4>{props.title[props.num]}</h4>  {/* 이곳에 내가 누른 것의 제목만 보여주려면  */}
            <p>날짜</p>
            <p>상세내용</p>
            <button onClick={()=>{
                let copyItem = [...props.title];
                copyItem[0]='여자코트추천';
                props.myTitle(copyItem)
            }}>글수정</button>
        </div>
    )
}

{/* 문법2 */}
const Modal2 = () => { //const로 만드는 이점  ? 후에 수정을 막아줌.
    return(
        <div></div>
    )
}

/* !!!!!!!!!! class 컴포넌트 만들어보기 (옛날) */

class Modal3 extends React.Component{
    constructor(props){ //class컴포넌트에서 props
        super(props);//class컴포넌트에서 props     => this.props 로 가져다 써야할것!!
        this.state = { //state를 만드는 방법
            name : 'kim',
            age : 20
        }
    }
    render(){
        return(
            <div>안녕하세요{this.state.age}
                <button onClick={()=>{
                    this.setState({age : 21})  //state를 변경하는 방법    :: 차이점만 분석해서 바뀌는것..이랄까...
                }}>버튼생성</button>
            </div> //state를 갖다 쓰는방법
        )
    }
}
export default App;
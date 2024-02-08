// import React from 'react'
// import { useState } from 'react'
// import { addQuestionAction } from '../../Feutures/Actions/actionQuiz';
// import { useDispatch } from 'react-redux'

// import galka from '../../image/icon300pn.png'
// import cross from '../../image/cross13.png'

// const CarouselForm = ({props}) => {
//     const dispatch = useDispatch()
//     const [quiz, setQuiz] = useState(props)
//     console.log(props);
//     // const [index, setIndex] = useState(quiz.question.length - 1)
//     const [index, setIndex] = useState(1)

//     const handleSubmit = (selectedIndex) => {
//         setIndex(selectedIndex)
//     }
//     const addAnswer = (e, item) => {
//         e.preventDefault()
//         item.answer.push({
//             title: "",
//             right: false
//         })
//         dispatch(addQuestionAction(quiz))
//     }
//     const cheackAnswer = (item) => {
//         item.right === true ?
//             item.right = false :
//             item.right = true
//         dispatch(addQuestionAction(quiz))
//     }
//     const removeAnswer = (e, item, ansItem) => {
//         e.preventDefault()
//         const index = item.answer.indexOf(ansItem)
//         delete item.answer[index]
//         item.answer = item.answer.filter(element => element !== null)
//         dispatch(addQuestionAction(quiz))
//     }
//     const addQuestion = (e) => {
//         e.preventDefault()
//         quiz.question.push({
//             title: "",
//             answer: []
//         }
//         )
//         setIndex(quiz.question.length - 1)
//         dispatch(addQuestionAction(quiz))
//     }
//     const removeQuestion = (e, item) => {
//         e.preventDefault()
//         if (quiz.question.length < 2) {
//             return alert("опрос должен содержать минимум 1 опрос")
//         }
//         const index = quiz.question.indexOf(item)
//         delete quiz.question[index]
//         quiz.question = quiz.question.filter(item => item !== null)
//         setIndex(quiz.question.length - 1)
//         dispatch(addQuestionAction(quiz))

//     }
//     const addImage = (e) => {
//         console.log(e.target.files[0]);
//         const formData = new FormData();
//         formData.append('image', e.target.files[0])
//         quiz.image = formData
//         dispatch(addQuestionAction(quiz))
//     }

//     return (
//         <>
//         <Carousel className='slederXXXTENTACION' activeIndex={index} onSelect={handleSubmit} interval={null}>
//             {quiz.question.map((item) => (
//                 <Carousel.Item className=''>
//                     <div className="d-flex justify-content-center align-items-center content-in-slide">
//                         <div className="col-4 d-flex flex-column mx-5 in-slide-form-xxxtentacion">
//                             <input onChange={(e) => (item.title = e.target.value)} type="text" placeholder='Введите вопрос'></input>
//                             <button onClick={(e) => (addAnswer(e, item))}>Добавить ответ</button>
//                             <button onClick={(e) => (removeQuestion(e, item))}>Удалить вопрос</button>
//                         </div>
//                         <div className="col-4 d-flex flex-column">
//                             {item.answer.map((ansItem) => (
//                                 ansItem.right === true ?
//                                     <div className="d-flex in-slide-form-lilpump active">
//                                         <div className="check-answer-icon active" onClick={() => (cheackAnswer(ansItem))}><img src={galka} height="30px" alt="" /></div>
//                                         <input onChange={(e) => (ansItem.title = e.target.value)} type="text" placeholder='Введите описание'></input>
//                                         <div className="del-answer-icon">
//                                             <img onClick={(e) => (removeAnswer(e, item, ansItem))} src={cross} height="30px" alt="" />
//                                         </div>
//                                     </div>
//                                     :
//                                     <div className="d-flex in-slide-form-lilpump">
//                                         <div className="check-answer-icon" onClick={() => (cheackAnswer(ansItem))}><img src={galka} height="30px" alt="" /></div>
//                                         <input onChange={(e) => (ansItem.title = e.target.value)} type="text" placeholder='Введите описание'></input>
//                                         <div className="del-answer-icon">
//                                             <img onClick={(e) => (removeAnswer(e, item, ansItem))} src={cross} height="30px" alt="" />
//                                         </div>
//                                     </div>
//                             ))}
//                         </div>
//                     </div>
//                 </Carousel.Item>
//             ))}
//         </Carousel>
//         <div className="buttons-group col-4">
//             <button onClick={addQuestion}>Добавить вопрос</button>
//         </div>
//         </>
//     )
// }

// export default CarouselForm
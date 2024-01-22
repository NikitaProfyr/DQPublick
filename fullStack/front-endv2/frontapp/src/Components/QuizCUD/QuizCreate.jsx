import React from 'react'
import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux'
import Carousel from 'react-bootstrap/Carousel';

import galka from '../../image/icon300pn.png'
import cross from '../../image/cross13.png'
import { ROUTES } from '../../utils/routes'

import './quiz-cud.css'

import { addQuestionAction } from '../../Feutures/Actions/actionQuiz';
import { QuizService } from '../../Services/QuizService';
import { useNavigate } from 'react-router-dom';


const QuizCreate = () => {
  const dispatch = useDispatch()
  const user = useSelector(state => state.reducerUser.userInfo)
  const quiz = useSelector(state => state.reducerQuiz.createQuiz)
  const navigate = useNavigate()
  const [index, setIndex] = useState(quiz.question.length - 1)

  const handleSubmit = (selectedIndex) => {
    setIndex(selectedIndex)
  }
  const addAnswer = (e, item) => {
    e.preventDefault()
    if(item.answer.length < 6){
      item.answer.push({
        id: "1",
        title: "",
        right: false
      })
      dispatch(addQuestionAction(quiz))
    }
    else{
      alert('В одном вопросе может быть не более 6 вариантов ответа')
    }
  }
  const cheackAnswer = (item) => {
    item.right === true ?
      item.right = false :
      item.right = true
    dispatch(addQuestionAction(quiz))
  }
  const removeAnswer = (e, item, ansItem) => {
    e.preventDefault()
    console.log(item.answer.length);
    if(item.answer.length > 2){
      const index = item.answer.indexOf(ansItem)
      delete item.answer[index]
      item.answer = item.answer.filter(element => element !== null)
      dispatch(addQuestionAction(quiz))
    }
    else{
      alert('В одном вопросе должно быть 2 и более вариантов ответа')
    }
  }
  const addQuestion = (e) => {
    e.preventDefault()
    quiz.question.push({
      id: "1",
      title: "",
      answer: [{
        id: "1",
        title: "",
        right: false
      },{
        id: "1",
        title: "",
        right: true
    }]
    }
    )
    setIndex(quiz.question.length - 1)
    dispatch(addQuestionAction(quiz))
  }
  const removeQuestion = (e, item) => {
    e.preventDefault()
    if (quiz.question.length < 2) {
      return alert("опрос должен содержать минимум 1 опрос")
    }
    const index = quiz.question.indexOf(item)
    delete quiz.question[index]
    quiz.question = quiz.question.filter(item => item !== null)
    setIndex(quiz.question.length - 1)
    dispatch(addQuestionAction(quiz))

  }
  const addImage = (e) => {

    console.log(e.target.files[0]);
    const formData = new FormData();
    formData.append('image', e.target.files[0])
    // quiz.image = formData.get('file')
    quiz.image = formData
    // console.log(formData.get('file'));
    // console.log(quiz.image);
    dispatch(addQuestionAction(quiz))
    // console.log(quiz);
  }
  const addQuiz = async (e) => {
    e.preventDefault()

    console.log(quiz)
    quiz.image = await QuizService.createImageQuiz(quiz.image)
    dispatch(addQuestionAction(quiz))
    QuizService.createQuiz(quiz).catch((error) => {
      alert(error)
    });
    return navigate(ROUTES.QUIZ_USER)
  }
  return (
    <div className="bg-create-quiz d-flex justify-content-center align-items-center">
      <div className="container content-cud">
        <form onSubmit={(e) => (addQuiz(e))} className='d-flex flex-column justify-content-center align-items-center forms-content-cud'>
          <div className="d-flex col-8 col-lg-4 flex-column form-create-quiz">
            <input className='rounded' type="text" onChange={(e) => (quiz.title = e.target.value)} placeholder='Введите название опроса' />
            <input className='rounded' type="text" onChange={(e) => (quiz.description = e.target.value)} placeholder='Введите описание' />
            <label htmlFor="myfile" className="label">Выберите файл</label>
            <input type="file" onChange={addImage} className="my" id="myfile" name="myfile" accept="image/*"></input>
          </div>

          <Carousel className='slederXXXTENTACION' activeIndex={index} onSelect={handleSubmit} interval={null}>
            {quiz.question.map((item, index) => (
              <Carousel.Item key={index} className=''>
                <div className="row d-flex justify-content-center align-items-center content-in-slide">
                  <div className="col-8 col-lg-4 d-flex mx-3 flex-column in-slide-form-xxxtentacion">
                    <input className='rounded' onChange={(e) => (item.title = e.target.value)} type="text" placeholder='Введите вопрос'></input>
                    <button className='rounded' onClick={(e) => (addAnswer(e, item))}>Добавить ответ</button>
                    <button className='rounded' onClick={(e) => (removeQuestion(e, item))}>Удалить вопрос</button>
                  </div>
                  <div className="col-8 col-lg-4 mx-3 d-flex flex-column">
                    {item.answer.map((ansItem, index) => (
                      ansItem.right === true ?
                        <div className="d-flex in-slide-form-lilpump active rounded" key={index}>
                          <div className="check-answer-icon active" onClick={() => (cheackAnswer(ansItem))}><img src={galka} height="30px" alt="" /></div>
                          <input className='rounded' onChange={(e) => (ansItem.title = e.target.value)} type="text" placeholder='Введите описание'></input>
                          <div className="del-answer-icon">
                            <img onClick={(e) => (removeAnswer(e, item, ansItem))} src={cross} height="30px" alt="" />
                          </div>
                        </div>
                        :
                        <div className="d-flex in-slide-form-lilpump rounded" key={index}>
                          <div className="check-answer-icon" onClick={() => (cheackAnswer(ansItem))}><img src={galka} height="30px" alt="" /></div>
                          <input className='rounded' onChange={(e) => (ansItem.title = e.target.value)} type="text" placeholder='Введите описание'></input>
                          <div className="del-answer-icon">
                            <img onClick={(e) => (removeAnswer(e, item, ansItem))} src={cross} height="30px" alt="" />
                          </div>
                        </div>
                    ))}
                  </div>
                </div>
              </Carousel.Item>
            ))}
          </Carousel>
          <div className="buttons-group col-8 col-lg-4">
            <button className='rounded' onClick={addQuestion}>Добавить вопрос</button>
            <button className='rounded' type='submit'>Создать опрос</button>
          </div>

        </form>
      </div>
    </div>
  )
}

export default QuizCreate
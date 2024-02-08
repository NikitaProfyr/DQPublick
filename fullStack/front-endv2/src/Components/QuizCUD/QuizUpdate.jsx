import React from 'react'
import { useEffect } from 'react'
import { useState } from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { useNavigate, useParams } from 'react-router-dom'
import { getCurrentQuiz, updateQuestionAction } from '../../Feutures/Actions/actionQuiz'

import { Spinner } from 'react-bootstrap'

import { QuizService } from '../../Services/QuizService';
import Carousel from 'react-bootstrap/Carousel';
import galka from '../../image/icon300pn.png'
import cross from '../../image/cross13.png'
import './quiz-cud.css'
import { ROUTES } from '../../utils/routes'

const QuizUpdate = () => {
  const [isLoading, setIsLoading] = useState(true)
  const quiz = useSelector(state => state.reducerQuiz.currentQuiz)
  const param = useParams()
  const dispatch = useDispatch()
  const navigate = useNavigate()
  const user = useSelector(state => state.reducerUser.userInfo)
  const [index, setIndex] = useState(quiz.question.length - 1)
  const [upgradeImg, setUpgradeImg] = useState(false)
  const formData = new FormData()

  useEffect(() => {
    getCurrentQuiz(param.id, dispatch)
  }, [])

  useEffect(() => {
    setIsLoading(false)
  }, [quiz])

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
      dispatch(updateQuestionAction(quiz))
    }
    else{
      alert('В одном вопросе может быть не более 6 вариантов ответа')
    }
  }
  const cheackAnswer = (item) => {
    item.right === true ?
      item.right = false :
      item.right = true
    dispatch(updateQuestionAction(quiz))
  }
  const removeAnswer = (e, item, ansItem) => {
    e.preventDefault()
    if (item.answer.length > 2) {
      const index = item.answer.indexOf(ansItem)
      delete item.answer[index]
      item.answer = item.answer.filter(element => element !== null)
      dispatch(updateQuestionAction(quiz))
    }
    else {
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
      }, {
        id: "1",
        title: "",
        right: true
      }]
    }
    )
    setIndex(quiz.question.length - 1)
    dispatch(updateQuestionAction(quiz))
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
    dispatch(updateQuestionAction(quiz))

  }
  const addImage = async (e) => {
    // formData.append('image', e.target.files[0])
    quiz.image = e.target.files[0]
    setUpgradeImg(true)
    console.log(quiz.image);
    dispatch(updateQuestionAction(quiz))
  }
  const removeQuiz = async (e) => {
    e.preventDefault()
    await QuizService.delQuiz(quiz.id)
    return navigate(ROUTES.QUIZ_USER)
  }
  const updateQuiz = async (e) => {
    e.preventDefault()
    console.log(quiz)
    formData.append('quiz_id', quiz.id)
    formData.append('image', quiz.image)
    // console.log(formData.get('image'));
    console.log(quiz);
    if (upgradeImg === true) {
      quiz.image = await QuizService.updateImage(formData)
      dispatch(updateQuestionAction(quiz))
    }
    await QuizService.updateCurrentQuiz(quiz).catch((error) => {
      alert(error)
    })
    return navigate(ROUTES.QUIZ_USER)
  }

  return (
    <div className="bg-create-quiz d-flex justify-content-center align-items-center">
      <div className="container content-cud">
        {isLoading === true ? <><Spinner></Spinner></> :
          <form onSubmit={(e) => (updateQuiz(e))} className='d-flex flex-column justify-content-center align-items-center forms-content-cud'>
            <div className="d-flex col-8 col-lg-4 flex-column form-create-quiz">
              <input className='rounded' type="text" defaultValue={quiz.title} onChange={(e) => (quiz.title = e.target.value)} placeholder='Введите название опроса' />
              <input className='rounded' type="text" defaultValue={quiz.description} onChange={(e) => (quiz.description = e.target.value)} placeholder='Введите описание' />
              <label htmlFor="myfile" className="label">Выберите файл</label>
              <input type="file" onChange={addImage} className="my" id="myfile" name="myfile" accept="image/*"></input>
            </div>

            <Carousel className='slederXXXTENTACION' activeIndex={index} onSelect={handleSubmit} interval={null}>
              {quiz.question.map((item, index) => (
                <Carousel.Item key={index} className=''>
                  <div className="row d-flex justify-content-center align-items-center content-in-slide">
                    <div className="col-8 col-lg-4 d-flex mx-3 flex-column in-slide-form-xxxtentacion">
                      <input className='rounded' defaultValue={item.title} onChange={(e) => (item.title = e.target.value)} type="text" placeholder='Введите вопрос'></input>
                      <button className='rounded' onClick={(e) => (addAnswer(e, item))}>Добавить ответ</button>
                      <button className='rounded' onClick={(e) => (removeQuestion(e, item))}>Удалить вопрос</button>
                    </div>
                    <div className="col-8 col-lg-4 mx-3 d-flex flex-column">
                      {item.answer.map((ansItem) => (
                        ansItem.right === true ?
                          <div className="d-flex in-slide-form-lilpump active rounded">
                            <div className="check-answer-icon active" onClick={() => (cheackAnswer(ansItem))}><img src={galka} height="30px" alt="" /></div>
                            <input className='rounded' defaultValue={ansItem.title} onChange={(e) => (ansItem.title = e.target.value)} type="text" placeholder='Введите описание'></input>
                            <div className="del-answer-icon">
                              <img onClick={(e) => (removeAnswer(e, item, ansItem))} src={cross} height="30px" alt="" />
                            </div>
                          </div>
                          :
                          <div className="d-flex in-slide-form-lilpump rounded">
                            <div className="check-answer-icon" onClick={() => (cheackAnswer(ansItem))}><img src={galka} height="30px" alt="" /></div>
                            <input className='rounded' defaultValue={ansItem.title} onChange={(e) => (ansItem.title = e.target.value)} type="text" placeholder='Введите описание'></input>
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
              <button className='rounded' onClick={removeQuiz} >Удалить опрос</button>
              <button className='rounded' type='submit'>Сохранить</button>
            </div>

          </form>
        }
        {/* <CarouselForm props={quiz}/> */}
      </div>
    </div>
  )
}

export default QuizUpdate
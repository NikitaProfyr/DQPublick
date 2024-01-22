import React from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { Spinner } from 'react-bootstrap'

import './quiz-detail.css'
import { useEffect, useState } from 'react'

import { Link, useParams } from 'react-router-dom'
import { getCurrentQuiz } from '../../Feutures/Actions/actionQuiz'
import { ROUTES } from '../../utils/routes'
import { ApiUrl } from '../../Http'

const QuizDetail = () => {
  const [isLoading, setIsLoading] = useState(true)
  const quiz = useSelector(state => state.reducerQuiz.currentQuiz)
  const param = useParams()
  const dispatch = useDispatch()

  useEffect(() => {
    getCurrentQuiz(param.id, dispatch)
  }, [dispatch, param.id])

  useEffect(() => {
    setIsLoading(false)
  }, [quiz])

  console.log(quiz);

  return (
    <div className="bg-quiz-detail d-flex align-items-center">

      <div className='container'>
        {isLoading ?
          <Spinner></Spinner>
          :
          <>
            <div className="row d-flex align-items-center">
              <div className="left-content my-5 col-lg-6 col-md-12 col-12">
                <h3>{quiz.title}</h3>
                <h4>{quiz.description}</h4>
                <h4>Количество вопросов: quiz.question.length</h4>
              </div>
              <div className="right-content my-5 col-lg-6 col-md-12 col-12">
                <div className="img-block">
                  <img className='rounded' src={ApiUrl + "/quiz-public/image/" + quiz.image} width="100%" alt="" />
                  <Link className='text-decoration-none' to={ROUTES.QUIZ_GAME + `/${quiz.id}`}> <button className='d-block w-100 quizButton'>Пройти опрос</button> </Link>
                </div>
              </div>
            </div>
          </>
        }

      </div>

    </div>
  )
}

export default QuizDetail
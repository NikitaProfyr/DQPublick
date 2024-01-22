import React from 'react'
import { ListGroup, Spinner, Tab } from 'react-bootstrap'
import { ROUTES } from '../../utils/routes'
import { useDispatch, useSelector } from 'react-redux'

import './quiz-user.css'
import { useEffect } from 'react'
import { getQuizResultAction, getUserQuiz, setBaseCurrentQuiz } from '../../Feutures/Actions/actionQuiz'
import { useState } from 'react'
import CurrentQuizUser from '../CurrentQuiz/CurrentQuizUser'
import CurrentQuizResult from '../CurrentQuiz/CurrentQuizResult'




const QuizUser = () => {
  const user = useSelector(state => state.reducerUser.userInfo)
  const quiz = useSelector(state => state.reducerQuiz.quizUser)
  const quizResults = useSelector(state => state.reducerQuiz.quizResults)
  const [isLoading, setIsLoading] = useState(true)

  const dispatch = useDispatch()

  useEffect(() => {
    dispatch(setBaseCurrentQuiz())
    getUserQuiz(dispatch, 1, 6)
  }, [])
  useEffect(() => {
    getQuizResultAction(dispatch, 1, 6)
  }, [])

  useEffect(() => {
    if (quiz.items !== undefined && quizResults.items !== undefined) {
      setIsLoading(false)
    }
  }, [quiz, quizResults])

  const onClickPagination = (page) => {
    getUserQuiz(dispatch, page, 6)
  }
  const onClickPaginationQuizResult = (page) => {
    getQuizResultAction(dispatch, page, 6)
  }

  return (
    <div className="bg-quiz-user">
      <div className="container py-4">
        <Tab.Container id="list-group-tabs-example" defaultActiveKey="#user-quiz">
          <div className="row">
            <div className="col-lg-3 col-12 mb-4">

              <ListGroup className="list" style={{ cursor: "pointer", }}>
                <ListGroup.Item action href="#user-quiz">Мои опросы</ListGroup.Item>
                <ListGroup.Item action href="#result-quiz">Пройденные опросы</ListGroup.Item>
                <ListGroup.Item action href={ROUTES.QUIZ_CREATE}>Создать опрос</ListGroup.Item>
              </ListGroup>
            </div>
            <div className="col-lg-9 col-12">
              <Tab.Content>
                <Tab.Pane eventKey="#user-quiz">
                  <div className="row">
                    {quiz.items === undefined ?
                      <div className='col-12 none-quiz'>Опросов нет</div>
                      :
                      <>
                        {isLoading ?
                          <div><Spinner></Spinner></div>
                          :
                          <>
                            {quiz.items.map((item, index) => (
                              <div key={index} className='col-md-6 col-xl-4 col-12 mb-4'>
                                <CurrentQuizUser key={item.id} props={item}></CurrentQuizUser>
                              </div>
                            ))}
                          </>
                        }
                      </>
                    }
                  </div>
                  <div className="d-flex justify-content-center align-items-center">
                    {quiz.pages !== 1 ?
                      Array.from({ length: quiz.pages }, (_, index) => (
                        <>{quiz.page === index + 1 ?
                          <div
                            onClick={() => (onClickPagination(index + 1))}
                            key={index}
                            className="pagination-item active mx-2"
                          >
                            {index + 1}
                          </div>
                          :
                          <div
                            onClick={() => (onClickPagination(index + 1))}
                            key={index}
                            className="pagination-item mx-2"
                          >
                            {index + 1}
                          </div>
                        }</>

                      ))
                      :
                      <></>
                    }
                  </div>
                </Tab.Pane>
                <Tab.Pane eventKey="#result-quiz">
                  <div className="row">
                    {quizResults === undefined ?
                      <div className='col-12'>нет пройденных опросов</div>
                      :
                      <>
                        {isLoading ?
                          <div><Spinner></Spinner></div>
                          :
                          <>{quizResults.items.map((item, index) => (
                            <div key={index} className='col-md-6 col-xl-4 col-12 mb-4'>
                              <CurrentQuizResult key={item.id} props={item}></CurrentQuizResult>
                            </div>
                          ))}</>
                        }
                      </>
                    }
                  </div>
                  <div className="d-flex justify-content-center align-items-center">
                    {quizResults.pages !== 1 ?
                      Array.from({ length: quizResults.pages }, (_, index) => (
                        <>{quizResults.page === index + 1 ?
                          <div
                            onClick={() => (onClickPaginationQuizResult(index + 1))}
                            key={index}
                            className="pagination-item active mx-2"
                          >
                            {index + 1}
                          </div>
                          :
                          <div
                            onClick={() => (onClickPaginationQuizResult(index + 1))}
                            key={index}
                            className="pagination-item mx-2"
                          >
                            {index + 1}
                          </div>
                        }</>

                      ))
                      :
                      <></>
                    }
                  </div>
                </Tab.Pane>
              </Tab.Content>
            </div>
          </div>
        </Tab.Container>
      </div>
    </div>
  )
}

export default QuizUser
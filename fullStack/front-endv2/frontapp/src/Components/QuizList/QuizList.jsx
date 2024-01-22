import React from 'react'
import { useEffect } from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { getQuizAction } from '../../Feutures/Actions/actionQuiz'

import './quiz-list.css'

import CurrentQuiz from '../CurrentQuiz/CurrentQuiz'
import { useState } from 'react'
import { Spinner } from 'react-bootstrap'


const QuizList = () => {
  const [isLoading, setIsLoading] = useState(true)
  const [fetching, setFetching] = useState(true)
  const [currentPage, setCurrentPage] = useState(1)
  const [totalPage, setTotalPage] = useState(1)
  const quiz = useSelector(state => state.reducerQuiz.quiz)
  const dispatch = useDispatch()
   

  useEffect(() => {
    if(quiz !== undefined){
      setIsLoading(false)
      setTotalPage(quiz.pages)
    }
  }, [quiz])

  useEffect(() => {
    if(fetching && currentPage <= totalPage){
      getQuizAction(dispatch, currentPage, 8)
      setFetching(false)
      setCurrentPage(currentPage + 1)
    }
  }, [fetching])

  useEffect(() => {
    document.addEventListener('scroll', scrollHandler)
    return function () {
      document.removeEventListener('scroll', scrollHandler)
    }
  },[])

  const scrollHandler = (e) =>{
    if((e.target.documentElement.scrollHeight - (e.target.documentElement.scrollTop + window.innerHeight)) < 10){
      setFetching(true)
    }
  }

  return (
    <>
    <div className="bg-quiz-list overflow-hidden">
        <div className="container">
          <div className='row py-4'>
            {isLoading === false ?
              quiz.items.map((item, index) => (
                <div key={index} className='col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4'>
                  <CurrentQuiz key={item.id} props={item} />
                </div>)
              )
              :
              <Spinner/>
            }
          </div>
        </div>
      </div>  
    </>
  )
}

export default QuizList
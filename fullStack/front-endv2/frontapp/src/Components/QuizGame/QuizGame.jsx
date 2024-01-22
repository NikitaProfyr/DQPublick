import React from 'react'
import { useEffect } from 'react'
import { useState } from 'react'
import { Spinner } from 'react-bootstrap'
import { useDispatch, useSelector } from 'react-redux'
import { useNavigate, useParams } from 'react-router-dom'
import { getCurrentQuiz } from '../../Feutures/Actions/actionQuiz'
import './quiz-game.css'
import { QuizService } from '../../Services/QuizService'
import { ROUTES } from '../../utils/routes'


const QuizGame = () => {
    const [isLoading, setIsLoading] = useState(true)
    const param = useParams()
    const navigate = useNavigate()
    const user = useSelector(state => state.reducerUser.userInfo)
    const quiz = useSelector(state => state.reducerQuiz.currentQuiz)
    const dispatch = useDispatch()
    const [step, setStep] = useState(0)
    const [answersUser, setAnswerUser] = useState([])
    const [userAnswerRight, setUserAnswerRight] = useState([])


    useEffect(() => {
        getCurrentQuiz(param.id, dispatch)
    }, [dispatch, param.id])

    useEffect(() => {
        setIsLoading(false)
    }, [quiz])

    const onSubmitQuestion = async () => {
        setAnswerUser(answersUser.filter(item => item.right === false))
        answersUser.map((item) => {

            if (item.right === true) {
                userAnswerRight.push(item)
            }

        })
        let allRightAnswer = 0
        quiz.question.map((item) => {
            allRightAnswer = allRightAnswer + item.answer.filter(i => i.right === true).length
        })

        await QuizService.createQuizResults(quiz.id, Math.floor(((userAnswerRight.length / allRightAnswer) * 100) * (userAnswerRight.length / answersUser.length)))
        return navigate(ROUTES.QUIZ_LIST)
    }

    const onClickAnswer = (answer) => {
        if (answersUser.includes(answer) === false) {
            answersUser.push(answer)
        }
        else {
            const index = answersUser.indexOf(answer)
            delete answersUser[index]

        }
        setAnswerUser(answersUser.filter(item => item !== null))
    }

    return (
        <>
            {isLoading === true ? <Spinner></Spinner>
                :
                <div className="bg-quiz-game d-flex justify-content-center">
                    <div className="container content">
                        <div className='title-game'>{quiz.title}</div>
                        <div className="numbers-quiz d-flex justify-content-center align-items-center mt-5">
                            {quiz.question.map((item, index) => {
                                return <div onClick={() => (setStep(index))} key={index} className={step === index ? "question-number-item active mx-2" : "question-number-item mx-2"}>{index + 1}</div>
                            })}
                        </div>
                        <h2 className='title-question-quiz-game mt-5'>{quiz.question[step].title}</h2>
                        <div className="row">
                            {quiz.question[step].answer.map((item, index) => (
                                answersUser.includes(item) === false ?
                                    <div className="d-flex flex-column justify-content-center align-items-center col-md-6 col-12 ">
                                        <div className='answer-game' key={index} onClick={() => (onClickAnswer(item))}>{index + 1}) {item.title}</div>
                                    </div>
                                    :
                                    <div className="d-flex flex-column justify-content-center align-items-center col-md-6 col-12 ">
                                        <div className='answer-game active' key={index} onClick={() => (onClickAnswer(item))}>{index + 1}) {item.title}</div>
                                    </div>
                            ))}
                        </div>
                        <div className="row lil-uzi">
                            {step === 0 ?
                                <>

                                    <div className="col-6"></div>
                                    <div onClick={() => (setStep(step + 1))} className="d-flex flex-column justify-content-center align-items-center col-md-6 col-12"> <div className="button-question next">Следующий вопрос</div> </div>

                                </> :
                                <>
                                    <div onClick={() => (setStep(step - 1))} className="d-flex flex-column justify-content-center align-items-center col-md-6 col-12"><div className="button-question end">Предыдущий опрос</div></div>
                                    {step + 1 === quiz.question.length ?
                                        <div onClick={() => (onSubmitQuestion())} className="d-flex flex-column justify-content-center align-items-center col-md-6 col-12"> <div className="button-question next">Завершить опрос</div> </div>
                                        :
                                        <div onClick={() => (setStep(step + 1))} className="d-flex flex-column justify-content-center align-items-center col-md-6 col-12"> <div className="button-question next">Следующий вопрос</div> </div>
                                    }


                                </>
                            }
                        </div>

                    </div>
                </div>
            }
        </>
    )
}

export default QuizGame
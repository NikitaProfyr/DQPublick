import React from 'react'
import { useEffect } from 'react'
import { useState } from 'react'
import { Spinner } from 'react-bootstrap'
import { useDispatch, useSelector } from 'react-redux'
import { useNavigate, useParams } from 'react-router-dom'
import { getCurrentQuizGameAction, getCountRightAnswerGameAction } from '../../Feutures/Actions/actionQuiz'
import './quiz-game.css'
import { QuizService } from '../../Services/QuizService'
import { ROUTES } from '../../utils/routes'


const QuizGame = () => {
    const [isLoading, setIsLoading] = useState(true)
    const param = useParams()
    const navigate = useNavigate()
    const user = useSelector(state => state.reducerUser.userInfo)
    const quiz = useSelector(state => state.reducerQuiz.currentQuiz)
    const countRightAnswer = useSelector(state => state.reducerQuiz.countRightAnswer)
    const dispatch = useDispatch()
    const [step, setStep] = useState(0)
    const [answersUser, setAnswerUser] = useState([])
    const [userAnswerRight, setUserAnswerRight] = useState([])

    useEffect(() => {
        getCurrentQuizGameAction(param.id, dispatch)
        getCountRightAnswerGameAction(param.id, dispatch)
    }, [dispatch, param.id])

    useEffect(() =>{
        quiz.question.forEach(item => {
            if(item.id !== undefined){
                setAnswerUser(prevAnswers => {
                    const isDuplicate = prevAnswers.some(existingItem => 
                        existingItem.id === item.id && existingItem.title === item.title
                    );
                    if (!isDuplicate) {
                        return [
                            ...prevAnswers,
                            {
                                id: item.id,
                                title: item.title,
                                answer: []
                            }
                        ];
                    }
                    return prevAnswers;
              });
            }    
            }
        );
    },[quiz])

    useEffect(() => {
        if (answersUser[1] && answersUser[1].answer !== undefined) {
            setIsLoading(false);
        }
        
    }, [quiz, countRightAnswer])

    const onSubmitQuestion = async () => {
        console.log(answersUser);
        QuizService.checkQuizUser(answersUser, quiz.id).then((res) => {
            return navigate(ROUTES.QUIZ_USER)
        })
    }

    const onClickAnswer = (step, answer) => {
        const updatedAnswers = answersUser.map((item, index) => {
            if (index === step) {
                if (!item.answer.includes(answer)) {
                    return {
                        ...item,
                        answer: [...item.answer, answer]
                    };
                } else {
                    return {
                        ...item,
                        answer: item.answer.filter(a => a !== answer)
                    };
                }
            }
            return item;
        });
        setAnswerUser(updatedAnswers);
        // console.log(updatedAnswers);
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
                                <div className="d-flex flex-column justify-content-center align-items-center col-md-6 col-12 ">
                                    <div className={answersUser[step].answer.includes(item) === false ? 'answer-game':'answer-game active'} key={index} onClick={() => (onClickAnswer(step, item))}>{index + 1}) {item.title}</div>
                                </div>  
                            ))}
                        </div>
                        <div className="row lil-uzi">
                            {step === 0 ?
                                <>

                                    <div className="col-6"></div>
                                    <div onClick={() => (setStep(step + 1))} className="d-flex flex-column justify-content-center align-items-center col-md-6 col-12"> <div className="button-question next">Следующий вопрос</div> </div>

                                </> 
                                :
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
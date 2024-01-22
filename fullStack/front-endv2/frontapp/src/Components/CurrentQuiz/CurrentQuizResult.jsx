import React from 'react'
import { useState } from 'react'
import { Link } from 'react-router-dom'
import { ROUTES } from '../../utils/routes'
import Tilt from 'react-vanilla-tilt'
 
import './current-quiz.css'
import { ApiUrl } from '../../Http'


// const CurrentQuizResult = ({ props }) => {
//     const [quiz, setQuiz] = useState(props)

//     return (
//       <Tilt className="current-quiz-xxxtentacion" style = {{}}>
//       <Link
//       to={ROUTES.QUIZ_CURRENT + `/${quiz.quiz.id}`}
//       className="d-flex flex-column h-100 current-quiz"
//     >
//       <img className='current-quiz-img' src={"http://127.0.0.1:8000/quiz-public/image/?urlImage=" + quiz.quiz.image} alt="ИЗОБРАЖЕНИЕ ДРАКОНА" />
//       <p className='title-quiz m-0 text-break'>{quiz.quiz.title}</p>
//       <p className='title-description m-0 text-break'>{quiz.quiz.description}</p>
//       <div className="progress">
//         <div className="progress-bar" style={{width:`${quiz.result}%`}} role="progressbar" aria-valuenow={quiz.result} aria-valuemin="0" aria-valuemax="100"></div>
//         <div className="progress-result">{quiz.result}%</div>
//       </div>
//       </Link>
//     </Tilt>
//     )
// }

const CurrentQuizResult = ({ props }) => {
  return (
    <Tilt className="current-quiz-xxxtentacion" style = {{}}>
    <Link
    to={ROUTES.QUIZ_CURRENT + `/${props.quiz.id}`}
    className="d-flex flex-column h-100 current-quiz"
  >
    <img className='current-quiz-img' src={ApiUrl + "/quiz-public/image/" + props.quiz.image} alt="ИЗОБРАЖЕНИЕ ДРАКОНА" />
    <p className='title-quiz m-0 text-break'>{props.quiz.title}</p>
    <p className='title-description m-0 text-break'>{props.quiz.description}</p>
    <div className="progress">
      <div className="progress-bar" style={{width:`${props.result}%`}} role="progressbar" aria-valuenow={props.result} aria-valuemin="0" aria-valuemax="100"></div>
      <div className="progress-result">{props.result}%</div>
    </div>
    </Link>
  </Tilt>
  )
}

export default CurrentQuizResult
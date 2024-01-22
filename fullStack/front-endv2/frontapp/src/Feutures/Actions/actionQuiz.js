import { QuizService } from "../../Services/QuizService"
import { GET_CURRENT_QUIZ, GET_QUIZ, GET_QUIZ_USER, CREATE_QUIZ, UPDATE_CURRENT_QUIZ, BaseCurrentQuiz, GET_QUIZ_RESULT, CLEAR_QUIZ } from "../Reducers/reducerQuiz"

 


export const getQuizAction = async (dispatch, page, size) => {
    const data = await QuizService.getQuiz(page, size)
    dispatch({type: GET_QUIZ, payload: data})
}

export const getCurrentQuiz = async (idQuiz, dispatch) => {
    const data = await QuizService.getCurrentQuiz(idQuiz)
    dispatch({type: GET_CURRENT_QUIZ, payload: data})
}

export const getUserQuiz = async (dispatch, page, size) => {
    const data  = await QuizService.getUserQuiz(page, size)
    dispatch({type: GET_QUIZ_USER, payload: data})
}

export const addQuestionAction = (payload) => {
    return {
        type: CREATE_QUIZ,
        payload: payload
    }
}

export const updateQuestionAction = (payload) => {
    return {
        type: UPDATE_CURRENT_QUIZ,
        payload: payload
    }
}

export const setBaseCurrentQuiz = () => {
    return {
        type: GET_CURRENT_QUIZ,
        payload: BaseCurrentQuiz,
    }
}

export const getQuizResultAction = async (dispatch, page, size) => {
    const data = await QuizService.getQuizResultsUser(page, size)
    dispatch({
        type: GET_QUIZ_RESULT,
        payload: data
    })
}
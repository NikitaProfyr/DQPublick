import Api from "../Http";

export class QuizService {
    static getQuiz = async (page, size) => {
        const { data } = await Api.get(`quiz/quiz-list?page=${page}&size=${size}`)
        return data
    }
    static getCurrentQuizGame = async (idQuiz) => {
        const { data } = await Api.get(`quiz/get-quiz-game/${idQuiz}`)
        return data
    }
    static getCurrentQuiz = async (idQuiz) => {
        const { data } = await Api.get(`quiz/get-quiz/${idQuiz}`)
        return data
    }
    static getUserQuiz = async (page, size) => {
        const { data } = await Api.get(`/quiz/getquizuser?page=${page}&size=${size}`)
            .catch(() => ({}))
        return data
    }
    static createQuiz = (quiz) => {
        return Api.post('/quiz/createquiz', quiz)
    }
    static delQuiz = async (quiz) => {
        return await Api.delete(`/quiz/deletequiz/?quiz_data=${quiz}`
        )
    }
    static createImageQuiz = async (image) => {
        console.log(image);
        const data = await Api.post('/quiz/download/image', image, { headers: { 'Content-type': 'multipart/form-data' } })
            .catch(
                (error) => { console.log(error); }
            )
        return data.data
    }
    static getImage = async (imgUrl) => {
        // console.log(`/quiz/image/${imgUrl}`);
        const data = await Api.get(`/quiz/image/?url_image=${imgUrl}`)
        console.log(data);
        return data
            .catch(() => {
                return '../../image/currentQuizDragon.png'
            })
    }
    static updateCurrentQuiz = async (quiz) => {
        console.log(quiz);
        return await Api.put('/quiz/updatequiz/', quiz)
    }
    static updateImage = async (formdata) => {
        console.log(formdata.get('quiz_id'));
        console.log(formdata.get('image'));
        const data = await Api.put('/quiz/update/image', formdata, { headers: { 'Content-type': 'multipart/form-data' } })
            .catch(
                (error) => { console.log(error); }
            )
        return data.data
    }
    static createQuizResults = async (quizId, result) => {
        return await Api.post(`/quiz/create-result?quiz_id=${quizId}&result=${result}`
        )
    }
    static getQuizResultsUser = async (page, size) => {
        const { data } = await Api.get(`/quiz/result?page=${page}&size=${size}`)
        return data
    }
}

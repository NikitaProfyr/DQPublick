
export const GET_QUIZ = 'GET_QUIZ'
export const GET_CURRENT_QUIZ = 'GET_QURRENT_QUIZ'
export const GET_QUIZ_USER = 'GET_QUIZ_USER'
export const CREATE_QUIZ = 'CREATE_QUIZ'
export const UPDATE_CURRENT_QUIZ = 'UPDATE_CURRENT_QUIZ'
export const GET_QUIZ_RESULT = 'GET_QUIZ_RESULT'



export const BaseCurrentQuiz = {
    id:"1",
    title: "",
    description: "",
    image:'testtest.jpg',
    question: [{
        id: "1",
        title: "",
        answer:[{
            id: "1",
            title: "",
            right: false
        }]
    }]
} 

const stateQuiz = {
    quiz: {
        items:[],
        page: 0,
        pages: 0,
        size: 0,
    },
    quizUser: [],
    createQuiz: {
        id:"1",
        title: "",
        description: "",
        image:'testtest.jpg',
        question: [{
            id: "1",
            title: "",
            answer:[{
                id: "1",
                title: "",
                right: false
            },{
                id: "1",
                title: "",
                right: true
            }]
        }]
    },
    currentQuiz: {
        id:"1",
        title: "",
        description: "",
        image:'testtest.jpg',
        question: [{
            title:"",
            answer:[]
        }]
    },
    quizResults: []
}


export const reducerQuiz = (state = stateQuiz, action) => {
    const {type, payload} = action

    switch(type){
        case UPDATE_CURRENT_QUIZ:
            return {...state, currentQuiz:{...payload}}
        case CREATE_QUIZ:
            return {...state, createQuiz: {...payload}}
        case GET_QUIZ_USER:
            return {...state, quizUser: payload}
        case GET_QUIZ:
            payload.items = payload.items.filter(newItem => !state.quiz.items.some(item => 
                item.id === newItem.id && item.name === newItem.name
              ));
            return {...state, 
                quiz: {
                    items: [...state.quiz.items, ...payload.items],
                    page: payload.page,
                    pages: payload.pages,
                    size: payload.size,
                } 
            }
            // }
          
            // for(var i = 1; i < state.quiz.items.length; i++){
            //   if()  
            // }
            

        case GET_CURRENT_QUIZ:
            return {...state, currentQuiz: payload}
        case GET_QUIZ_RESULT:
            return {...state, quizResults: payload}
        default:
            return state
    }

}
import { combineReducers, createStore, applyMiddleware } from 'redux'
import reducerUser from './reduserUser'
import { reducerQuiz } from './reducerQuiz';

import thunk from 'redux-thunk'


// const rootReducer = combineReducers({
//     reducerUser: reducerUser
// })

export const store = createStore(
    combineReducers({
        reducerUser: reducerUser,
        reducerQuiz: reducerQuiz,
    }),
    {},
    applyMiddleware(thunk)
);
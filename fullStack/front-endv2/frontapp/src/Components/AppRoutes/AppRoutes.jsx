import React from 'react'


import { BrowserRouter, Route, Routes } from 'react-router-dom'

import IndexPage from '../../Page/IndexPage'
import LoginPage from '../../Page/LoginPage'
import QuizListPage from '../../Page/QuizListPage'
import UserSetingPage from '../../Page/UserSetingPage'
import RegistrationPage from '../../Page/RegistrationPage'

import { ROUTES } from '../../utils/routes'
import QuizDetailPage from '../../Page/QuizDetailPage'
import QuizUserPage from '../../Page/QuizUserPage'
import QuizCreatePage from '../../Page/QuizCreatePage'
import QuizUpdatePage from '../../Page/QuizUpdatePage'
import QuizGamePage from '../../Page/QuizGamePage'
import { useSelector } from 'react-redux'

const PublicRoutes = [
  {
    path: ROUTES.HOME,
    Component: <IndexPage />,
  },
  {
    path: ROUTES.LOGIN,
    Component: <LoginPage />,
  },
  {
    path: ROUTES.REGISTRATION,
    Component: <RegistrationPage />,
  },
]

const PrivateRoutes = [
  {
    path: ROUTES.QUIZ_LIST,
    Component: <QuizListPage />,
  },
  {
    path: ROUTES.USER_SETTING,
    Component: <UserSetingPage />
  },
  {
    path: ROUTES.QUIZ_DETAIL,
    Component: <QuizDetailPage />
  },
  {
    path: ROUTES.QUIZ_USER,
    Component: <QuizUserPage />
  },
  {
    path: ROUTES.QUIZ_USER_DETAIL + "/:id",
    Component: <QuizUpdatePage />
  },
  {
    path: ROUTES.QUIZ_CREATE,
    Component: <QuizCreatePage />
  },
  {
    path: ROUTES.QUIZ_GAME + "/:id",
    Component: <QuizGamePage />
  },
]



const AppRoutes = () => {
  const isActive = useSelector(state => state.reducerUser.isActive)

  return (
    <BrowserRouter>
      <Routes>
        {PublicRoutes.map(({ path, Component }) =>
          (<Route key={path} path={path} element={Component} exact />))
        }

        {isActive && PrivateRoutes.map(({ path, Component }) => <Route key={path} path={path} element={Component} exact />)}
      </Routes>
    </BrowserRouter>
  )
}

export default AppRoutes
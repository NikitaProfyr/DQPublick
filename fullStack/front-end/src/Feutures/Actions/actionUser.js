import AuthService from "../../Services/AuthService"
import { ROUTES } from "../../utils/routes";

export const loginAction = (userName, password, dispatch) => {
    AuthService.login(userName, password).then((res) => {
        console.log(res);
        dispatch({ type: 'LOGINSUCCES', payload: res })
        window.location.href = ROUTES.QUIZ_LIST;
    }).catch((e) => {
        console.log(e);
        alert("Не правильный логин или пароль.")
})
}

export const logoutAction = (dispatch) => {
    AuthService.logout()
    dispatch({
        type: 'LOGOUT',
    })
}

export const updateUserAction = async (dispatch, userName, email) => {
    const data = await AuthService.updateUserData(userName, email)
    dispatch({ type: "UPDATE_USER", payload: data })
}
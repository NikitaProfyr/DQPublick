import { ApiUrl } from "../../Http";
import AuthService from "../../Services/AuthService"
import { ROUTES } from "../../utils/routes";
// import UPDATE_USER from "../Reducers/reduserUser"
// export const loginAction = async (userName, password, dispatch) => {
//     const data = await AuthService.login(userName, password)
//     dispatch({type: 'LOGINSUCCES', payload: data})
// }

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

export const updateUserAction = async (dispatch, userName, id, email) => {
    const data = await AuthService.updateUserData(userName, id, email)
    dispatch({ type: "UPDATE_USER", payload: data })
}
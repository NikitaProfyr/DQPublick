import Api from "../Http";

export default class AuthService {
    static login = async (userName, password) => {
        const { data } = await Api.post('/users/login', { userName, password }, {
            headers: {
                'Access-Control-Allow-Credentials': 'true',
                'credentials': 'include'
            }
        }, {
            withCredentials: true  // Включаем отправку куки
        })
        localStorage.setItem('accessToken', data.accessToken)
        localStorage.setItem('user', JSON.stringify(data.user))
        return data
    }
    static deleteCurrentUser = async (userId) => {
        console.log('da', userId);
        return await Api.delete(`/users/delete/`)
    }
    static logup(userName, password) {
        const userData = {
            userName: userName,
            password: password
        }
        var answer = false
        Api.post('/users/logup', userData).then(response => {
            if (response.status === 400) {
                answer = false
            }
            if (response.status === 200) {
                console.log("ebat`")
                answer = true
            }
        })
        console.log(answer, "3232")
        return answer
    }
    static updateUserData = async (userName, id, email) => {
        const userData = {
            email: email,
            userName: userName,
        }
        const { data } = await Api.put('/users/update/user', userData).catch((err) => {
            return err
        })
        localStorage.removeItem('accessToken')
        localStorage.removeItem('user')
        localStorage.setItem('accessToken', data.accessToken)
        localStorage.setItem('user', JSON.stringify(data.user))
        return data
    }
    static updateUserPasswordDataTravisScott = async (id, oldPassword, newPassword) => {
        try {
            const userData = {
                oldPassword: oldPassword,
                newPassword: newPassword,
            }
            const response = await Api.post("/users/update/password", userData)
            return response.data;
        } catch (err) {
            throw err;
        }
    }
    static logout = async () => {
        localStorage.removeItem('accessToken')
        localStorage.removeItem('user')

        return await Api.post('/users/logout')
    }

    static getUserInfo(accessToken) {
        return Api.post(`/users/getUser?token=${accessToken}`)
            .then(response => {
                return Promise.resolve(response.data)
            })
    }
}
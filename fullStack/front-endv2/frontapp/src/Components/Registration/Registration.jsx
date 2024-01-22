import React, { useState } from "react";
import { Link, Routes, useNavigate } from "react-router-dom";
import { ROUTES } from '../../utils/routes'
import './registration.css'
import logo from "../../image/logo.png"
import DraconImg from '../../image/drakonEgor.png'
import AuthService from "../../Services/AuthService";


const Registration = () => {
    
    const [userName, setUserName] = useState()
    const [password1, setPassword1] = useState()
    const [password2, setPassword2] = useState()
    const navigate = useNavigate()
    // const dispatch = useDispatch()
    const submitDataReg = (e) => {
        // data.preventDefault()
        

    
        if (!userName || !password1 || !password2){
            return alert("Необходимо заполнить все поля!")
        }
        if (password1 !== password2){
            return alert("Пароли должны совподать.")
        }
        if (userName.length < 3) {
            return alert("Имя пользователя должно иметь более 3 символов.")
        }
        if (password1.length < 6) {
            return alert("Пароль должен иметь более 6 символов.")
        }
        AuthService.logup(userName, password1)
        navigate(ROUTES.LOGIN)
        
    }
    return (
    <>         
        <div className="bg-registration">
            <img src={DraconImg} width="700px" alt=""  className="dragon-img-registration"/>
            <div className="bg-content-registration">
                <div className="content-registration">
                    <b>РЕГИСТРАЦИЯ</b>
                    <form onSubmit={submitDataReg}>
                        <div className="form-input-registration">
                            <input onChange={e => {setUserName(e.target.value)}} type="text" name="userName" placeholder="Введите имя пользователя" />
                            <input onChange={e => {setPassword1(e.target.value)}} type="password" name="password1" placeholder="Введите пароль" />
                            <input onChange={e => {setPassword2(e.target.value)}} type="password" name="password2" placeholder="Повторите пароль" />
                        </div>
                        <button type="submit">ЗАРЕГИСТРИРОВАТЬСЯ</button>
                    </form>
                    
                    <Link to="/authorization">ВОЙТИ В АККАУНТ</Link>
                    
                    <img src={logo} alt="" width="110px" className="logo-content-registration" />
                </div>
            </div>
        </div>
    </>
  )
}

export default Registration
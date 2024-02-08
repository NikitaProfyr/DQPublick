import React, { useState } from 'react'
import './ChangePassword.css'
import logo from "../../image/IBDnew.svg"
import { Link, useParams, useNavigate } from "react-router-dom";
import { ROUTES } from '../../utils/routes';
import AuthService from '../../Services/AuthService';

const ChangePassword= () => {
    
    const [password, setPassword] = useState()
    const [password2, setPassword2] = useState()
    const param = useParams()
    const navigate = useNavigate()
    const change = (e) => {
        e.preventDefault()
        if(password !== password2){
           return alert("Пароли должны совпадать")
        }
        AuthService.changePassword(password, param.rndstr).then((res) => (
            navigate(ROUTES.LOGIN)
        ))
    }

    return (
        <>
            <div className="bg-password-recovery d-flex justify-content-center align-items-center">
                <div className="container d-flex justify-content-center">
                    <div className="content-password-recovery">
                        <div className="wrapper d-flex flex-column justify-content-center align-items-center">
                            <p>СМЕНА ПАРОЛЯ</p>
                            <form className='form-password-change' onSubmit={change}>
                                <input onChange={e => (setPassword(e.target.value))} type="password" placeholder="Введите пароль" />
                                <input onChange={e => (setPassword2(e.target.value))} type="password" placeholder="Подтвердите пароль" />
                                <button type="submit">ОТПРАВИТЬ</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
};

export default ChangePassword
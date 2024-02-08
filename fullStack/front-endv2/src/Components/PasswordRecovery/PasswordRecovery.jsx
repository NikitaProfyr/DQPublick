import React, { useState } from 'react'
import './PasswordRecovery.css'
import logo from "../../image/IBDnew.svg"
import { Link } from "react-router-dom";
import { ROUTES } from '../../utils/routes';
import AuthService from '../../Services/AuthService';

const PasswordRecovery = () => {
    
    const [email, setEmail] = useState()
    const recovery = (e) => {
        e.preventDefault()
        AuthService.resetPassword(email)
    }

    return (
        <>
            <div className="bg-password-recovery d-flex justify-content-center align-items-center">
                <div className="container d-flex justify-content-center">
                    <div className="content-password-recovery">
                        <div className="wrapper d-flex flex-column justify-content-center align-items-center">
                            <p>ВОССТАНАВЛЕНИЕ</p>
                            <form className='form-password-recovery' onSubmit={recovery}>
                                <input onChange={e => (setEmail(e.target.value))} type="email" placeholder="Введите email" />
                                <button type="submit">ОТПРАВИТЬ</button>
                            </form>
                            <Link to={ROUTES.LOGIN} className='link-back-to-login'> ВОЙТИ В АККАУНТ </Link>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
};

export default PasswordRecovery
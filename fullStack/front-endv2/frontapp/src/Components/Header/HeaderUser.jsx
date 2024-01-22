import React from 'react'
import { useEffect } from 'react';
import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, useSearchParams } from "react-router-dom";
import { logoutAction } from '../../Feutures/Actions/actionUser';

import LogoImg from '../../image/IBDnew.svg'
import { ROUTES } from '../../utils/routes';
import './header-user.css'

const HeaderUser = () => {
    const user = useSelector(state => state.reducerUser.userInfo)
    const [loader, setLoader] = useState(true)
    const [isActive, setActive] = useState(false);
    	
 

    console.log();
    const dispatch = useDispatch()

    useEffect(() => {
        if (user !== null) {
            setLoader(false)
        }
    }, [user])

    const addActiveClass = () =>{
        setActive(!isActive);
        let body = document.querySelector("body")
        if(!isActive){
            body.classList.add('active')
        } 
        else{
            body.classList.remove('active')
        }     
    }

    const removeActive = (url) => {
        if(window.location.pathname !== url){
            let body = document.querySelector("body")
            body.classList.remove('active')
        }  
    }

    if (loader) {
        // return <Spinner animation='grow'/>
    }
    else {
        return (
            <div className="Header-bg">
                <div className="container wow">
                    <div className="Header">
                        <div className="logo">
                            <Link to={ROUTES.QUIZ_LIST}><img src={LogoImg} height="40" alt="Logo" /></Link>
                        </div>
                        <div onClick={addActiveClass} className={isActive ? "burger-button active"  : "burger-button"}>
                            <span></span>
                        </div>
                        <div className={isActive ? "header-menu active" : "header-menu" }>
                            <ul className="nav-bar">
                                <li><Link onClick={() => (removeActive(ROUTES.QUIZ_LIST))} to={ROUTES.QUIZ_LIST} className="link-quiz">Опросы</Link></li>
                                <li><Link onClick={() => (removeActive(ROUTES.QUIZ_USER))} to={ROUTES.QUIZ_USER} className="link-quiz">Мои опросы</Link></li>
                                <li><a href="#" className="link-quiz">О нас</a></li>
                                <li title='Настройки пользователя'><Link onClick={() => (removeActive(ROUTES.USER_SETTING))} to={ROUTES.USER_SETTING} className="link-quiz">{user.userName}</Link></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        )
    }

}

export default HeaderUser
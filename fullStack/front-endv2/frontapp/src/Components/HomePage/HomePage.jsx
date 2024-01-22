import React from 'react'
import { Link } from "react-router-dom";

import { ROUTES } from '../../utils/routes';
import './home-page.css'

const HomePage = () => {
    return (
        <>
            <div className="bg-content-block-1">
                <div className="container">
                    <div className="content-block-1">
                        <div className="text-content-block-1">
                            <p>Присоединяйтесь к нам сегодня и сделайте свой голос услышаным!<br /><Link to={ROUTES.LOGIN}>Зарегистрируйтесь</Link> на нашем сайте, чтобы начать создавать и участвовать в опросах уже сейчас.</p>
                            <div className="h2-text-content-block-1">
                                <span className="DQtext">DQ</span> - by IBD<br />company.
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div className="bg-content-block-2">
                <div className="container">
                    <div className="content-block-2">
                        <div className="content-top-2">
                            <div className="content-top-group">Dragon Question<p>Лучшая платформа для проведения опросов</p></div>
                        </div>
                        <div className="content-buttom-2">
                            <div className="content-left-2">
                                Не драконь,<br /> пройди опрос!
                            </div>
                            <a href="#" className="button-content-home-page-buttom">
                                <div className="content-right-2"> <span>Пройти опрос</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}

export default HomePage
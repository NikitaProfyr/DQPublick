import React, { useState } from 'react'
import copy from 'copy-to-clipboard'
import './footer.css'
import logo from "../../image/IBDnew.svg"

const Footer = () => {

    const handleEmailClick = (text) => {
        copy(text); 
    };

    return (
        <div className="Footer">
            <div className="container d-flex justify-content-between">
                <div className="footer-left">

                    <b>IBD Company©</b>
                    <p>Телефон:<span onClick={() => (handleEmailClick("+7(980)-326-13-85"))}> +7(980)-326-13-85 </span>,
                     <span onClick={() => (handleEmailClick("+7(915)-574-61-67"))}>+7(915)-574-61-67</span></p>
                    <p>Почта:<span onClick={() => (handleEmailClick("IBDCorporation31@gmail.com"))}> IBDCorporation31@gmail.com</span></p>
                    <p>Адрес:<span> г.Лос-Анджелес</span></p>
                </div>
                <div className="footer-right d-flex flex-column align-items-end justify-content-center">
                    <img src={logo} alt="IBD" width="90%" />


                </div>
            </div>
        </div>
    )
};

export default Footer
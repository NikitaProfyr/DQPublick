import React from 'react'
import { Link } from 'react-router-dom'
import { ROUTES } from '../../utils/routes'
import LogoImg from '../../image/IBDnew.svg'

const HeaderBase = () => {
  return (
    <div className="container">
      <div className="Header">

        <div className="logo">
          <Link to={ROUTES.HOME}><img src={LogoImg} alt="Logo" /></Link>
        </div>
        <div className="nav-bar auth-link">
          {/* <a href="#"></a> */}
          <Link to={ROUTES.LOGIN}> Авторизоваться </Link>
        </div>
      </div>
    </div>

  )
}

export default HeaderBase
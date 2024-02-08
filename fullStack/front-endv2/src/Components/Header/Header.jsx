import React from 'react'
import HeaderBase from './HeaderBase'
import HeaderUser from './HeaderUser'
import './header.css'
import { useSelector } from 'react-redux'

const Header = () => {
    const isActive = useSelector(state => state.reducerUser.isActive)
  

    if (isActive === false){
        return (
            <HeaderBase/>      
        )
    }
    else{
        return (
            <HeaderUser />      
        )
    }
}

export default Header
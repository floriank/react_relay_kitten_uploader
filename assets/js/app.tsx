import css from "../css/app.css"

import React from 'react'
import ReactDOM from 'react-dom'
import Root from './components/Root'

let element: HTMLElement = document.getElementById("react-kittens")

ReactDOM.render(element, <Root />)

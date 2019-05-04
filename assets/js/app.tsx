import css from "../css/app.css"

import React from 'react'
import ReactDOM from 'react-dom'
import Root from './components/Root'

let element: HTMLElement | null = document.getElementById("react-kittens")

if (element) {
  ReactDOM.render( <Root />, element)
}

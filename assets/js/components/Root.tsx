import React from 'react'
import CreateNewKittenMutation from './mutations/CreateNewKittenMutation'

export default class Root extends React.Component {
  constructor(props: {}) {
    super(props)
    this.state = { success: false }
  }
  handleNameChange = (event: Event) => {
    this.setState({name: event.target.value})
  }
  handleFileChange = (event: Event) => {
    this.setState({file: event.target.files[0] })
  }
  submit = (event: Event): void  => {
    event.preventDefault()
    this.setState({success: false})
    const { name, file } = this.state
    const payload = {
      name, file
    }
    CreateNewKittenMutation(payload, () => {
      this.setState({success: true})
    })
  }
  public render(): JSX.Element {
    return (
      <form onSubmit={this.submit}>
        <h1>Uploader</h1>
        <input required  type="text" onChange={this.handleNameChange} placeholder="Name the kitten, plz"/>
        <label htmlFor="files">Upload a kitten image</label>
        <input required id="files" type="file" onChange={this.handleFileChange} accept="image/*"/>
        <input type="submit" />
      </form>
    )
  }
}
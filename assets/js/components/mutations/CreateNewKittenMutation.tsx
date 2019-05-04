import { graphql, commitMutation } from 'react-relay'

import environment from '../../environment'

const mutation = graphql`
  mutation CreateNewKittenMutation($input: NewKittenInput!) {
    newKitten(input: $input) {
      kitten {
        name
      }
    }
  }
`

export default ({name, file}, onCompleted: () => any, onError?: () => any = console.error) => {
  const variables = {
    input: {
      name,
      image: file
    }
  }

  const uploadables = {
    image: file
  }

  commitMutation(
    environment,
    {
      mutation,
      variables,
      uploadables,
      onCompleted,
      onError
    }
  )
}
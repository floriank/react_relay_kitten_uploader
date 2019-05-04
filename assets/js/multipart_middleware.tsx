/**
 * This middleware can be used with the react-relay-network modern middleware
 * and will tranform any request that includes a uploadables property to match the
 * specification by absinthe.
 *
 * A request including uploadables will also become a FormData POST request.
 * This function is heavily based on the implementation from apollo-upload-client
 */

 import { extractFiles } from 'extract-files'

export default (next) => async (req) => {
  const  {
    id, operation: { text: query }, variables, uploadables
  } = req

  const doRequest = async (req) => {
    const res = await next(req)
    return res
  }


  // helper to replace the image in the variables with a string from the form data body
  const replaceKey = (map: Object, prop: string, value: any): Object => {
    if (map.constructor === Object) {
      Object.keys(map).forEach(((key: string) => {
        if (map[key] === value) {
          map[key] = prop
        } else {
          map[key] = replaceKey(map[key], prop, value)
        }
      }))
    }
    return map
  }

  // continue with the regular request if there is no uploadables
  if (!uploadables) { return await doRequest(req) }

  // we have uploadables, generate a new form data
  const formData = new FormData()

  let mutatedVariables = variables
  for (let [key, file] of Object.entries(uploadables)) {
    // append the image under the same name as it was given to uploadables
    formData.append(key, file)

    // replace the file in the variables with the key that was just set
    mutatedVariables = replaceKey(mutatedVariables, key, file)
  }

  // append the the query and the mutated variables
  formData.append('query', query)
  formData.append('variables', JSON.stringify(mutatedVariables))

  req.fetchOpts.body = formData

  return await doRequest(req)
}
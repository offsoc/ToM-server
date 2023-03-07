import {send, expressAppHandler} from './utils'
const versions = [
  "r0.1.0",
  "r0.2.0",
  "r0.2.1",
  "r0.3.0",
  "v1.1",
  "v1.2",
  "v1.3",
  "v1.4",
  "v1.5",
]

const getVersions: expressAppHandler = (req, res) => {
  send(res, 200, {versions: versions})
}

export default getVersions

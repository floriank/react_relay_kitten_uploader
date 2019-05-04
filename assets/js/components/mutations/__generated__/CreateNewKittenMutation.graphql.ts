/* tslint:disable */

import { ConcreteRequest } from "relay-runtime";
export type NewKittenInput = {
    readonly cardImage: any;
    readonly name: string;
};
export type CreateNewKittenMutationVariables = {
    readonly input: NewKittenInput;
};
export type CreateNewKittenMutationResponse = {
    readonly newKitten: {
        readonly kitten: {
            readonly name: string | null;
        } | null;
    } | null;
};
export type CreateNewKittenMutation = {
    readonly response: CreateNewKittenMutationResponse;
    readonly variables: CreateNewKittenMutationVariables;
};



/*
mutation CreateNewKittenMutation(
  $input: NewKittenInput!
) {
  newKitten(input: $input) {
    kitten {
      name
      id
    }
  }
}
*/

const node: ConcreteRequest = (function(){
var v0 = [
  {
    "kind": "LocalArgument",
    "name": "input",
    "type": "NewKittenInput!",
    "defaultValue": null
  }
],
v1 = [
  {
    "kind": "Variable",
    "name": "input",
    "variableName": "input",
    "type": "NewKittenInput!"
  }
],
v2 = {
  "kind": "ScalarField",
  "alias": null,
  "name": "name",
  "args": null,
  "storageKey": null
};
return {
  "kind": "Request",
  "fragment": {
    "kind": "Fragment",
    "name": "CreateNewKittenMutation",
    "type": "RootMutationType",
    "metadata": null,
    "argumentDefinitions": (v0/*: any*/),
    "selections": [
      {
        "kind": "LinkedField",
        "alias": null,
        "name": "newKitten",
        "storageKey": null,
        "args": (v1/*: any*/),
        "concreteType": "NewKittenPayload",
        "plural": false,
        "selections": [
          {
            "kind": "LinkedField",
            "alias": null,
            "name": "kitten",
            "storageKey": null,
            "args": null,
            "concreteType": "Kitten",
            "plural": false,
            "selections": [
              (v2/*: any*/)
            ]
          }
        ]
      }
    ]
  },
  "operation": {
    "kind": "Operation",
    "name": "CreateNewKittenMutation",
    "argumentDefinitions": (v0/*: any*/),
    "selections": [
      {
        "kind": "LinkedField",
        "alias": null,
        "name": "newKitten",
        "storageKey": null,
        "args": (v1/*: any*/),
        "concreteType": "NewKittenPayload",
        "plural": false,
        "selections": [
          {
            "kind": "LinkedField",
            "alias": null,
            "name": "kitten",
            "storageKey": null,
            "args": null,
            "concreteType": "Kitten",
            "plural": false,
            "selections": [
              (v2/*: any*/),
              {
                "kind": "ScalarField",
                "alias": null,
                "name": "id",
                "args": null,
                "storageKey": null
              }
            ]
          }
        ]
      }
    ]
  },
  "params": {
    "operationKind": "mutation",
    "name": "CreateNewKittenMutation",
    "id": null,
    "text": "mutation CreateNewKittenMutation(\n  $input: NewKittenInput!\n) {\n  newKitten(input: $input) {\n    kitten {\n      name\n      id\n    }\n  }\n}\n",
    "metadata": {}
  }
};
})();
(node as any).hash = 'aa3368ec0e3e092908aa90306de9b522';
export default node;

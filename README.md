# KittenGraphql

A small uploader application I wrote as a demonstration for a blog post based on 

- [React](https://facebook.github.io/react) (w/ TypeScript)
- [Relay](https://facebook.github.io/relay) (modern) w/ [react-relay-network-modern](https://github.com/relay-tools/react-relay-network-modern)
- [Elixir](https://elixir-lang.org)/[Phoenix](https://phoenixframework.org) w/ [Absinthe](https://github.com/absinthe-graphql/absinthe) & `Absinthe.Relay`

## Purpose

This is mostly to demonstrate how one can facilitate single file uploads with Absinthe and Relay modern.

The more interesting parts are:

- The [multipart middleware](./assets/js/multipart_middleware.tsx) for react-relay-network-modern
- The [resolver](./lib/kitten_graphql_web/resolvers/kitten.ex) taking in the file and handling it to the Context

## Running the code

If you want to execute this project, you can use docker-compose to run it:

```
$ docker-compose pull
```

and a 

```
$ docker-compose up -d
```

should do it.

### Relay

I've included a relay compiler compatible image, so you can run everything inside the docker container:

```
# to generate graphql types via relay
$ docker-compose exec app yarn relay --watch

# for a production build
$ docker-compose exec app yarn deploy
```

Please note that you __do not have to run yarn for development__, as the Application will [keep a watcher up](./config/dev.exs).

## Questions?

Send me an email or open an issue, both is fine. I am always interested in feedback.

## Additional resources

- [relay environment docs](https://facebook.github.io/relay/docs/en/relay-environment.html)
- The [uploader discussion](https://github.com/absinthe-graphql/absinthe_plug/issues/114) on complying with the [suggestion](https://github.com/jaydenseric/graphql-multipart-request-spec) for the multipart request spec, which absinthe does not support (as of yet)
- [The Apollo upload client](https://github.com/jaydenseric/apollo-upload-client) which supports the spec
- The most [excellent @ScripterSugar providing the middleware](https://github.com/relay-tools/react-relay-network-modern/issues/41#issuecomment-468646856) for the nodejs based reference middleware

---
id: lwHVg1BsdavPPaSIHZWxP
title: Graphql
desc: ''
updated: 1633199321487
created: 1633199321487
---
graphQL scheme: data model: associated set of resolve methods; wide array of data access patterns - relay :: react bind, opinionated.
    graphQL-js
    Graphql-relay-js
On npm

Graphql server taught to load schema: express-graphql

Relay: graphQL through network layer
— relay starter kit
::git submodule add https://github.com/relayjs/relay-starter-kit

###graphQL
Decouple product code and server logic —
Can fetch same data in single network request (promise.all(stories.map(story => rest.get(story.href)).then(stories => console.log(stories);…
REST has new endpoint and n-1 requests.
####caching
Cached data does not need a network request: map directly in memory
- cache flattened and normalized. Records may link to other records, links -> special value type: references back in top-level-map: each server records stored once.
Populate cache: walking hierarchical graphQL responses & creating normalised cache records.
Cached returns are always synchronous. Fixed data structure.
Each record only stored once, not fetch dependent.
####mutations
Graphql writes: grapnel abstracts offer any data storage layer. Often schema differs from the way data is stored
Rerendering based on tracked queries
###relay
Framework for declarative data fetching — opinionated & heavily react based. Increase part isolation and component decoupling. Components declarative.
Natural place for data-dependencies in components -> otherwise heavy rerendering. Render() as initiation of data fetching.
But: components use data to figure out what to render.
Static method: components effectively return  query-tree separate from view-tree, describing data-dependencies.
Allows components to annotate with data dependencies in react which promotes them to containers (much like redux). Each data snippet = graphQL fragment (query snippets) which can be used to define container.
Data masking: get rid of obscure data fetching (or not fetching) relay only allows components to access data they explicitly ask for in fragments. Uses opaque identifiers on props: validate fetched the data for a component before rendering.
Retains mapping from all UI fields to set of ID’s in reference. - when writing data in cache: check affected & change. | default: shouldComponentUpdate: otherwise whole component rerenders on tiniest detail.

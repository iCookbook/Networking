# Networking

Layer responsible for all networking of the application.

## API

In this project, we use [Edamam API](https://developer.edamam.com/edamam-docs-recipe-api) for some reasons:

- Unlimited requests
- Provides a large amount of information and data

## Endpoints

We have two structures conforming for `EndpointProtocol` protocol

```swift
public protocol EndpointProtocol
```

### Endpoint

An endpoint is an access to a route by a separate HTTP method. The endpoint performs a specific task, accepts parameters and returns data to the client.

```swift
public struct Endpoint: EndpointProtocol
```

### URLEndpoint 

Endpoint with custom url provided in initializer.

```swift
public struct URLEndpoint: EndpointProtocol
```

---

For more details, read [GitHub Wiki](https://github.com/iCookbook/Networking/wiki) documentation

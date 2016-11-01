## The HTTP protocol

Antonis Kalipetis

[@akalipetis](https://twitter.com/akalipetis) - [https://www.akalipetis.com](https://www.akalipetis.com)


## Agenda

* What is the HTTP protocol?
* Anatomy of an HTTP request
* Anatomy of an HTTP response
* HTTPS, authentication and more


## The HTTP protocol

The **Hypertext Transfer Protocol** (HTTP) is an **application protocol** for distributed, collaborative, hypermedia information systems.[1] HTTP is the foundation of data communication for the World Wide Web.

Notes:

* Works over TCP
* Layer 7


## Anatomy of an HTTP request

```http
HTTP_VERB /request/path HTTP/1.1
Host: www.example.com
...Headers...

...Optional body...
```

Notes:

* 3 sections
* Verb, path, protocol version
* Headers - key value pairs being exchanged with the server
* Optional body


## Anatomy of an HTTP request

```http
GET /index.html HTTP/1.1
Host: www.example.com
```


## HTTP verbs

* `GET` - requests a representation of the specified resource
* `POST` - requests that a server accepts the entity enclosed
* `PUT` - requests that the enclosed entity be stored under the supplied URI
* `DELETE` - deletes the specified resource
* `PATCH` - applies partial modifications to a resource


## HTTP verbs

Some less used verbs

* `HEAD` - identical to a GET request, without the body
* `CONNECT` - converts the request connection to a transparent TCP/IP tunnel
* `OPTIONS` - returns the HTTP methods that the server supports for the specified URL
* `TRACE` - echoes the received request


## HTTP headers

HTTP headers allow the client and the server to pass additional information with the request or the response.

Headers are usually used to describe the form of the content, not the content itself.

Notes:

* Authentication headers
* 


## Example HTTP headers

* `Accept-encoding` - defines the accepted encoding
* `Cache-Control` - defines the caching functionality of the browser
* `Accept-language` - defines the language that shall be responded to the client
* `Cookie` and `Set-Cookie` - defines the cookies and the new cookies for the client


## HTTP body

The body encloses the resources that will be sent over to the server. Only the following verbs accept body:

* `POST`
* `PUT`
* `PATCH`
* `CONNECT`


## HTTP body example

```
name%3DMy%20Project&project_type%3Djava
```

Which actually is...


```
name=My Project&project_type=java
```


## HTTP body example

```json
{
    "name": "My Project",
    "project_type": "Java"
}
```


## Anatomy of an HTTP response

```http
HTTP/1.1 STATUC_CODE STATUC_CODE_TEXT
...Headers...

...Body...
```


## Anatomy of an HTTP response

```http
HTTP/1.1 200 OK
Date: Mon, 23 May 2005 22:38:34 GMT
Content-Type: text/html; charset=UTF-8
Content-Encoding: UTF-8
Content-Length: 138
Server: Apache/1.3.3.7 (Unix) (Red-Hat/Linux)
Connection: close

<html>
    ...
</html>
```


## Status codes

* Informational `1xx`
* Successful `2xx`
* Redirection `3xx`
* Client Error `4xx`
* Server Error `5xx`

Notes:
* Informational - mainly for informing the machine, for example WebSockets
* Redirection - search for this page somewhere else
* 4 - your fault
* 5 - the server's fault


## Common status codes

* `200` - Success!
* `400` - You send wrong data
* `404` - What you're looking for doesn't exist
* `500` - Oops, I am the server and I messed up


## Let's examine an HTTP request/response

Back to our lovely forms!


## Cookies


## HTTP sessions


## HTTP/2 - the future has come

Notes:

* Don't give too much attention
* Just worth mentioning


## Thanks!

[@akalipetis](https://twitter.com/akalipetis) - [https://www.akalipetis.com](https://www.akalipetis.com)

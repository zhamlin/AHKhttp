Documentation
=====================

HttpServer
---------

#### LoadMimes(file)
Loads mime types from a file.
Returns false if file not found.
```
// Example mime file
text/html                             html htm shtml
text/css                              css
```

#### GetMimeType(file)
Returns the mime type for the given file.
Defaults to ```"text/plain"```

#### ServeFile(ByRef response, file)
Sets the responses body to the files data and sets the correct  ```Content-Type```  header.

#### SetPaths(paths)

Takes an array of routes to server.
```
paths := {}
paths["/"] := Func("SomeFunction")

SomeFunction(ByRef request, ByRef response, ByRef server) {
	response.SetBodyText("Hello World")
	response.status := 200
}
```

####  Serve(port)
Starts the http server on the specified port.

#### Handle(ByRef request)
Used internally to handle requests.

----------

HttpRequest
---------------
#### Headers
Array containing headers from request.
```
request.headers["Some-Header"]
```
#### Queries
Array containing queries from request.
```
; request -> /dog?name=frank
msgbox % request.queries["name"] ; will display frank
```

#### Path
The path being requested.
```
request.path
```
#### Method
Method of request.
```
request.method
```
#### Protocol
Protocol of request.
```
request.protocol
```

#### IsMultipart
Returns true if the request is a multipart request.
```
MultiPart(ByRef req, ByRef res) {
	if (req.IsMultipart() && !req.done)
		res.status := 100
		return
	}
	
	msgbox % req.body
	res.status := 200
}
```

#### Done
Whether or not a multipart request is done being sent.

----------

HttpResponse
-----------

#### Headers
Array containing headers for response.
```
response.headers["Date"] := "Today"
```

#### Protocol
Protocol of response.
```
response.protocol
```

#### SetBody(ByRef body, length)
Sets the request body.
```
body - data for body of request
length - length of data
```

#### SetBodyText(text)
Sets the requests body as text.
```
text - text for body of request
```

#### Generate
Returns a buffer that contains the response data.

----------

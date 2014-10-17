#Persistent
#SingleInstance, force
SetBatchLines, -1

paths := {}
paths["/"] := Func("HelloWorld")
paths["404"] := Func("NotFound")

server := new HttpServer()
server.SetPaths(paths)
server.Serve(8000)
return

NotFound(ByRef req, ByRef res) {
    res.SetBody("Page not found")
}

HelloWorld(ByRef req, ByRef res) {
    res.SetBody("Hello World")
    res.statusCode := 200
}

#include, %A_ScriptDir%\AHKhttp.ahk
#include <AHKsock>

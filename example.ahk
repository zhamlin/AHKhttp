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
    res.SetBodyText("Page not found")
}

HelloWorld(ByRef req, ByRef res) {
    res.SetBodyText("Hello World")
    res.status := 200
}

#include, %A_ScriptDir%\AHKhttp.ahk
#include <AHKsock>

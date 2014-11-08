#Persistent
#SingleInstance, force
SetBatchLines, -1

paths := {}
paths["/"] := Func("HelloWorld")
paths["404"] := Func("NotFound")
paths["/logo"] := Func("Logo")

server := new HttpServer()
server.SetPaths(paths)
server.Serve(8000)
return

Logo(ByRef req, ByRef res) {
    f := FileOpen(A_ScriptDir . "/logo.png", "r")
    length := f.RawRead(data, f.Length)
    f.Close()

    res.status := 200
    res.headers["Content-Type"] := "image/png"
    res.SetBody(data, length)
}

NotFound(ByRef req, ByRef res) {
    res.SetBodyText("Page not found")
}

HelloWorld(ByRef req, ByRef res) {
    res.SetBodyText("Hello World")
    res.status := 200
}

#include, %A_ScriptDir%\AHKhttp.ahk
#include <AHKsock>

#Persistent
#SingleInstance, force
SetBatchLines, -1

paths := {}
paths["/"] := Func("HelloWorld")
paths["404"] := Func("NotFound")
paths["/logo"] := Func("Logo")

server := new HttpServer(8000)
server.LoadMimes(A_ScriptDir . "/mime.types")
server.SetPaths(paths)
return

Logo(ByRef req, ByRef res, ByRef server) {
    server.ServeFile(res, A_ScriptDir . "/logo.png")
    res.status := 200
}

NotFound(ByRef req, ByRef res) {
    res.SetBodyText("Page not found")
}

HelloWorld(ByRef req, ByRef res) {
    res.SetBodyText("<html><head><title>Hello Autohotkey</title></head><body><img src='/logo'></img></br>Hello Autohotkey</body></html>")
    res.status := 200
}

#include Socket.ahk
#include, %A_ScriptDir%\AHKhttp.ahk

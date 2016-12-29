import HeliumLogger
import Kitura

HeliumLogger.use()

let router = Router()

router.get("/hello", handler: { request, response, next in
    defer { next() }
    
    response.send("Hello")
}, { request, response, next in
    defer { next() }
    
    response.send(", world")
})

router.route("/test")
    .get() { request, response, next in
        defer { next() }
        response.send("You used GET!")
    }.post() { request, response, next in
        defer { next() }
        response.send("You used POST!")
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()

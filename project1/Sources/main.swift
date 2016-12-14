import Kitura
import HeliumLogger
import LoggerAPI
import KituraStencil

HeliumLogger.use()
let router = Router()
router.setDefault(templateEngine: StencilTemplateEngine())

router.get("/") { request, response, next in
    defer { next() }
    try response.render("home", context: [:])
}

router.get("/contact") { request, response, next in
    defer { next() }
    try response.render("contact", context: [:])
}

router.get("/staff") { request, response, next in
    response.send("Meet our great team")
    next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()

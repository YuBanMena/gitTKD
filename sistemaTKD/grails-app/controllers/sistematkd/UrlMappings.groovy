package sistematkd

class UrlMappings {

    static mappings = {

        group "/profesor", {
            "/" (controller: "profesor", action: "index")
            "/editar/$id"(controller: "profesor", action: "editar")
        }

        group "/alumno", {
            "/" (controller: "alumno", action: "index")
            "/editar/$id"(controller: "alumno", action: "editar")
        }

        group "/sucursal", {
            "/" (controller: "sucursal", action: "index")
            "/editar/$id"(controller: "sucursal", action: "editar")
            "/verGrupos/$id"(controller: "sucursal", action: "verGrupos")

        }

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

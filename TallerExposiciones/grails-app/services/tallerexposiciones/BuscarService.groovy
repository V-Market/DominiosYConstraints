package tallerexposiciones

import grails.transaction.Transactional

@Transactional
class BuscarService {

    def buscarForos(params) {
        if(params.textoBuqueda!= null && params.textoBuqueda!= "")
            return Forum.search(params.textoBuqueda, properties: ["name"])
        return null

    }
    def buscarUsuarios(params) {
        if(params.textoBuqueda!= null && params.textoBuqueda!= "")
            return User.search(params.textoBuqueda, properties: ["username"])
        return null
    }
}

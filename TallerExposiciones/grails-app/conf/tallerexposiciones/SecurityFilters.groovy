package tallerexposiciones

class SecurityFilters {

    def filters = {

        check(controller:'admin', action:'create|delete|edit|save|show|update' ) {
            before = {
                if(!session.getAttribute('authStatus').equals("logged")){
                    redirect(controller: 'admin',action: 'index')
                    return
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }

        check(controller:'file', action:'create|delete|edit|save|show|update') {
            before = {
                if(!session.getAttribute('authStatus').equals("logged")){
                    redirect(controller: 'file', action: 'index')
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }

        check(controller:'forum', action:'create|delete|edit|save|show|update') {
            before = {
                if(!session.getAttribute('authStatus').equals("logged")){
                    redirect(controller: 'forum', action: 'index')
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}

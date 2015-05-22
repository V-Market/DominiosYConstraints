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

        check(controller: 'user', action: '*') {
            before = {
                if(!session.getAttribute("authStatus").equals("logged") && !actionName.equals("index")){
                    redirect(controller: 'user',action: "index")
                    return
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }

        check(controller: 'regular', action: '*') {
            before = {
                if(!session.authStatus.equals("logged") && !actionName.equals("index")){
                    redirect(controller: 'regular',action: "index")
                    return
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }

        check(controller: 'post', action: '*') {
            before = {
                if(!session.authStatus.equals("logged") && !actionName.equals("index")){
                    redirect(controller: 'post',action: "index")
                    return
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}

package tallerexposiciones

import grails.transaction.Transactional

@Transactional
class LoginService {

    def login(session, params) {
        params.password = params.password.encodeAsMD5();
        def user = User.findByUsernameAndPassword(params.username, params.password)
        if(user){
            session.authStatus = 'logged'
            return user;
        }else{
            return null;
        }

    }

    def logout(session){
        session.authStatus = null

    }
}

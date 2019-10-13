'use strict'

class SessionController {

    async login ({ request, auth }) { 
        const { email, password } = request.all()
    
        const token = await auth.attempt(email, password)
    
        return token
    }

    async logout ({ auth, response }) {
        await auth.logout()
    
        return response.redirect('/')
    }
}

module.exports = SessionController

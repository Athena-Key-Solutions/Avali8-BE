'use strict'

const User = use('App/Models/User')
const Encryption = use('Encryption');
const Token = use('App/Models/Token');
const { validate } = use('Validator');

class SessionController {

    async login ({ request, auth }) { 
        
      const { email, password } = request.all()
    
      const token = await auth.attempt(email, password)
      
      return token

    }

    async logout({ response, auth}) {
      
      try {
        const check = await auth.check();
  
        if (check) {
          const token = await auth.getAuthHeader();
          await auth.authenticator("api").revokeTokens([token]);
          return response.status(200).send({ message: "Logout successfully!" });
        }
      } catch (error) {
        return response.status(401).send({ message: "Invalid api token" });
      }

    }

    async showUser({request, response, auth}) {}
}

module.exports = SessionController

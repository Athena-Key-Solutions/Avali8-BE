'use strict'

const User = use('App/Models/User')
const Encryption = use('Encryption');
const Token = use('App/Models/Token');
const { validate } = use('Validator');

class SessionController {

    async login ({ request, auth, response }) { 

      const { email, password } = request.all();
      
      try{
        const isLogeddin = await auth.check()
        
        if(isLogeddin){
          
          response.status(401).send({ alert: 'User already logged in!' })
        
        }
      }catch(err){
        try{
          await auth.attempt(email, password)
          const user = await auth.getUser()
          response.status(200).send({ message : 'Sucessfully Logged in!', user })
        }catch(err){
          response.status(401).send({ error: 'Credentials Invalid!' })
        }
      }
      
    }

    async logout({ request, response, auth}) {
      
      try{
        const isLogeddin = await auth.check()
        await auth.logout()
        response.status(200).send({ message : 'Sucessfully Logged out!'})
      }catch(err){
        response.status(401).send({ error: 'Have no one user logged in!' })
      }

    }
}

module.exports = SessionController

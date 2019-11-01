'use strict'

const User = use("App/Models/User")
const Question = use("App/Models/Question")
const { validate } = use('Validator');
const Encryption = use('Encryption');
const Token = use('App/Models/Token');


class UserController {
    
  async create ({ request, response }) {
      
      const rules = {
        email: 'required|email|unique:users,email',
        username: 'required|unique:users,username',
        name: 'required',
        password: 'required'
      };
      
      const {name, email, username, password } = request.only([
        'name',
        'email',
        'username',
        'password'
      ]);

      const validation = await validate({ name, email, username, password }, rules);
      
      if (!validation.fails()) {
        try {
          const user = await User.create({name,email, username, password });
          return response.send({ message: 'User has been created' });
        } catch (err) {
          response.status(401).send({ error: 'Please try again' });
        }
      } else {
        response.status(401).send(validation.messages());
      }
  }

  async show({request, response}){
    // const user = await auth.getUser()
    // const user = await auth.getUser()

    // const user = await auth.getUser()
    // const auth0 = await user.authenticator('jwt').generate(user)
    const { refresh_token } = request.only(['refresh_token'])
    const decrypted = Encryption.decrypt(refresh_token)
    console.log("Console Log: "+decrypted)

    try {
      
      const refreshToken = await Token.findBy('token', decrypted)
      
      if (refreshToken) {
        const user = refreshToken.users().fetch()
        
        return user;

      } else {
        response.status(401).send({ error: 'Invalid refresh token' })
      }
    } catch (err) {
      response.status(401).send({ error: err.toString()})
    }

  }


  async index ({ request, response, view }) {
  }
  
  async store ({ request, response }) {
  }

  //Passar esse método do controller de User para Controller de Question e passar como parâmetro o id do usuário autenticado.
  async storeQuestion({ request, response}) {
    
    const {questionData, alternatives} = request.post()
    const user = await User.find(1)
    const recordedQuestion = await user.questions().create(questionData)
    await recordedQuestion.alternatives().create(alternatives)
    await user.load('questions.alternatives')

    return user
  }

  // Passar para o Controller de question, com o usuario autenticado como parâmetro 
  async indexQuestion({request, response}){
    const users = User.query().with('questions').fetch()

    return users
  }

  /*async show ({ auth, params, response }) {
    
    // try {
      return await auth.listTokens()
    // } catch (error) {
    //   response.send('You are not logged in')
    // }
  }*/

  async edit ({ params, request, response, view }) {
  }
  
  async update ({ params, request, response }) {
  }
  
  async destroy ({ params, request, response }) {
  }

}

module.exports = UserController

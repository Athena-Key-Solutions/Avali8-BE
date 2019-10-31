'use strict'

const User = use("App/Models/User")
const Question = use("App/Models/Question")
const { validate } = use('Validator');

class UserController {
    
  /*async create ({ request, response }) {
      
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
  }*/


  async index ({ request, response, view }) {
  }
  
  async create ({ request, response, view }) {
  }

  async store ({ request, response }) {
  }

  //Passar esse método do controller de User para Controller de Question e passar como parâmetro o id do usuário autenticado.
  async storeQuestion({ request, response}) {
    
    const {questionData, alternatives} = request.post()
    // const questionData = await Question.create(question)

    // if(alternatives){
      // await questionData.alternatives().create(alternatives)
      // await questionData.load('alternatives')
    // }


    const user = await User.find(1)
    // const question = await Question.find(5)
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

  async show ({ params, request, response, view }) {
  }
  
  async edit ({ params, request, response, view }) {
  }
  
  async update ({ params, request, response }) {
  }
  
  async destroy ({ params, request, response }) {
  }

}

module.exports = UserController

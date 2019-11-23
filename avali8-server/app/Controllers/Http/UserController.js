'use strict'

const User = use("App/Models/User")
const Question = use("App/Models/Question")
const Exam = use("App/Models/Exam")
const { validate } = use('Validator');

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

  async storeQuestion({ request, auth, response}) {
    
    try {
      await auth.check()
    } catch (error) {
      response.status(401).send({message: 'Missing or invalid api token'})
    }
    
    const {questionData, alternatives} = request.post()
    const user = await auth.getUser()
    const recordedQuestion = await user.questions().create(questionData)
    await recordedQuestion.alternatives().create(alternatives)
    await user.load('questions.alternatives')

    return user
  }

  async getQuestionsByUser({auth, response}) {
    
    try {
      await auth.check()
    } catch (error) {
      response.status(401).send({message: 'Missing or invalid api token'})
    }
    try {
      const user = await auth.getUser()
      await user.load('questions.alternatives')
    } catch (error) {
      response.status(401).send('You are not logged in')
    }

    return user

  }


  async show ({ auth, response }) {

    try {
      await auth.check()
    } catch (error) {
      response.status(401).send({message: 'Missing or invalid api token'})
    }
    return auth.getUser();
  }

  async list(response){
    
    try{
      const users = await User.all()
      return users
    }catch(err){
      response.status(422).send({message: 'Have no user.'})
    }
    
  }

  async listExam(response){
    try{
      const exams = await Exam.all()
      return exams
    }catch(err){
      response.status(422).send({message: 'Have no exams.'})
    }
  }
  
  async edit ({ params, request, response, auth }) {

    const user = await auth.getUser()

    if(parseInt(params.id) === user.id){
      
      const data = request.post(['name','bio','password'])
      
      if(data.name && data.password && data.bio){
      
        user.merge(data)
        await user.save()
        response.status(200).send({message: 'User has been updated.'})
      
      }else if(data.name && data.password && !data.bio){
      
        user.merge({name: data.name, password: data.password})
        await user.save()
        response.status(200).send({message: 'User has been updated.'})

      }else if(data.name && data.bio && !data.password){
      
        user.merge({name: data.name, bio: data.bio})
        await user.save()
        response.status(200).send({message: 'User has been updated.'})

      }else if(data.password && data.bio && !data.name){
        
        user.merge({password: data.password, bio: data.bio})
        await user.save()
        response.status(200).send({message: 'User has been updated.'})

      }else if(data.name && !data.password && !data.bio){
      
        user.merge({name: data.name})
        await user.save()
        response.status(200).send({message: 'User has been updated.'})
      
      }else if(!data.name && !data.bio && data.password){
      
        user.merge({password: data.password})
        await user.save()
        response.status(200).send({message: 'User has been updated.'})
      
      }else if(!data.name && !data.password && data.bio){
      
        user.merge({bio: data.bio})
        await user.save()
        response.status(200).send({message: 'User has been updated.'})
      
      }else{
        response.status(422).send({message: "Missing data."})
      }
      
    }else{
      response.status(401).send({message: "You don't have permission to edit this user."})
    }
    
    
  }

}

module.exports = UserController

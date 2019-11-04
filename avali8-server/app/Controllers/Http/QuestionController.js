'use strict'

const Question = use('App/Models/Question')
const Alternative = use('App/Models/Alternative')

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

/**
 * Resourceful controller for interacting with questions
 */
class QuestionController {
  
  async index ({ request, response, view }) {
    
    const questions = await Question.query().with('alternatives').fetch()

    return questions
  }

  async store ({ request, response }) {
    
    const {alternatives, ...data} = request.only(['description', 'area', 'difficulty', 'alternatives','score'])
    
    const question = await Question.create(data)

    if(alternatives){
      await question.alternatives().create(alternatives)
      await question.load('alternatives')
    }

    return question
  }

  async indexQuestion({request, response}){
    const users = User.query().with('questions').fetch()

    return users
  }


}

module.exports = QuestionController

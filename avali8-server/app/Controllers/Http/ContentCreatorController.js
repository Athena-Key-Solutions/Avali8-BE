'use strict'

const Question = use('App/Models/Question')
const Exam = use('App/Models/Exam')
const Alternative = use('App/Models/Alternative')
const { validate } = use('Validator');

class ContentCreatorController {

    async createExam({request, response, auth}){
        
        const rules = {
            exam: 'required',
            questions: 'required',
            badge: 'required'
          };
          
          const {exam, questions, badge} = request.only([
            'exam',
            'questions',
            'badge'
          ])
    
          const validation = await validate({ exam, questions, badge }, rules)
          
          if (!validation.fails()) {
            
            try {
              const user = await auth.getUser()
              const examPersist = await user.exams().create(exam)
              await examPersist.badges().create({user_id: examPersist.user_id,name: badge.name, score: badge.score})
              
              for(let i = 0; i < questions.length; i++){

                const questionPersist = await examPersist.questions().create({user_id: examPersist.user_id , description: questions[i].description, area: questions[i].area, difficulty: questions[i].difficulty, score: questions[i].score })
                
                await questionPersist.alternatives().create({
                    a:questions[i].alternatives.A,
                    b:questions[i].alternatives.B,
                    c:questions[i].alternatives.C,
                    d:questions[i].alternatives.D,
                    right_alternative:questions[i].alternatives.right_alternative,
                })

              }

              return response.send({ message: 'Exam has been created' })

            } catch (err) {
              response.status(401).send({ error: 'Please try again, or contact the support.' })
              console.log("SUPORTE: "+ err)
            }
          } else {
            response.status(401).send(validation.messages())
          }

          /*const question = request.only('questions')
          return question*/
    }
}

module.exports = ContentCreatorController

'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Question extends Model {
    
    alternatives(){
        return this.hasOne('App/Models/Alternative','id','question_id')
    }

    users(){
        return this.belongsTo('App/Models/User','id','user_id')
    }
}

module.exports = Question

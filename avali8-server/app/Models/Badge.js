'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Badge extends Model {

    exams() {
        return this.belongsTo('App/Models/Exam')
    }

    users() {
        return this.belongsTo('App/Models/User')
    }

    userHasBadge(){
        return this.belongsToMany('App/Models/User','badge_id','user_id','id','id').pivotTable('user_has_badge').withTimestamps()
    }
    
}

module.exports = Badge

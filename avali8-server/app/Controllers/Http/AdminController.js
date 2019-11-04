'use strict'

const { validate } = use('Validator');
const User = use('App/Models/User')

class AdminController {

    async createContentCreatorUser({request,response}){
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
              await user.roles().attach([2])
              return response.send({ message: 'Content Creator has been created' });
            } catch (err) {
              response.status(401).send({ error: 'Please try again' });
            }
          } else {
            response.status(401).send(validation.messages());
          }
    }
}

module.exports = AdminController

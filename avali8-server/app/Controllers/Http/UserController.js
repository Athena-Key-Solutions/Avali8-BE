'use strict'

const User = use("App/Models/User")
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
}

module.exports = UserController

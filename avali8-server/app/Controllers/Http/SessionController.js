'use strict'

const Encryption = use('Encryption');
const Token = use('App/Models/Token');
const { validate } = use('Validator');

class SessionController {

    async login ({ request, auth }) { 
        const { email, password } = request.all()
    
        const token = await auth
                      .withRefreshToken()
                      .attempt(email, password)
        return token
    }

    async logout({ request, response}) {
        const rules = {
          refresh_token: 'required'
        };
    
        const { refresh_token } = request.only(['refresh_token']);
    
        const validation = await validate({ refresh_token }, rules);
    
        const decrypted = Encryption.decrypt(refresh_token);
    
        if (!validation.fails()) {
          try {
            const refreshToken = await Token.findBy('token', decrypted);
            if (refreshToken) {
              refreshToken.delete();
              response.status(200).send({ status: 'ok' });
            } else {
              response.status(401).send({ error: 'Invalid refresh token' });
            }
          } catch (err) {
            response.status(401).send({ error: err.toString()});
          }
        } else {
          response.status(401).send(validation.messages());
        }

      }
}

module.exports = SessionController

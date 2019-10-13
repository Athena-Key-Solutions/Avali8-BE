'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URLs and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')

Route.group(() => {
  Route.post('/signup', 'UserController.create')
  Route.post('/login', 'SessionController.login')
  Route.post('/logout', 'SessionController.logout')
}).prefix('avali8/api/v1')

Route.get('/', () => {
  return '<p>This is the Avali8 API</p>'
})



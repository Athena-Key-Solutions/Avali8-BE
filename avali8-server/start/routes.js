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


// Those routes should be only accessible
// when you are not logged in
Route.group(() => {
  Route.post('/signup', 'UserController.create')
  Route.post('/login', 'SessionController.login')
  
}).prefix('avali8/api/v1')

// Those routes should be only accessible
// when you are logged in
Route.group(() => {
  Route.post('/logout', 'SessionController.logout')
  Route.post('/token/refresh', 'SessionController.refreshToken')
}).prefix('avali8/api/v1')

Route.get('/', () => {
  return '<p>Avali8 API</p>'
})

Route.post('/testQuestion','QuestionController.store')
Route.get('/questions', 'QuestionController.index')
Route.post('/createQuestion', 'UserController.storeQuestion')
Route.post('/userquestions', 'UserController.indexQuestion')
Route.post('/user','UserController.show').middleware('auth:session')


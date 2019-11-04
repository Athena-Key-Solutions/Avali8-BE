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
  
}).prefix('avali8/api/v1').middleware('guest')

// Those routes should be only accessible
// when you are logged in
Route.group(() => {
  Route.post('/logout','SessionController.logout')
  Route.post('/user/:id','UserController.show')
  Route.post('/user/edit/:id','UserController.edit')
  Route.post('/examlist','UserController.listExam')
  Route.post('/userlist','UserController.list')
  Route.post('/make-exam/user/:id/question/:id','UserController.makeExam')
}).prefix('avali8/api/v1').middleware('auth')

Route.group(() => {
  Route.post('/signup','AdminController.createContentCreatorUser')
}).prefix('avali8/api/v1/admin').middleware(['auth','is:administrator'])


Route.group(() => {
  Route.post('/add-question','ContentCreatorController.createQuestion')
  Route.post('/add-exam','ContentCreatorController.createExam')
}).prefix('avali8/api/v1/content-creator').middleware(['auth','is:content-creator'])


Route.get('/', () => {
  return '<p>Avali8 API</p>'
})

Route.post('/testQuestion','QuestionController.store')
Route.get('/questions', 'QuestionController.index')
Route.post('/createQuestion', 'UserController.storeQuestion')
Route.post('/userquestions', 'UserController.indexQuestion')



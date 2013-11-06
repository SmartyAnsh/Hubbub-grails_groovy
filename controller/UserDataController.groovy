import org.apache.jasper.compiler.Node.ParamsAction;

import grails.converters.JSON

class UserDataController {

	def scaffold = true

	UserDataService userDataService

	def search()
	{

	}
	def advSearch()
	{

	}

	def advResults()
	{
		def profiles = userDataService.fetchResults(params,session)
		render (view:'../userData/advResults',model:[profiles:profiles]);
	}

	def results()
	{
		def userId = '%' +params.userId +'%'
		def sameUser = (String)session.getAttribute('user')
		//def users = UserData.findAllByUserIdLike(userId)
		def users = UserData.executeQuery('select userData from UserData userData join userData.profile profile where profile.fullName like :userId or userData.userId like :userId and userData.userId <> :sameUser',[userId:userId,sameUser:sameUser])
		render (view:'../userData/results',model:[users:users,term:params.userId])
	}

	def homePage()
	{
		def response = userDataService.fecthHomePageData(params, session)
		render(view:'homePage',model:[userName:response.userName,followingNames:response.followingNames,followers:response.followers,postTimeList:response.postTimeList,postsList:response.postsList,postUser:response.postUser,fromWall:response.fromWall])
	}

	def viewChange()
	{
		if(session.getAttribute("adminView")==true)
		{
			session.setAttribute("adminView", false)
			redirect(action:'homePage')
		}
		else
		{
			session.setAttribute("adminView", true)
			redirect(action:'list')
		}
	}

	def followUser()
	{
		userDataService.followUserSave(params, session)
		redirect(action:'homePage',controller:'UserData')

	}

	def newUserSignUp()
	{
		def newUser = userDataService.signUpDataSave(params,session)
		if(newUser != null)
		{
			redirect (action:'homePage')
		}
		else
		{
			redirect(action:'index',controller:'login',params:[sameUserId:true])
		}
		
	}

	def checkUserIdAvailability()
	{
		println params
		def availableResponse = userDataService.checkUserId(params)
		render availableResponse as JSON

	}
}
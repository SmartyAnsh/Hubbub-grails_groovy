package com.getsocio

import grails.converters.JSON

class UserController {

    def scaffold = User

    def userService

    /**
     * action to fetch the user page data
     *
     */
    def homePage() {
        println session
        def response = userService.fetchHomePageData(params, session)
        //render response as JSON
        render(view: 'homePage', model: [userName: response?.userName, followingNames: response?.followingNames,
                                         followers: response?.followers,
                                         postTimeList: response?.postTimeList, postsList: response?.postsList,
                                         postUser: response?.postUser, fromWall: response?.fromWall, session: session])
    }

    /**
     * action to change the view from admin to user or user to admin
     *
     */
    def viewChange() {
        if (session.adminView == true) {
            session.adminView = false
            redirect(action: 'homePage')
        } else {
            session.adminView = true
            redirect(action: 'list')
        }
    }

    /**
     * action to follow the user
     *
     */
    def followUser() {
        userService.followUserSave(params)
        redirect(action: 'homePage', controller: 'user')

    }

    /**
     * action to sign up by a new user
     *
     */
    def newUserSignUp() {
        User newUser = userService.signUpDataSave(params)
        if (newUser) {
            session.user = newUser
            session.userId = newUser?.userId
            session.role = newUser?.role
            session.fullName = newUser?.profile?.fullName
            println session
            redirect(action: 'login', controller: 'login', params:[username: newUser?.userId, userPassword: newUser?.password])
        } else {
            redirect(action: 'index', controller: 'login', params: [existingUserId: true])
        }

    }

    /**
     * action to check the availability of userId while signup
     *
     */
    def checkUserIdAvailability() {
        def availableResponse = userService.checkUserId(params)
        render availableResponse as JSON

    }

    def search() {
        [session: session]
    }

    def advSearch() {

    }

    /**
     * action to fetch the results for advance search option
     *
     */
    def advResults() {
        def profiles = userService.fetchResults(params)
        render(view: 'user/advResults', model: [profiles: profiles]);
    }

    /**
     * action to fetch the results for normal search option
     * @return
     */
    def results() {
        def userId = '%' + params.userId + '%'
        def sameUser = (String) session.user
        def users = User.executeQuery('select user from User user join user.profile profile where profile.fullName like :userId or user.userId like :userId and user.userId <> :sameUser', [userId: userId, sameUser: sameUser])
        render(view: 'results', model: [users: users, term: params?.userId, session: session])
    }
    
    def checkSession(){
        println session
        render session.count
    }
}

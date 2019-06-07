package com.getsocio

import grails.converters.JSON

class UserDataController {

    def scaffold = User

    def userService

    def search() {

    }

    def advSearch() {

    }

    /*function to fetch the results for advance search option*/

    def advResults() {
        def profiles = userService.fetchResults(params, session)
        render(view: '../userData/advResults', model: [profiles: profiles]);
    }

    /*function to fetch the results for normal search option*/

    def results() {
        def userId = '%' + params.userId + '%'
        def sameUser = (String) session.getAttribute('user')
        def users = User.executeQuery('select userData from User userData join userData.profile profile where profile.fullName like :userId or userData.userId like :userId and userData.userId <> :sameUser', [userId: userId, sameUser: sameUser])
        render(view: '../userData/results', model: [users: users, term: params?.userId])
    }

    /*function to fetch the userdata to show on homepage*/

    def homePage() {
        //def newMap = ['cat','elephant']
        //println newMap*.size()
        //println newMap.getAt(0).size()
        def response = userService.fetchHomePageData(params, session)
        render(view: 'homePage', model: [userName: response?.userName, followingNames: response?.followingNames, followers: response?.followers, postTimeList: response?.postTimeList, postsList: response?.postsList, postUser: response?.postUser, fromWall: response?.fromWall])
    }

    /*function to change the view from admin to user or user to admin*/

    def viewChange() {
        if (session.getAttribute("adminView") == true) {
            session.setAttribute("adminView", false)
            redirect(action: 'homePage')
        } else {
            session.setAttribute("adminView", true)
            redirect(action: 'list')
        }
    }

    /*function to follow the user*/

    def followUser() {
        userService.followUserSave(params, session)
        redirect(action: 'homePage', controller: 'UserData')

    }

    /*function to sign up by a new user*/

    def newUserSignUp() {
        def newUser = userService.signUpDataSave(params, session)
        if (newUser != null) {
            redirect(action: 'homePage')
        } else {
            redirect(action: 'index', controller: 'login', params: [existingUserId: true])
        }

    }

    /*function to check the availability of userId while signup */

    def checkUserIdAvailability() {
        def availableResponse = userService.checkUserId(params)
        render availableResponse as JSON

    }
}

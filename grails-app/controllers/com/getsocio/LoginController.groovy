package com.getsocio

class LoginController {

    def index(params) {
        render(view: 'index', model: [isUpdated: params?.isUpdated, existingUserId: params?.existingUserId])
    }

    /*function for login*/

    def login() {
        def user
        def userFullName
        def errorMessage
        user = UserData.findByUserIdAndPassword(params?.username, params?.userPassword)

        if (user) {
            session.setAttribute("user", user)
            session.setAttribute('role', user?.role)
            userFullName = user.profile.fullName
            session.setAttribute("fullName", userFullName)
            if (user.role == Role.ADMIN) {
                session.setAttribute("adminView", true)
                redirect(view: 'adminHomePage', controller: 'UserData')
            } else {
                redirect(action: 'homePage', controller: 'userData', params: [user: user])
            }

        } else {
            render(view: 'index', model: [errorMessage: "Please enter right username and password."])
        }
    }

    /*function for logout*/

    def logout(params) {
        session.invalidate()
        redirect(action: 'index', params: [isUpdated: params?.isUpdated])
    }

    def renderChangePassword() {
        render(view: 'changePassword')
    }

    /*function to check credentials for change password or forget password*/

    def checkCredentials(params) {
        def isValid = false
        def isChangedPassword = true
        def userId
        def fullName
        def user
        if (session.getAttribute('user') && session.getAttribute('fullName')) {
            userId = (String) session.getAttribute('user')
            fullName = (String) session.getAttribute('fullName')

        } else {
            userId = params?.userId
            fullName = params?.fullName
        }
        def securityQues
        if (params?.securityQues.equals((String) SecurityQuestion.QUEST1)) {
            securityQues = 'QUEST1'
        } else if (params?.securityQues.equals((String) SecurityQuestion.QUEST2)) {
            securityQues = 'QUEST2'
        } else if (params?.securityQues.equals((String) SecurityQuestion.QUEST3)) {
            securityQues = 'QUEST3'
        }
        if (securityQues && session.getAttribute('user') && session.getAttribute('fullName')) {
            user = UserData.executeQuery('select user from UserData user join user.profile profile where profile.fullName =:fullName and user.userId = :userId and user.securityQues =:securityQues and user.securityAns = :securityAns and user.password = :password ', [userId: userId, fullName: fullName, securityQues: (SecurityQuestion) securityQues, securityAns: params.securityAns, password: params.oldPassword])
            if (user) {
                isValid = true
            }
        } else {
            user = UserData.executeQuery('select user from UserData user join user.profile profile where profile.fullName =:fullName and user.userId = :userId and user.securityQues =:securityQues and user.securityAns = :securityAns', [userId: userId, fullName: fullName, securityQues: (SecurityQuestion) securityQues, securityAns: params.securityAns])
            if (user) {
                isValid = true
                session.setAttribute("user", userId)
                isChangedPassword = false
            } else {
                isChangedPassword = false
            }
        }
        render(template: 'changePassword', model: [isValid: isValid, isChangedPassword: isChangedPassword])
    }

    /*function to change password*/

    def changePassword() {
        def userId
        if (session.getAttribute('user')) {
            userId = (String) session.getAttribute('user')
        } else {

        }
        def isUpdated
        if (params?.newPassword == params?.confirmPassword && params?.newPassword != "") {
            def count = UserData.executeUpdate("update UserData user set user.password = :password where user.userId = :userId ", [userId: userId, password: params.newPassword])
            if (count > 0) {
                isUpdated = true
            }
        }
        redirect(action: 'logout', controller: 'login', params: [isUpdated: isUpdated])
    }
}

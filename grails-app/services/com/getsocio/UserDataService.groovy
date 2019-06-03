package com.getsocio

class UserDataService {

    PostService postService
    def grailsApplication

    /**
     * to fetch results on an advance search
     * @param params
     * @param session
     * @return profilesOfUser
     */
    def fetchResults(params, session) {

        def userFullName = (String) session.getAttribute("fullName")
        println userFullName
        def profileProps = Profile.metaClass.properties*.name
        def profiles = []
        if (params.queryType) {
            if (params.queryType.equalsIgnoreCase("or") || params.queryType.equalsIgnoreCase("and") || (params.queryType.equalsIgnoreCase("Not") && (params.fullName || params.country || params.email))) {
                profiles = Profile.withCriteria {
                    "${params.queryType}"
                            {
                                params.each { field, value ->
                                    if (profileProps.grep(field) && value) {
                                        ilike(field, value)
                                    }
                                }
                            }
                }
            }

        }
        def profilesOfUser = [] as List
        for (int index = 0; index < profiles.size(); index++) {
            if (profiles[index].fullName.equals(userFullName)) {
            } else {
                profilesOfUser.add(profiles[index])
            }
        }

        return profilesOfUser
    }

    /**
     * fetches home page data like Profile Info, Wall (Posts & Comments)
     * followers etc
     * @param params
     * @param session
     * @return
     */
    def fetchHomePageData(params, session) {
        def names
        def userName
        def followingUser = []
        def profile
        def followingNames = []
        def postsList = []
        def followers
        def userId
        Boolean fromWall = false
        if (params?.name) {
            profile = Profile.findByFullName(params?.name)
            userId = UserData.findByProfile(profile).userId
            fromWall = true
        } else {
            userId = (String) session.getAttribute("user")
        }
        def postTimeList
        def postUser = []
        if (userId) {
            userName = UserData.findByUserId(userId)
            followingUser = userName.following
            def followerProfiles = followingUser.each {
                it
                names = UserData.findByUserId(it.toString())
                followingNames.add(names)
            }
            followingNames.each { def name ->
                name.posts.each {
                    postsList.add(it)
                }
            }
            userName.posts.each {
                postsList.add(it)
            }
            postsList.sort { post -> post.id }
            Collections.reverse(postsList)
            postTimeList = postService.timeOfPosts(postsList)
            if (postsList) {
                postUser = Post.executeQuery('select user.profile.fullName from Post posts join posts.user user where posts.content in (:posts) order by posts.id', [posts: postsList?.content])
            }

            for (int index = 0; index < postUser.size(); index++) {
                if (postUser.get(index) == session.getAttribute('fullName')) {
                    postUser[index] = 'Me'
                }
            }
            Collections.reverse(postUser)
            followers = UserData.executeQuery('select users from UserData users join users.following follow1 where follow1.userId=?', [(String) userName])
        }
        if (followingNames) {
            followingNames.sort { following -> following?.profile?.fullName }
        }
        if (followers) {
            followers.sort { follow -> follow?.profile?.fullName }
        }


        def response = [userName: userName, followingNames: followingNames, followers: followers, postTimeList: postTimeList, postsList: postsList, postUser: postUser, fromWall: fromWall]
        return response
    }

    /**
     * function to save the following user details
     * @param params
     * @param session
     * @return
     */
    def followUserSave(params, session) {
        def userId = (String) session.getAttribute('user')
        def user
        if (userId) {
            user = UserData.findByUserId(userId);
        }
        def userFollowed = UserData.executeQuery('select user from UserData user join user.profile profile where profile.id=?', [params.id.toLong()])
        if (params.follow) {
            user.addToFollowing(userFollowed.get(0)).save()
        }
        if (params.unFollow) {
            user.removeFromFollowing(userFollowed.get(0)).save()
        }
    }

    /**
     * function for new user sign-up
     * @param params
     * @param session
     * @return newUser
     */
    def signUpDataSave(params, session) {
        String pathOfDefaultImage = grailsApplication.config.grails.imagePath + "no-image.png"
        File defaultImage = new File(pathOfDefaultImage)
        def securityQues
        if (params?.securityQues.equals((String) SecurityQuestion.QUEST1)) {
            securityQues = 'QUEST1'
        } else if (params?.securityQues.equals((String) SecurityQuestion.QUEST2)) {
            securityQues = 'QUEST2'
        } else if (params?.securityQues.equals((String) SecurityQuestion.QUEST3)) {
            securityQues = 'QUEST3'
        }
        def newUser
        def profile = new Profile(fullName: params?.signUpUsername, country: params?.country, photo: defaultImage.getBytes()).save()
        try {
            newUser = new UserData(userId: params?.userId, password: params.signUpPassword, role: Role.USER, profile: profile, securityQues: securityQues, securityAns: params?.securityAnswer).save(flush: true)
            session.setAttribute('user', newUser)
            session.setAttribute('role', newUser?.role)
            session.setAttribute('fullName', params?.signUpUsername)
        }
        catch (Exception e) {
            e.stackTrace
        }
        return newUser
    }

    /**
     * function to check the availability of userId
     * @param params
     * @return availableResponse
     */
    def checkUserId(params) {
        def availableResponse = [:]
        def isAvailable = false
        def userCount = UserData.findAllByUserIdLike(params.userId).size()
        if (userCount > 0) {
            isAvailable = false
        } else {
            isAvailable = true
        }
        availableResponse = [isAvailable: isAvailable]
        return availableResponse
    }
}

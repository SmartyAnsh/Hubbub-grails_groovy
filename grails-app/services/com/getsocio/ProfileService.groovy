package com.getsocio

class ProfileService {

    /**
     * to fetch profile info depending on session and params values
     * @param params
     * @param session
     * @return response
     */
    def fetchProfileDate(params, session) {
        def profileId
        def profileName
        def profile
        def follower
        //def showProfileFromLink = false
        Boolean isFollowing = false
        def userId = (String) session.getAttribute('user')
        if (params?.id) {
            profileId = params.id
            profile = Profile.findById(profileId)
        }
        if (params?.name) {
            profileName = params?.name
            profile = Profile.findByFullName(profileName)
            // showProfileFromLink = true
        }
        follower = User.findByUserId(userId).following?.profile?.fullName
        follower.each {
            it
            if (it == profile?.fullName) {
                isFollowing = true;
            }
        }
        def response = [profile: profile, follower: follower, isFollowing: isFollowing]
        // [profile:profile,follower:follower,isFollowing:isFollowing,showProfileFromLink:showProfileFromLink]
        return response
    }
}

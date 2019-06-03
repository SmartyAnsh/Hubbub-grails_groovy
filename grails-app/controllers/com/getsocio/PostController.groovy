package com.getsocio

class PostController {

    static transactional = true
    def postService
    def scaffold = Post

    /*function to post from timeline*/

    def post() {
        def profile
        def user
        def userId = (String) session.getAttribute("user")
        user = UserData.findByUserId(userId)
        def post = new Post(params)
        user.addToPosts(post)
        if (user.save(flush: true)) {
            flash.message = "Successfully Posted"
        } else {
            user.discard()
            flash.message = "Invalid or empty post"
        }
        redirect(action: 'timeline', id: params?.id)
    }

    /*function to fetch posts for timeline view*/
    def timeline = {
        def profile
        def user
        def userId = (String) session.getAttribute('user')
        if (userId) {
            user = UserData.findByUserId(userId)
        }
        def userPostsList = user?.posts.toList()
        Collections.reverse(userPostsList)
        def postTimeList = (List) postService.timeOfPosts(userPostsList)
        [user: user, postTimeList: postTimeList, userPostsList: userPostsList]
    }

}

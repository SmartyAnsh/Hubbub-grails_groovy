package com.getsocio

class CommentService {

    /** called by commentsOnPost method in Comment controller
     * fetches comments on post from Wall or timeline view
     * @author 547563 ( Anshul )
     * @param params
     * @return resp
     */
    def fetchComments(params) {
        def comments = []
        def noComments = false
        if (params.postName) {
            def post = Post.findByContent(params.postName)
            comments = Comment.executeQuery('select comments from Comment comments join comments.onPost post where post.content=? order by comments.id', [(String) params.postName])
        }
        if (comments.isEmpty()) {
            noComments = true
        }
        //Collections.reverse(comments)
        def resp = [comments: comments.commentByUser, commentId: comments.id, noComments: noComments, byUser: comments.byUser.profile.fullName]
        return resp
    }
}

package com.getsocio

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class CommentController {

    def commentService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [commentByUserOnPostInstanceList: Comment.list(params), commentByUserOnPostInstanceTotal: Comment.count()]
    }

    def create() {
        [commentByUserOnPostInstance: new Comment(params)]
    }

    def save() {
        def commentByUserOnPostInstance = new Comment(params)
        if (!commentByUserOnPostInstance.save(flush: true)) {
            render(view: "create", model: [commentByUserOnPostInstance: commentByUserOnPostInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost'), commentByUserOnPostInstance.id])
        redirect(action: "show", id: commentByUserOnPostInstance.id)
    }

    def show(Long id) {
        def commentByUserOnPostInstance = Comment.get(id)
        if (!commentByUserOnPostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost'), id])
            redirect(action: "list")
            return
        }

        [commentByUserOnPostInstance: commentByUserOnPostInstance]
    }

    def edit(Long id) {
        def commentByUserOnPostInstance = Comment.get(id)
        if (!commentByUserOnPostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost'), id])
            redirect(action: "list")
            return
        }

        [commentByUserOnPostInstance: commentByUserOnPostInstance]
    }

    def update(Long id, Long version) {
        def commentByUserOnPostInstance = Comment.get(id)
        if (!commentByUserOnPostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (commentByUserOnPostInstance.version > version) {
                commentByUserOnPostInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost')] as Object[],
                        "Another user has updated this CommentByUserOnPost while you were editing")
                render(view: "edit", model: [commentByUserOnPostInstance: commentByUserOnPostInstance])
                return
            }
        }

        commentByUserOnPostInstance.properties = params

        if (!commentByUserOnPostInstance.save(flush: true)) {
            render(view: "edit", model: [commentByUserOnPostInstance: commentByUserOnPostInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost'), commentByUserOnPostInstance.id])
        redirect(action: "show", id: commentByUserOnPostInstance.id)
    }

    def delete(Long id) {
        def commentByUserOnPostInstance = Comment.get(id)
        if (!commentByUserOnPostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost'), id])
            redirect(action: "list")
            return
        }

        try {
            commentByUserOnPostInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost'), id])
            redirect(action: "show", id: id)
        }
    }

    /*function to fetch all comments on a post with user info*/

    def commentsOnPost(params) {
        def resp = commentService.fetchComments(params)
        render resp as JSON
    }

    /*function to save comments on post */

    def saveCommentOfUser(params) {
        def user = UserData.findByUserId((String) session.getAttribute('user'))
        Boolean isSave = false
        def comment
        def post
        def fetchCommentResponse
        if (user) {
            post = Post.findByContent(params?.postName)
            comment = new Comment(commentByUser: (String) params?.comment, byUser: user, onPost: post)
        }
        if (comment.save(flush: true)) {
            isSave = true
            fetchCommentResponse = commentService.fetchComments(params)
        } else {
            isSave = false
        }
        def resp = [isSave: isSave, fetchCommentResponse: fetchCommentResponse]
        render resp as JSON
    }

    /*function to delete comments on post*/

    def deleteComment(params) {
        def isDeleted = false
        if (params?.id) {
            def count = Comment.executeUpdate('delete from Comment where id = ?', [params?.id.toLong()])
            if (count > 0) {
                isDeleted = true
            }
        }
        def resp = [isDeleted: isDeleted]
        render resp as JSON
    }

    /**
     * function to update comment (only by the same user)
     * @param params
     * @return resp as JSON
     */
    def updateComment(params) {
        def isUpdated = false
        if (params?.id) {
            /*"update PrimaryChip chip set chip.chipName=:chipName, chip.status=:status where chip.id=:id",["chipName": name.getAt(index).trim(),"status":(Status)active.getAt(index),"id":Long.valueOf(editIds.getAt(index))])*/
            def count = Comment.executeUpdate('update Comment comment set comment.commentByUser = :comment where id = :id', [id: params?.id.toLong(), comment: params?.comment])
            if (count > 0) {
                isUpdated = true
            }
        }
        def resp = [isUpdated: isUpdated]
        render resp as JSON
    }
}

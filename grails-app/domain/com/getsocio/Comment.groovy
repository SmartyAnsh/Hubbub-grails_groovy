package com.getsocio

class Comment {

    String commentByUser
    User byUser
    Post onPost

    static belongsTo = [Post, User]

    static constraints = {
        commentByUser(blank: false)
        byUser(blank: false)
        onPost(blank: false)
    }

    String toString() {
        "${commentByUser} by ${byUser} on ${onPost}"
    }
}

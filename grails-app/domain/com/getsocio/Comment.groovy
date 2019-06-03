package com.getsocio

class Comment {

    String commentByUser
    UserData byUser
    Post onPost

    static belongsTo = [Post, UserData]

    static constraints = {
        commentByUser(blank: false)
        byUser(blank: false)
        onPost(blank: false)
    }

    String toString() {
        "${commentByUser} by ${byUser} on ${onPost}"
    }
}

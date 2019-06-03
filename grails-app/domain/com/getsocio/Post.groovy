package com.getsocio

class Post {

    String content
    Date dateCreated
    static constraints = {
        content(blank: false)
    }

    static belongsTo = [user: UserData]

    static mapping = {
        sort dateCreated: "desc"
    }

    static hasMany = [tags: Tag, comments: Comment]

    String toString() {
        "${content}"
    }
}

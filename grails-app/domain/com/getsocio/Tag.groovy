package com.getsocio

class Tag {

    String name
    UserData user

    static constraints = {
        name(blank: false)
    }

    static hasMany = [posts: Post]
    static belongsTo = [UserData, Post]

    String toString() {
        "${name}"
    }
}

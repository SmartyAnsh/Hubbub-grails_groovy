package com.getsocio

class User {
    String userId
    String password
    Role role
    SecurityQuestion securityQues
    String securityAns
    String homepage
    Date dateCreated
    Profile profile


    static constraints = {
        userId(size: 3..20, unique: true)
        password(size: 6..8, validator: { passwd, user -> passwd != user.userId })
        homepage(url: true, nullable: true)
        profile(nullable: true)
        role(nullable: true)
        securityQues(blank: false, nullable: false)
        securityAns(blank: false, nullable: false)
    }

    static mapping = {
        profile lazy: false
        posts sort: 'dateCreated'
    }

    static hasMany = [posts: Post, tags: Tag, following: User]

    String toString() {
        "${userId}"
    }
}

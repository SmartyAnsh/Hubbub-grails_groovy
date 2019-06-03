package com.getsocio

class Profile {

    static belongsTo = UserData

    byte[] photo
    String fullName
    String bio
    String homepage
    String email
    String country
    String timezone
    Date dateOfBirth

    static constraints = {
        fullName(nullable: true)
        bio(nullable: true, maxSize: 100)
        homepage(url: true, nullable: true)
        photo(nullable: true)
        country(nullable: true)
        timezone(nullable: true)
        email(email: true, nullable: true)
        dateOfBirth(nullable: true)

    }

    String toString() {
        "${fullName}"
    }

    static mapping = {
        photo column: 'PHOTO', sqlType: 'blob'
    }
}

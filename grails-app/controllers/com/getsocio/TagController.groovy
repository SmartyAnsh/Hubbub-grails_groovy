package com.getsocio

class TagController {

    def scaffold = Tag

    /*function to show all tags related with the user*/
    def myTags() {
        def user
        def tags
        def userId = (String) session.getAttribute("user")
        if (userId) {
            user = UserData.findByUserId(userId)
            tags = Tag.findByUser(user)
        }
        render(view: 'myTags', model: [tags: tags, user: user])
    }

}

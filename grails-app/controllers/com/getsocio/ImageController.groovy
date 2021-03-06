package com.getsocio

import grails.converters.JSON

class ImageController {

    def index() {}

    /*function to render image of profile on wall or on profile show page*/

    def renderImage() {
        def user
        def profile
        if (params.fromDetailsDiv || params.fromDifferentWall) {
            if (!params?.id) {
                user = User.findByUserId((String) session.getAttribute("user"))
            } else {
                profile = Profile.findByFullName((String) params?.id)
                user = User.findByProfile(profile)

            }
        }
        if (params?.fromWall || params?.fullNameParamId) {
            profile = Profile.findByFullName((String) params?.id)
            user = User.findByProfile(profile)
        }
        if (params?.profileShowPage || params?.profileListPage) {
            profile = Profile.findById(params?.id)
            user = User.findByProfile(profile)
        }
        if (user?.profile?.photo) {
            response.setContentLength(user.profile.photo.length)
            response.outputStream.write(user.profile.photo)
        } else {
            response.sendError(404)
        }
    }

    /*function to remove image from profile*/

    def removeImage() {
        Boolean imageRemoved = false
        def profile = Profile.findByFullName((String) params?.userId)
        def user = User.findByProfile(profile)
        String pathOfDefaultImage = grailsApplication.config.grails.imagePath + "no-image.png"
        File defaultImage = new File(pathOfDefaultImage)
        if (defaultImage) {
            user.profile.photo = defaultImage?.getBytes()
            user.save(failOnError:true, flush:true)
            imageRemoved = true
        }
        def resp = [imageRemoved: imageRemoved]
        render resp as JSON

    }

    def allImage() {
    }

    def renderAllImage() {
        def allProfile = Profile.getAll()
        def allPhotos = allProfile[0].photo
        if (allPhotos) {
            response.setContentLength(allPhotos.size())
            allPhotos.each {
                it
                response.outputStream.write(allProfile[0].photo)
            }
        } else {
            response.sendError(404)
        }
    }
}

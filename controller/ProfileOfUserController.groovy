
import java.sql.Blob;

import org.springframework.dao.DataIntegrityViolationException

class ProfileOfUserController {

	def grailsApplication
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[profileOfUserInstanceList: ProfileOfUser.list(params), profileOfUserInstanceTotal: ProfileOfUser.count()]
	}

	def create() {
		
		[profileOfUserInstance: new ProfileOfUser(params)]
	}

	def save() {
		def profileOfUserInstance = new ProfileOfUser(params)
		if(params?.photo?.getBytes().toString().equals("[]"))
		{
			String pathOfDefaultImage = grailsApplication.config.grails.imagePath + "no-image.png"
			//String pathOfDefaultImage = request.contextPath +"/web-app/images/hubbub/no-image.png"
			File defaultImage = new File(pathOfDefaultImage)
			if(defaultImage)
			{
				profileOfUserInstance.photo = defaultImage.getBytes()

			}
		}
		if (!profileOfUserInstance.save(flush: true)) {
			render(view: "create", model: [profileOfUserInstance: profileOfUserInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'profileOfUser.label', default: 'ProfileOfUser'), profileOfUserInstance.id])
		redirect(action: "show", id: profileOfUserInstance.id)
	}

	def show(Long id) {
		def profileOfUserInstance = ProfileOfUser.get(id)
		if (!profileOfUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'profileOfUser.label', default: 'ProfileOfUser'), id])
			redirect(action: "list")
			return
		}

		[profileOfUserInstance: profileOfUserInstance]
	}

	def edit(Long id) {
		def profileOfUserInstance = ProfileOfUser.get(id)
		if (!profileOfUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'profileOfUser.label', default: 'ProfileOfUser'), id])
			redirect(action: "list")
			return
		}

		[profileOfUserInstance: profileOfUserInstance]
	}

	def update(Long id, Long version) {
		def profileOfUserInstance = ProfileOfUser.get(id)

		if (!profileOfUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'profileOfUser.label', default: 'ProfileOfUser'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (profileOfUserInstance.version > version) {
				profileOfUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[message(code: 'profileOfUser.label', default: 'ProfileOfUser')] as Object[],
						"Another user has updated this ProfileOfUser while you were editing")
				render(view: "edit", model: [profileOfUserInstance: profileOfUserInstance])
				return
			}
		}
		
		if(params.photo.getBytes().toString().equals("[]"))
		{
			/*//String pathOfDefaultImage = "C://Users/547563/Documents/Hubbub1_New/Hubbub1/web-app/images/hubbub/no-image.png"
			String pathOfDefaultImage = grailsApplication.config.grails.imagePath  + "no-image.png"
			//String pathOfDefaultImage = request.contextPath +"/web-app/images/hubbub/no-image.png"
			File defaultImage = new File(pathOfDefaultImage)
			if(defaultImage)
			{
				profileOfUserInstance.photo = defaultImage.getBytes()

			}*/
			profileOfUserInstance.fullName = params.fullName
			profileOfUserInstance.bio = params.bio
			profileOfUserInstance.homepage = params.homepage
			profileOfUserInstance.country = params.country
			profileOfUserInstance.timezone = params.timezone
			profileOfUserInstance.email = params.email
		}
		else
		{
			profileOfUserInstance.properties = params
		}
		if (!profileOfUserInstance.save(flush: true)) {
			render(view: "edit", model: [profileOfUserInstance: profileOfUserInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'profileOfUser.label', default: 'ProfileOfUser'), profileOfUserInstance.id])
		redirect(action: "show", id: profileOfUserInstance.id)
	}

	def delete(Long id) {
		def profileOfUserInstance = ProfileOfUser.get(id)
		if (!profileOfUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'profileOfUser.label', default: 'ProfileOfUser'), id])
			redirect(action: "list")
			return
		}

		try {
			profileOfUserInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'profileOfUser.label', default: 'ProfileOfUser'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'profileOfUser.label', default: 'ProfileOfUser'), id])
			redirect(action: "show", id: id)
		}
	}
	ProfileService profileService

	def userProfile()
	{
		def userId = (String)session.getAttribute("user")
		if(userId)
		{
			def user = UserData.findByUserId(userId)
			render(view:'show',model:[profileOfUserInstance:user.profile,user:user])
		}
	}

	def showProfile()
	{
		def response = profileService.fetchProfileDate(params,session)
		[profile:response.profile,follower:response.follower,isFollowing:response.isFollowing]
	}

	/*def uploadImage()
	 {
	 println session
	 def user = UserData.findByUserId((String)session.getAttribute("user"))
	 def profile = user.profile
	 println "user" +user
	 println "profile" +profile
	 def file = request.getFile('photo')
	 if (file && !file.empty) {
	 println "file prop " +file.getProperties()
	 println "params " +params
	 def puc = new PhotoUploadCommand(photo:file.getBytes(),userId:(String)session.getAttribute('user'))
	 println "puc " +puc.photo
	 profile.photo = puc.photo
	 println "profile " +profile.photo
	 }
	 profile.save(flush:true)
	 render(view:'show',model:[profileOfUserInstance:user.profile,user:user])
	 }*/

}

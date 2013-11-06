
import java.sql.Blob;
import java.sql.Clob;

class ProfileOfUser {

	static belongsTo = UserData
	
	byte[] photo
	String fullName
	String bio
	String homepage
	String email
	String country
	String timezone
	
    static constraints = {
		fullName(nullable:true)
		bio(nullable:true,maxSize:100)
		homepage(url:true,nullable:true)
		photo(nullable:true)
		country(nullable:true)
		timezone(nullable:true)
		email(email:true,nullable:true)
		
    }
	
	String toString()
	{
		"Profile for ${fullName} (${id})" 
	}
	
	static mapping = {
			photo column :'PHOTO', sqlType:'blob'	
	}
}

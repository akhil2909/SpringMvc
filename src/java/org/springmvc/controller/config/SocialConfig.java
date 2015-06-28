package com.sociallogin.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.social.UserIdSource;
import org.springframework.social.config.annotation.ConnectionFactoryConfigurer;
import org.springframework.social.config.annotation.SocialConfigurer;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.linkedin.connect.LinkedInConnectionFactory;
import org.springframework.social.security.AuthenticationNameUserIdSource;

import com.sociallogin.dao.UsersDao;

//import se.callista.oauth.socialmedia.demo.services.AccountConnectionSignUpService;

//import se.callista.oauth.socialmedia.demo.dao.UsersDao;

public class SocialConfig implements SocialConfigurer {

	@Autowired
    private DataSource dataSource;

    @Autowired
    private UsersDao usersDao;
    
	@Override
	public void addConnectionFactories(ConnectionFactoryConfigurer connectionFactoryConfigurer,
			Environment environment) {
		// TODO Auto-generated method stub
		connectionFactoryConfigurer.addConnectionFactory(new FacebookConnectionFactory("app_id", "app_secret_key"));
		connectionFactoryConfigurer.addConnectionFactory(new LinkedInConnectionFactory("appId","app_secret_key"));
		connectionFactoryConfigurer.addConnectionFactory(new GoogleConnectionFactory("appId","appSecretKey"));
		
	}

	@Override
	public UserIdSource getUserIdSource() {
		// TODO Auto-generated method stub
		 return new AuthenticationNameUserIdSource();
	}

	 @Override
	    public UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
	        JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(dataSource,connectionFactoryLocator, Encryptors.noOpText());
	        repository.setConnectionSignUp(new com.sociallogin.services.AccountConnectionSignUpService(usersDao));
	        return repository;
	    }
	
	
	
	

}

package com.karis.groupprojectfinal.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.karis.groupprojectfinal.models.User;
import com.karis.groupprojectfinal.repositories.UserRepository;





@Service
public class UserService {
    private final UserRepository userRepository;
    
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    // register/edit user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return this.userRepository.save(user);
    }
    

    public User save(User user)
    {
    	return this.userRepository.save(user);
    }
    
    
   // find user by email
    public User findByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
    
    // find all by email
    public User findAllByEmail(String email) {
        return this.userRepository.findAllByEmail(email);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = this.userRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = this.userRepository.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    public User getUserByEmail(String email)
    {
    	return this.userRepository.findByEmail(email);
    }
    
}

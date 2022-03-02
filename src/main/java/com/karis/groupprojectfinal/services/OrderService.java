package com.karis.groupprojectfinal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.karis.groupprojectfinal.models.Order;
import com.karis.groupprojectfinal.models.User;
import com.karis.groupprojectfinal.repositories.OrderRepository;



@Service
public class OrderService {
    
    @Autowired
    private OrderRepository orderRepository;
    
    
    public List<Order> getAllOrders()
    {
    	return orderRepository.findAll();
    }

//    
    //find idea by id
    public Order findOrderById(Long id) {
    	Optional<Order> order = this.orderRepository.findById(id);
    	
    	if(order.isPresent()) {
            return order.get();
    	} else {
    	    return null;
    	}
    }
    
    public Order save(Order order)
    {
    	return this.orderRepository.save(order);
    }
    

    public void delete(Long id)
    {
    	orderRepository.deleteById(id);
    }
    
    public void like(User user, Order order)
    {
//    	List<User> usersWhoLiked = idea.getLikers();
//    	usersWhoLiked.add(user);
    	order.getLikers().add(user);
    	this.orderRepository.save(order);
    }
    
    
    public void unlike(User user, Order order)
    {
//    	List<User> usersWhoLiked = idea.getLikers();
//    	usersWhoLiked.remove(user);
    	order.getLikers().remove(user);
    	this.orderRepository.save(order);
    }
    
    
//    public View incrementView(User user, Algo algo)
//    {
//    	Integer viewCount = algo.getViews().size();
//    	View newView = new View(user, algo, viewCount+1);
//	  	return this.viewRepository.save(newView);
//    }
//    

    
}

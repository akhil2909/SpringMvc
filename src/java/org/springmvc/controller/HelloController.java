/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springmvc.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author Akhil Bhai
 */
@Controller
public class HelloController {

   @RequestMapping("/welcome")
    public ModelAndView helloWorld() {
        ModelAndView modelandview = new ModelAndView("social");
        modelandview.addObject("welcomeMessage", "Hi User, welcome to the first Spring MVC Application");
        return modelandview;
    }
    
    @RequestMapping("/hello/{uname}")
    public ModelAndView helloWorld1(@PathVariable("uname") String uname) {
        ModelAndView modelandview = new ModelAndView("index");
        modelandview.addObject("welcomeMessage", "Hello User "+uname);
        return modelandview;
    }
    
    
    @RequestMapping("/yo/{country}/{uname}")
    public ModelAndView pathVariable(@PathVariable Map<String, String> pathVar){
        
        String country = pathVar.get("country");
        String uname = pathVar.get("uname");
        
         ModelAndView modelandview = new ModelAndView("index");
        modelandview.addObject("welcomeMessage", "Hello User "+uname+" from "+country);
        return modelandview;
        
    }
    
    

}

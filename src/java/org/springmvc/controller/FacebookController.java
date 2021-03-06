/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.springmvc.controller;

import javax.inject.Inject;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Akhil Bhai
 */
@Controller
@RequestMapping("/")
public class FacebookController {
    
    private Facebook facebook;
    
     @Inject
    public FacebookController(Facebook facebook) {
        this.facebook = facebook;
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public String helloFacebook(Model model) {
        if (!facebook.isAuthorized()) {
            return "redirect:/connect/facebook";
        }

        model.addAttribute(facebook.userOperations().getUserProfile());
//        PagedList homeFeed = facebook.feedOperations().getHomeFeed();
//        model.addAttribute("feed", homeFeed);

        return "feeds";
    }

}

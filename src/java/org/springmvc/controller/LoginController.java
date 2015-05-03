/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Akhil Bhai
 */
@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginForm() {

        ModelAndView modelandview = new ModelAndView("login");
//        modelandview.addObject("welcomeMessage", "Hello User "+uname);
        return modelandview;
    }

    @RequestMapping(value = "/login1", method = RequestMethod.GET)
    public ModelAndView loginForm2() {

        ModelAndView modelandview = new ModelAndView("login1");
//        modelandview.addObject("welcomeMessage", "Hello User "+uname);
        return modelandview;
    }

    @RequestMapping(value = "/loginSubmit", method = RequestMethod.POST)
    public ModelAndView loginSubmit(@RequestParam("username") String uname, @RequestParam("email") String email) {
        ModelAndView modelandview = new ModelAndView("index");
        modelandview.addObject("welcomeMessage", "Hello User " + uname + " email : " + email);
        return modelandview;
    }

//    @RequestMapping(value = "/loginSubmit1", method = RequestMethod.POST)
//    public ModelAndView loginSubmit(@ModelAttribute("student1") Student student1) {
//        ModelAndView modelandview = new ModelAndView("welcome");
////        modelandview.addObject("welcomeMessage", "Hello User "+uname+" email : "+email);
//        return modelandview;
//    }

    @RequestMapping(value = "/loginSubmit1", method = RequestMethod.POST)
    public ModelAndView submitAdmissionForm(@ModelAttribute("student1") Student student1) {

        ModelAndView model = new ModelAndView("welcome");
        model.addObject("headerMessage", "Model Attribute");
        return model;
    }

    }

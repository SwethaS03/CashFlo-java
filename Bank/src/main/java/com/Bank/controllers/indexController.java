package com.Bank.controllers;
import com.Bank.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class indexController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public ModelAndView getIndex(){
        ModelAndView getIndexPage = new ModelAndView("index");
        getIndexPage.addObject("PageTitle","Home");
        System.out.println("In Index Page controller");
        return getIndexPage;
    }

    @GetMapping("/error")
    public ModelAndView getError(){
        ModelAndView getErrorPage = new ModelAndView("error");
        System.out.println("In Error Page controller");
        getErrorPage.addObject("PageTitle","Errors");
        return getErrorPage;
    }

    @GetMapping("/verify")
    public ModelAndView getVerify(@RequestParam("token") String token, @RequestParam("code") String code){
        ModelAndView getVerifyPage;

        // Get Token In Database:
        String dbToken = userRepository.checkToken(token);

        // Check If Token Is Valid:
        if(dbToken == null){
            getVerifyPage  = new ModelAndView("error");
            getVerifyPage.addObject("error", "This Session Has Expired");
            return  getVerifyPage;
        }

        userRepository.verifyAccount(token, code);
        getVerifyPage = new ModelAndView("login");
        getVerifyPage.addObject("success", "Account Verified Successfully, Please proceed to Log In!");

        System.out.println("In Verify Account Controller");
        return getVerifyPage;
    }

}

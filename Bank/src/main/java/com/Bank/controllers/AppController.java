package com.Bank.controllers;

import com.Bank.models.Account;
import com.Bank.models.User;
import com.Bank.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    private AccountRepository accountRepository;

    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session){
        ModelAndView getDashboardPage = new ModelAndView("dashboard");

        // Get the details of the logged i user:
        User user = (User)session.getAttribute("user");

        // Get The Accounts Of The Logged In User:
        List<Account> getUserAccounts = accountRepository.getUserAccountsById(user.getUser_id());

        // Get Balance:
        BigDecimal totalAccountsBalance = accountRepository.getTotalBalance(user.getUser_id());

        // Set Objects:
        getDashboardPage.addObject("userAccounts", getUserAccounts);
        getDashboardPage.addObject("totalBalance", totalAccountsBalance);

        return getDashboardPage;
    }
}

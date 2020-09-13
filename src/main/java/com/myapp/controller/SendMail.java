package com.myapp.controller;


import com.myapp.model.UserDto;
import com.myapp.util.MailOperation;
import com.myapp.util.Mytools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping(value = "/mail", method = GET)
public class SendMail {
    private static Logger logger = LoggerFactory.getLogger(SendMail.class);

    @RequestMapping(method = GET)
    public void manager(HttpServletResponse response, HttpSession session, @RequestParam("user_mail") String user_mail) throws IOException {
        UserDto u;
        u = (UserDto) session.getAttribute("user");
        if (u != null) {
            user_mail = u.getEmail();
        }
        if (user_mail == null && u == null) {
            return;
        }
        response.getWriter().print(Mytools.sendmail(user_mail));
    }
}
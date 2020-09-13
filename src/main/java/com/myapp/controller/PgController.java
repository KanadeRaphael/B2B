package com.myapp.controller;

import com.myapp.model.UserDto;
import com.myapp.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping(value = "/page", method = GET)
public class PgController {
    @Autowired
    private com.myapp.service.ReviewService ReviewService;
    @RequestMapping(value = "/review", method = GET)
    public ModelAndView toSingleGoods(HttpSession session, @RequestParam("pnR") int pnR, @RequestParam("goods_id") int goods_id) {
        ModelAndView mv = new ModelAndView("shop/review");
        mv.addObject("goods_id", goods_id);
        mv.addObject("reviews", ReviewService.getReview(goods_id, pnR,5));
        mv.addObject("pnR", pnR);
        return mv;
    }
}

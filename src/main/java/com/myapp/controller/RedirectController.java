package com.myapp.controller;

import com.myapp.entity.User;
import com.myapp.model.CartDTO;
import com.myapp.model.TempCartDTO;
import com.myapp.model.UserDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/to")
public class RedirectController {
    private static Logger logger = LoggerFactory.getLogger(RedirectController.class);
    @Autowired
    private com.myapp.service.GoodsService GoodsService;
    @Autowired
    private com.myapp.service.ReviewService ReviewService;
    @Autowired
    private com.myapp.service.AddressService AddressService;
    @Autowired
    private com.myapp.service.CartService CartService;
    @Autowired
    private com.myapp.service.OrderService OrderService;

    @RequestMapping(value = "/singlegoods", method = GET)
    public ModelAndView toSingleGoods(HttpSession session, @RequestParam("id") int goods_id) {
        ModelAndView mv = new ModelAndView("singlegoods");
        UserDto u = new UserDto();
        u = (UserDto)session.getAttribute("user");
        int myid=0;
        if(u!=null){
            myid= u.getId();
        }
        mv.addObject("detail", GoodsService.getGoodsByid(goods_id, myid));
        mv.addObject("related", GoodsService.getRelatedGoods(goods_id, myid, 8));
        mv.addObject("hot", GoodsService.getHotGoods(myid, 14));
        return mv;
    }

    @RequestMapping(value = "/review", method = GET)
    public ModelAndView toReview(HttpSession session, @RequestParam("goods_id") int goods_id) {
        ModelAndView mv = new ModelAndView("shop/review");
        int pnR = 1;  //模拟数据
        mv.addObject("goods_id", goods_id);
        mv.addObject("reviews", ReviewService.getReview(goods_id, pnR, 5));
        mv.addObject("pnR", pnR);
        return mv;
    }

    @RequestMapping(value = "/checkout1", method = GET)  //直接购买
    public ModelAndView toCheckout1(HttpSession session, TempCartDTO c) {
        ModelAndView mv = new ModelAndView("checkout");
        UserDto u = new UserDto();
        u = (UserDto)session.getAttribute("user");
        int myid=0;
        if(u!=null){
            myid= u.getId();
        }
        List<CartDTO> cd = new ArrayList<CartDTO>();
        cd.add(CartService.sortCart(c));
        session.setAttribute("cart", cd);
        session.setAttribute("address", AddressService.getAddress(myid));
        return mv;
    }

    @RequestMapping(value = "/checkout2", method = GET)  //购物车结算
    public ModelAndView toCheckout2(HttpSession session, @RequestParam("cartid") int[] cart_id) {
        ModelAndView mv = new ModelAndView("checkout");
        UserDto u = new UserDto();
        u = (UserDto)session.getAttribute("user");
        int myid=0;
        if(u!=null){
            myid= u.getId();
        }
        List<CartDTO> cd = new ArrayList<CartDTO>();
        cd.addAll(CartService.sortCart(cart_id));
        session.setAttribute("cart", cd);
        session.setAttribute("address", AddressService.getAddress(myid));
        return mv;
    }

    @RequestMapping(value = "/checkdone", method = POST)
    public ModelAndView toCheckDone(HttpSession session, @RequestParam("address") int address, @RequestParam("type") short type) {
        ModelAndView mv = new ModelAndView("checkdone");
        UserDto u = new UserDto();
        BigDecimal transfee = new BigDecimal(2);
        u = (UserDto)session.getAttribute("user");
        int myid=0;
        if(u!=null){
            myid= u.getId();
        }
        short status = (short) 1;
        BigDecimal totalprice = new BigDecimal(0);
        List<CartDTO> lcd = (List<CartDTO>) session.getAttribute("cart");
        for (CartDTO cd : lcd) {
            totalprice = totalprice.add(cd.getPrice().multiply(new BigDecimal(cd.getNumber()))).add(transfee);
        }
        if (totalprice.compareTo(u.getBalance()) < 0) status = (short) 2;  //虚拟
        u.setBalance(OrderService.save(lcd, address, type, status, transfee, myid, totalprice));
        session.setAttribute("user",u);
        mv.addObject("address", AddressService.getAddressById(address));
        return mv;
    }

    @RequestMapping(value = "/index", method = GET)
    public ModelAndView toIndex(HttpSession session) {
        ModelAndView mv = new ModelAndView("redirect:/");
        session.removeAttribute("cart");
        session.removeAttribute("address");
        return mv;
    }

}

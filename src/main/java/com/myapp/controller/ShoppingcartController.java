package com.myapp.controller;


import com.myapp.model.ShoppingCartDto;
import com.myapp.model.UserDto;
import com.myapp.service.ShoppingcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("shoppingController")
public class ShoppingcartController {
    private Integer user_id;
    @Autowired
    private ShoppingcartService shoppingcartService;
    @Autowired
    private HttpSession session;
    @Autowired
    private HttpServletRequest request;


    @RequestMapping(value = "/gotoshoppingcart")
    public ModelAndView gotoShoppingcart(UserDto userDto) {
        ModelAndView modelAndView = new ModelAndView();
        userDto= (UserDto) session.getAttribute("user");
        int fg=0;
        if(userDto==null){
            modelAndView.addObject("fg", fg);
            modelAndView.setViewName("index2");
        }else{
                fg=1;
                user_id = userDto.getId();
                List<ShoppingCartDto> shoppingCartDto = shoppingcartService.getShoppingcart(userDto);
                modelAndView.addObject("fg", fg);
                modelAndView.addObject("shoppingcart", shoppingCartDto);
                modelAndView.setViewName("index2");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deletegoods")
    public ModelAndView deleteGoods(ShoppingCartDto shoppingCartDto){
        UserDto userDto = new UserDto();
        userDto.setId(user_id);
        shoppingcartService.deleteShoppingcart(shoppingCartDto);
        return gotoShoppingcart(userDto);
    }
    @RequestMapping(value = "/deletegoodsAll")
    public ModelAndView deleteGoodsAll(){
        UserDto userDto = new UserDto();
        userDto.setId(user_id);
        shoppingcartService.deleteShoppingcartAll(userDto);
        return gotoShoppingcart(userDto);
    }

    @RequestMapping(value = "/jiesuan")
    public List<Integer> Jiesuan(){
        String str = request.getParameter("tt");
        List<Integer> gid=new ArrayList<>();
        List<ShoppingCartDto> shoppingCartDtos=shoppingcartService.saveShoppingcart(str,user_id);
        for (int i=0;i<shoppingCartDtos.size();i++){
            ShoppingCartDto shoppingCartDto = new ShoppingCartDto();
            shoppingCartDto = shoppingCartDtos.get(i);
            int ii;
            ii=shoppingCartDto.getGoodsid();
            gid.add(ii);
        }
        return gid;
    }
    @RequestMapping(value = "/jianshao")
    public ModelAndView Jianshao(ShoppingCartDto shoppingCartDto){
        UserDto userDto = new UserDto();
        userDto.setId(user_id);
        String str = request.getParameter("number");
        shoppingcartService.updateJianshao(str,shoppingCartDto);
        return gotoShoppingcart(userDto);
    }

    @RequestMapping(value = "/zengjia")
    public ModelAndView Zengjia(ShoppingCartDto shoppingCartDto){
        UserDto userDto = new UserDto();
        userDto.setId(user_id);
        String str = request.getParameter("number");
        shoppingcartService.updateZengjia(str,shoppingCartDto);
        return gotoShoppingcart(userDto);
    }
}

package com.myapp.controller;

import com.alibaba.fastjson.JSON;
import com.myapp.entity.User;
import com.myapp.model.*;
import com.myapp.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class UserHomeController {

    @Autowired
    private OrderService orderServiceImpl;
    @Autowired
    private UserService userServiceImpl;
    @Autowired
    private GoodsService goodsServiceImpl;
    @Autowired
    UserService userService;
    @Autowired
    AddressService addressService;
    @Autowired
    OrderService orderService;
    @Autowired
    FollowService followService;

    private static Logger logger = LoggerFactory.getLogger("UserHomeController.class");

    @RequestMapping("/")
    public ModelAndView Home() {
        ModelAndView modelAndView = new ModelAndView("index");
        List<GoodsDto> list = goodsServiceImpl.findIndexGoods();
        modelAndView.addObject("goods", list);
        return modelAndView;
    }

    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
    @ResponseBody
    public Json login(UserDto user, HttpSession session) {
        Json j = new Json();
        UserDto u = userServiceImpl.login(user);
        if (u != null) {
            j.setSuccess(true);
            j.setMsg("登录成功");
            session.setAttribute("user", u);
            j.setObj(u);
        } else {
            j.setMsg("密码或账号错误");
        }
        System.out.println(JSON.toJSONString(j));
        return j;
    }

    @RequestMapping(value = "/userRegister", method = RequestMethod.POST)
    @ResponseBody
    public Json register(UserDto u, HttpSession session) {
        Json j = new Json();
        u.setRegisterTime(new Date());
        try {
            userServiceImpl.register(u);
            j.setSuccess(true);
            j.setMsg("注册成功");
            j.setObj(u);
            session.setAttribute("user", u);
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        System.out.println(JSON.toJSONString(j));
        return j;
    }

    @RequestMapping(value = "/search")//, method = RequestMethod.POST
    public ModelAndView search2(HttpSession session,
                                @RequestParam(value = "keyword", required = false) String keyword,
                                @RequestParam(value = "mode", required = false, defaultValue = "0") int mode) {
        ModelAndView modelAndView = new ModelAndView("shop/search");
//        if (keyword == null) keyword = (String) session.getAttribute("keyword");
        modelAndView.addObject("searchResult", goodsServiceImpl.findGoods(keyword, mode));
        modelAndView.addObject("searchMsg", keyword);
        modelAndView.addObject("mode", mode);
//        session.setAttribute("keyword", keyword);
        return modelAndView;
    }

    //---------------------------------------------------------------------------

    @RequestMapping("/userHome")
    public ModelAndView toHome(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("home/userHome");
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userDto != null) {
            //关注的商品数量
            modelAndView.addObject("followCount", goodsServiceImpl.getFollowGoodsCount(userDto.getId()));
            //最近的几个订单
            modelAndView.addObject("recentOrders", orderServiceImpl.findRecent(userDto.getId()));
        }
        return modelAndView;
    }

    //---------------------------------------------------------------------------

    @RequestMapping("/userInfo")
    public ModelAndView toInfo(HttpSession session) {
        ModelAndView mav = new ModelAndView("home/userInfo");
        Integer userId = ((UserDto) session.getAttribute("user")).getId();
        mav.addObject("defaultOrder", addressService.getDefault(userId));
        return mav;
    }

    @RequestMapping(value = "/updateBaseInfo", method = RequestMethod.POST)
    public String updateBaseInfo(HttpSession session, UserDto userDto) {
        logger.info("更新用户基本信息");
        UserDto origin = (UserDto) session.getAttribute("user");
        origin.setNick(userDto.getNick());
        origin.setTrueName(userDto.getTrueName());
        origin.setGender(userDto.getGender());
        origin.setBirthday(userDto.getBirthday());
        origin.setMobile(userDto.getMobile());
        userService.update(origin);
        session.setAttribute("user", origin);
        return "redirect:/userInfo";
    }

    @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
    public ModelAndView updateProfile(HttpSession session, @RequestParam MultipartFile image) throws IOException {
        ModelAndView mav = new ModelAndView("home/userInfo");
        if (!image.isEmpty()) {
            //上传图片
            UserDto origin = (UserDto) session.getAttribute("user");
            //获取文件名
            String fname = image.getOriginalFilename();
            //获取扩展名 并判断   substring(int index) 返回一个以index为索引作为起点的含头不含尾的后面的字符串
            String suffix = fname.substring(fname.lastIndexOf(".") + 1).toLowerCase();
            if (!confirmSuffix(suffix)) {
                mav.addObject("message", "图片格式有误");
                return mav;
            }
            //确认目录路径  建在WebRoot目录下--fileupload
            String path = session.getServletContext().getRealPath("/image/profile/");
            //删除原文件
            if (origin.getProfile() != null) {
                File originFile = new File(path, origin.getProfile());
                if (originFile.delete()) {
                    logger.info("删除用户原来的头像，成功！");
                }
            }
            //修改文件名
            fname = origin.getId() + "." + suffix;
            //文件路径
            File filepath = new File(path, fname);
            //判断路径是否存在，不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                if (filepath.getParentFile().mkdirs()) {
                    logger.info("父目录创建完毕");
                }
            }
            image.transferTo(filepath); // 会上传到服务器中的路径
            logger.info("保存头像路径到数据库");
            origin.setProfile(fname);
            userService.update(origin);
            session.setAttribute("user", origin);
            mav.addObject("message", "上传完毕");
            return mav;
        }
        mav.addObject("message", "获取图片失败");
        return mav;
    }

    //---------------------------------------------------------------------------

    @RequestMapping("/userAddress")
    public ModelAndView userAddress(HttpSession session) {
        logger.info("跳转、刷新收货地址页面");
        ModelAndView mav = new ModelAndView("home/userAddress");
        Integer userId = ((UserDto) session.getAttribute("user")).getId();
        mav.addObject("addresses", addressService.findByUserId(userId));
        return mav;
    }

    @RequestMapping("/changeDefault")
    public ModelAndView changeDefault(AddressDto addressDto, HttpSession session) {
        logger.info("修改默认地址");
        ModelAndView mav = new ModelAndView("redirect:/userAddress");
        Integer userId = ((UserDto) session.getAttribute("user")).getId();
        addressService.changeDefault(userId, addressDto.getId());
        return mav;
    }

    @RequestMapping(value = "/saveOrUpdateAddress", method = RequestMethod.POST)
    public ModelAndView saveOrUpdateAddress(AddressDto addressDto, HttpSession session) {
        logger.info("添加或更新地址");
        ModelAndView mav = new ModelAndView("redirect:/userAddress");
        Integer userId = ((UserDto) session.getAttribute("user")).getId();
        addressDto.setUserId(userId);
        addressService.saveOrUpdate(addressDto);
        return mav;
    }

    @RequestMapping("/deleteAddress")
    public ModelAndView deleteAddress(AddressDto addressDto) {
        logger.info("删除地址");
        ModelAndView mav = new ModelAndView("redirect:/userAddress");
        addressService.delete(addressDto);
        return mav;
    }

    //---------------------------------------------------------------------------

    @RequestMapping("/userOrder")
    public ModelAndView userOrder(HttpSession session, Integer mark) {
        logger.info("跳转、刷新订单页面");
        ModelAndView mav = new ModelAndView("home/userOrder");
        Integer userId = ((UserDto) session.getAttribute("user")).getId();
        mav.addObject("orders", orderService.findByUserId(userId, mark));
        mav.addObject("mark", mark);
        return mav;
    }

    @RequestMapping("/pay")
    public String pay(HttpSession session, OrderDto orderDto, Integer mark, String from) {
        logger.info("付款");
        String to = null;
        if (from.equals("space")) {
            to = "redirect:/userOrder?mark=" + mark;
        } else if (from.equals("home")) {
            to = "redirect:/userHome";
        }
        UserDto u = (UserDto) session.getAttribute("user");
        BigDecimal newBalance = orderService.pay(orderDto.getId(), u.getBalance());
        if (newBalance == null) {
            JOptionPane.showMessageDialog(new JFrame().getContentPane(), "余额不足！", "系统信息", JOptionPane.INFORMATION_MESSAGE);
        } else {
            u.setBalance(newBalance);
            session.setAttribute("user", u);
        }
        return to;
    }

    @RequestMapping("/takeOver")
    public String takeOver(OrderDto orderDto, Integer mark, String from) {
        logger.info("确认收货");
        orderService.takeOver(orderDto.getId());
        String to = null;
        if (from.equals("space")) {
            to = "redirect:/userOrder?mark=" + mark;
        } else if (from.equals("home")) {
            to = "redirect:/userHome";
        }
        return to;
    }

    @RequestMapping("/cancelOrder")
    public String cancelOrder(OrderDto orderDto, Integer mark, String from) {
        logger.info("取消订单并更新库存");
        orderService.cancelOver(orderDto.getId());
        String to = null;
        if (from.equals("space")) {
            to = "redirect:/userOrder?mark=" + mark;
        } else if (from.equals("home")) {
            to = "redirect:/userHome";
        }
        return to;
    }

    @RequestMapping("/deleteOrder")
    public String deleteOrder(OrderDto orderDto, Integer mark) {
        logger.info("删除订单");
        orderService.delete(orderDto.getId());
        return "redirect:/userOrder?mark=" + mark;
    }

    //---------------------------------------------------------------------------

    @RequestMapping("/userFollow")
    public ModelAndView userFollow(HttpSession session) {
        logger.info("跳转、刷新关注页面");
        ModelAndView mav = new ModelAndView("home/userFollow");
        Integer userId = ((UserDto) session.getAttribute("user")).getId();
        mav.addObject("follows", followService.findByUserId(userId));
        return mav;
    }

    @RequestMapping("/deleteFollow")
    public String deleteFollow(FollowDto followDto) {
        logger.info("取消关注");
        followService.delete(followDto);
        return "redirect:/userFollow";
    }

    private boolean confirmSuffix(String suffix) {
        return suffix.equals("jpg") || suffix.equals("gif") || suffix.equals("png") || suffix.equals("svg") || suffix.equals("jpeg");
    }
}

package com.myapp.controller;

import com.myapp.entity.Follow;
import com.myapp.entity.Reviews;
import com.myapp.entity.ShoppingCart;
import com.myapp.model.UploadRVDTO;
import com.myapp.model.UserDto;
import com.myapp.service.CartService;
import com.myapp.service.FollowService;
import com.myapp.service.ReviewService;
import com.myapp.service.UserService;
import com.myapp.util.Mytools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/fun")
public class SingleFunController {
    private static Logger logger = LoggerFactory.getLogger(SingleFunController.class);
    @Autowired
    private CartService CartService;
    @Autowired
    private FollowService FollowService;
    @Autowired
    private UserService UserService;
    @Autowired
    private ReviewService ReviewService;

    @RequestMapping(value = "/add2Cart", method = GET)
    public void add2Cart(HttpServletResponse response, HttpSession session, ShoppingCart sc, @RequestParam("goods_id") int gid) throws IOException {
        UserDto u;
        u = (UserDto) session.getAttribute("user");
        int myid = 0;
        if (u != null) {
            myid = u.getId();
        }
        CartService.saveCart(sc, myid, gid);
        response.getWriter().println("加入购物车成功");
    }

    @RequestMapping(value = "/alterPsw", method = POST)
    public void alterPsw(HttpServletResponse response, HttpSession session,
                         @RequestParam("password") String password,
                         @RequestParam(value = "email", required = false) String email) throws IOException {
        UserDto u;
        u = (UserDto) session.getAttribute("user");
        int myid = 0;
        if (u != null) {
            myid = u.getId();
        } else {
            u = UserService.getUserByEmail(email);
            myid = u.getId();
        }

        String msg = UserService.alterPsw(password, myid);
        response.getWriter().println(msg);
    }

    @RequestMapping(value = "/add2Follow", method = GET)
    public void add2Follow(HttpServletResponse response, @RequestParam("goods_id") int gid) throws IOException {
        Follow f = new Follow();
        FollowService.changeFollow(f, 1, gid);
        response.getWriter().println("操作成功");
    }

    @RequestMapping(value = "/review", method = POST)
    public ModelAndView review(HttpSession session, UploadRVDTO urv) throws IOException {
        UserDto u = new UserDto();
        u = (UserDto) session.getAttribute("user");
        int myid = 0;
        if (u != null) {
            myid = u.getId();
        }
        ModelAndView mv = new ModelAndView("redirect:/to/singlegoods?id=" + urv.getGoods_id());
        String server_path = System.getProperty("user.dir");
        String parentpath = server_path + "/src/main/webapp/image/goods/" + urv.getGoods_id() + "/" + myid;
        String fname = "";
        //效验目录
        File fileParent = new File(parentpath);
        if (!fileParent.exists()) {
            fileParent.mkdir();
        }
        //更新数据库和文件
        if (urv.getImgUp() != null) {
            for (int i = 0; i < urv.getImgUp().length; i++) {
                String filename = urv.getImgUp()[i].getOriginalFilename();
                if (filename == null || filename.equals("")) {
                    continue;
                }
                String suffix = filename.substring(filename.lastIndexOf("."));
                if (!Mytools.confirmSuffix(suffix)) {
                    mv.addObject("message", "您的第" + i + "张图片格式有误");
                    return mv;
                }
                //文件更新
                String myfilename = "review" + (i + 1) + suffix;
                fname = fname + " " + myfilename;
                String path = parentpath + "/" + myfilename;
                File newFile = new File(path);
                urv.getImgUp()[i].transferTo(newFile);
            }
        }
        //数据库更新
        Reviews r = new Reviews(urv.getQuality(), urv.getPrice(), urv.getValue(), urv.getContent(), new Date(), fname.trim());
        ReviewService.save(r, urv.getGoods_id(), myid);
        logger.info("用户" + myid + "完成了对商品:" + urv.getGoods_id() + "的评价");
        logger.info("商品id" + urv.getGoods_id());
        logger.info("评价内容" + urv.getContent());
        logger.info("标签" + urv.getTag());
        logger.info("上传文件数" + urv.getImgUp().length);
        logger.info("价格评价" + urv.getPrice());
        logger.info("质量评价" + urv.getQuality());
        logger.info("价值评价" + urv.getValue());
        return mv;
    }
}

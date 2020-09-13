package com.myapp.controller;


import com.alibaba.fastjson.JSON;
import com.myapp.model.*;
import com.myapp.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;


@Controller
public class AdHomeController {
    private static Logger logger = LoggerFactory.getLogger("AdHomeController.class");
    @Autowired
    private AdminService adminService;
    @Autowired
    private OrderService orderServiceImpl;
    @Autowired
    private UserService userServiceImpl;
    @Autowired
    private GoodsService goodsServiceImpl;
    @Autowired
    private OrderDetailService orderDetailServiceImpl;

    @RequestMapping(value = "/adminOrder2",method = RequestMethod.GET)
    @ResponseBody
    public List<OrderDto> toOrder2(HttpSession session, @RequestParam("status") Integer status){
        //UserDto userDto= (UserDto) session.getAttribute("user");
        //System.out.println(status);
        List<OrderDto> orderDtoList;
        if(status==null){
            status=0;
        }
        orderDtoList=orderServiceImpl.findOrdersByStatus(0,status);
        return orderDtoList;
    }

    @RequestMapping(value = "/adminOrder",method = RequestMethod.GET)
    public ModelAndView toOrder(HttpSession session){
        ModelAndView modelAndView=new ModelAndView("adhome/adOrder");
        //UserDto userDto= (UserDto) session.getAttribute("user");
        List<OrderDto> orderDtoList=orderServiceImpl.findOrdersByStatus(0,0);
        modelAndView.addObject("orders",orderDtoList);
        return modelAndView;
    }

    @RequestMapping("/adPageManage")
    public ModelAndView toadPageManage(){
        ModelAndView modelAndView = new ModelAndView();
        List<HomePageDto> homePageDtos = new ArrayList<>();
        List<GoodsDto> goodsDtos = new ArrayList<>();
        homePageDtos=adminService.appendPageManage();
        goodsDtos=adminService.appendNoPageManage(homePageDtos);
        modelAndView.addObject("homepages",homePageDtos);
        modelAndView.addObject("goods",goodsDtos);
        modelAndView.setViewName("adhome/adPageManage");
        return modelAndView;
    }

    @RequestMapping("/adPageManageDelete")
    public ModelAndView adPageManageDelete(HomePageDto homePageDto){
        adminService.deletePageManage(homePageDto);
        return toadPageManage();
    }

    @RequestMapping("/adPageManageAdd")
    public ModelAndView adPageManageAdd(GoodsDto goodsDto){
        adminService.addPageManageAdd(goodsDto);
        return toadPageManage();
    }



    @RequestMapping("/adGoodsInfo")
    public ModelAndView toadGoodsInfo(){
        ModelAndView modelAndView = new ModelAndView();
        List<GoodsDto> goodsDtos = new ArrayList<>();
        goodsDtos = adminService.addToadGoodsInfo();
        modelAndView.addObject("goods",goodsDtos);
        modelAndView.setViewName("adhome/adGoodsInfo");
        return modelAndView;
    }
    @RequestMapping("/goodsInfoDelete")
    public ModelAndView goodsInfoDelete(GoodsDto goodsDto){
        adminService.deleteGoodsInfo(goodsDto);
        return toadGoodsInfo();
    }
    @RequestMapping(value = "/goodsInfoXiugai")
    public ModelAndView togoodsInfoXiugai(GoodsDto goodsDto){
        adminService.updateGoodsInfo(goodsDto);
        return toadGoodsInfo();
    }
    @RequestMapping("/goodsInfoSeach")
    public ModelAndView goodsInfoSeach(String type){
        ModelAndView modelAndView = new ModelAndView();
        List<GoodsDto> goodsDtos = new ArrayList<>();
        goodsDtos = adminService.addGoodsInfoSeach(type);
        modelAndView.addObject("goods",goodsDtos);
        modelAndView.setViewName("adhome/adGoodsInfo_type"+type);
        return modelAndView;
    }

    @RequestMapping("/adAddManage")
    public String toadAddManage(){
        return "adhome/adAddManage";
    }

    @RequestMapping(value = "addGoodsManage")
    public ModelAndView Shangchuan(HttpServletRequest request, HttpServletResponse response, GoodsDto goodsDto) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        if (goodsDto.getName().equals("")||goodsDto.getName()==null){
            modelAndView.setViewName("adhome/adAddManage");
        }else {
            HttpServletRequest request1 = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpSession session = request1.getSession();
            int fpath = adminService.addGoods(goodsDto);
            CommonsMultipartResolver coMultiResolver = new CommonsMultipartResolver(request.getSession()
                    .getServletContext());
            if (coMultiResolver.isMultipart(request)) {
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                List<MultipartFile> files = multiRequest.getFiles("file");
                String path = "";
                for (MultipartFile fname : files) {
                    if (!fname.isEmpty()) {
                        // 上传的文件路径  建在WebRoot目录下--fileupload
                        path = session.getServletContext().getRealPath("/image/goods/" + fpath + "/");
                        // 上传文件名
                        String filename = fname.getOriginalFilename();
                        // 做一个判断 图片扩展名   substring(int index) 返回一个以index为索引作为起点的含头不含尾的后面的字符串
                        String types = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
                        // 如果有需求是要修改上传的图片的名字为用户id开头的
                        //String newfilename = account+filename.substring(filename.lastIndexOf(".")); // 取得的是 .jpg
                        File filepath = new File(path, filename);
                        // 判断路径是否存在，不存在就创建一个
                        if (!filepath.getParentFile().exists()) {
                            final boolean mkdirs = filepath.getParentFile().mkdirs();
                        }
                        fname.transferTo(new File(path + File.separator + filename)); // 会上传到服务器中的路径
                    }
                }

            }
            modelAndView.setViewName("adhome/adAddManage");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/search/{keyword}",method = RequestMethod.GET)
    public ModelAndView search1(@PathVariable String keyword){
        ModelAndView modelAndView=new ModelAndView("shop/search");
        modelAndView.addObject("searchResult",goodsServiceImpl.findGoods(keyword, 0));
        modelAndView.addObject("searchMsg",keyword);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/detail/{orderId}",method = RequestMethod.GET)
    public List<OrderDetailDto> getOrderDetail(@PathVariable Integer orderId){
        List<OrderDetailDto> list=new ArrayList<OrderDetailDto>(0);
        if(orderId!=null){
            list=orderDetailServiceImpl.findByOrder(orderId);
        }
        return list;
    }

    @RequestMapping(value = "/adUserData",method = RequestMethod.POST)
    @ResponseBody
    public BTJson adUserData(HttpSession session, FenyeDto fenyeDto){
        //判断权限
        System.out.println(JSON.toJSONString(fenyeDto));
        BTJson j=new BTJson();
        List<UserDto> list=userServiceImpl.findUser(fenyeDto.getPage(),fenyeDto.getRows(),fenyeDto.getSearch());
        if(list!=null&&list.size()!=0){
            j.setPage(fenyeDto.getPage()+1);

        }else{
            j.setPage(fenyeDto.getPage());
        }
        j.setRows(list);
        j.setTotal(userServiceImpl.getCount(fenyeDto.getSearch()).intValue());
        return j;
    }

    @RequestMapping(value = "/deleteUser",method = RequestMethod.POST)
    @ResponseBody
    public Json deleteUser(Integer id){
        Json j=new Json();
        System.out.println(id);
        if (id != null) {
            try{
                userServiceImpl.delete(id);
                j.setSuccess(true);
                j.setMsg("删除成功");
            }catch (Exception e){
                j.setMsg("删除失败");
            }
        }else{
            j.setMsg("参数为空");
        }
        return j;
    }

    @RequestMapping(value = "/getUser",method = RequestMethod.POST)
    @ResponseBody
    public Json getUser(Integer id){
        Json j=new Json();
        UserDto userDto=userServiceImpl.getUser(id);
        if (userDto != null) {
            j.setSuccess(true);
            j.setMsg("success");
            j.setObj(userDto);
        }else{
            j.setMsg("failed");
        }
        return j;
    }

    @RequestMapping(value = "/editUser",method = RequestMethod.POST)
    @ResponseBody
    public Json editUser(UserDto userDto){
        Json j=new Json();
        if(userDto.getId()==null){
            j.setMsg("不能操作空对象");
        }else{
            try {
                userServiceImpl.updates(userDto);
                j.setSuccess(true);
                j.setMsg("修改成功");
            }catch (Exception e){
                j.setMsg(e.getMessage());
            }
        }
        System.out.println(JSON.toJSONString(userDto));
        return j;
    }

    @RequestMapping(value = "/adUserOrder",method = RequestMethod.POST)
    @ResponseBody
    public BTJson getadUserOrders(HttpSession session,FenyeDto fenyeDto){
        System.out.println(JSON.toJSONString(fenyeDto));
        BTJson j=new BTJson();
        List<OrderDto> list=orderServiceImpl.findOrders(fenyeDto.getId(),fenyeDto.getPage(),fenyeDto.getRows());
        if(list!=null&&list.size()!=0){
            j.setPage(fenyeDto.getPage()+1);

        }else{
            j.setPage(fenyeDto.getPage());
        }
        j.setRows(list);
        j.setTotal(orderServiceImpl.countOrdersOfUser(fenyeDto.getId()));
        return j;
    }

    @ResponseBody
    @RequestMapping(value = "/orderDetail",method = RequestMethod.POST)
    public BTJson getOrderDetails(FenyeDto fenyeDto){
        BTJson j=new BTJson();
        System.out.println(fenyeDto.getId());
        List<OrderDetailDto> list=new ArrayList<OrderDetailDto>(0);
        if(fenyeDto.getId()!=null){
            list=orderDetailServiceImpl.findByOrder(fenyeDto.getId());
        }
        System.out.println(JSON.toJSONString(list));
        j.setRows(list);
        return j;
    }

    @RequestMapping(value = "/getData",method = RequestMethod.GET)
    @ResponseBody
    public List<GoodsDto> getData(){
        List<GoodsDto> list=goodsServiceImpl.findGoods("", 0);
        System.out.println(JSON.toJSON(list));
        return list;
    }

    @RequestMapping("/adOrder")
    public String toOrder(){
        return "adhome/adOrder";
    }

    @RequestMapping("/adService")
    public String toService(){
        return "adhome/adService";
    }

    @RequestMapping("/admin")
    public String adIndex(){
        return "adhome/adIndex";
    }

    @RequestMapping(value = "/adLogin",method = RequestMethod.POST)
    public String adLogin(){

        return "adhome/adHome";
    }

    @RequestMapping(value = "/adHome",method = RequestMethod.GET)
    public String adHome(){
        return "adhome/adHome";
    }

    @RequestMapping(value = "/adUserManage",method = RequestMethod.GET)
    public String adUserManage(){
        return "adhome/adUserManage";
    }

    @RequestMapping(value = "/adAdminManage",method = RequestMethod.GET)
    public String adAdminManage(){
        return "adhome/adAdminManage";
    }

    @RequestMapping(value = "/loginOut",method = RequestMethod.GET)
    public String loginOut(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
}

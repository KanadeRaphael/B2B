package com.myapp.service.impl;


import com.myapp.dao.ShoppingCartDao;
import com.myapp.dao.UserDao;
import com.myapp.entity.ShoppingCart;
import com.myapp.model.ShoppingCartDto;
import com.myapp.model.UserDto;
import com.myapp.service.ShoppingcartService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShoppingcartServiceImpl implements ShoppingcartService {

    @Autowired
    private ShoppingCartDao shoppingcartDaoI;

    @Override
    public List<ShoppingCartDto> getShoppingcart(UserDto userDto) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id",userDto.getId());
        List<ShoppingCartDto>shoppingCartDtos=new ArrayList<>();
        List<ShoppingCart> shoppingCarts = shoppingcartDaoI.find("from ShoppingCart s where s.user.id=:id",params);
        if (shoppingCarts.size()>0 && shoppingCarts!=null) {
            for (ShoppingCart shoppingCart : shoppingCarts) {
                ShoppingCartDto shoppingCartDto = new ShoppingCartDto();
                BeanUtils.copyProperties(shoppingCart, shoppingCartDto);
                if (shoppingCart.getGoods() != null) {
                    shoppingCartDto.setGoodsname(shoppingCart.getGoods().getName());
                    shoppingCartDto.setGoodsprice(shoppingCart.getGoods().getPrice());
                    shoppingCartDto.setGoodsid(shoppingCart.getGoods().getId());
                    shoppingCartDto.setColor(shoppingCart.getColor());
                }

                shoppingCartDtos.add(shoppingCartDto);
            }
        }
        return shoppingCartDtos;
    }

    @Override
    public  List<ShoppingCartDto> saveShoppingcart(String str, Integer userId) {
        List<ShoppingCartDto> shoppingCartDtos = new ArrayList<>();
        String [] a=str.split(";");
        for (int i=0;i<a.length;i++){
            String []b =a[i].split(",");
            ShoppingCartDto shoppingCartDto = new ShoppingCartDto();
            shoppingCartDto.setGoodsid(Integer.parseInt(b[0]));
            shoppingCartDto.setNumber(Integer.parseInt(b[1]));
            shoppingCartDtos.add(shoppingCartDto);
        }
        return shoppingCartDtos;
    }

    @Override
    public void updateJianshao(String number,ShoppingCartDto shoppingCartDto) {
        ShoppingCart shoppingCart = shoppingcartDaoI.get("from ShoppingCart s where s.id="+shoppingCartDto.getId());
        if (number.equals("1")){
            return;
        }
        shoppingCart.setNumber(Integer.parseInt(number)-1);

    }

    @Override
    public void updateZengjia(String number,ShoppingCartDto shoppingCartDto) {
        ShoppingCart shoppingCart = shoppingcartDaoI.get("from ShoppingCart s where s.id="+shoppingCartDto.getId());
        if (shoppingCart==null){
            return;
        }
        shoppingCart.setNumber(Integer.parseInt(number)+1);
    }

    @Override
    public void deleteShoppingcart(ShoppingCartDto shoppingCartDto) {
        ShoppingCart shoppingCart = shoppingcartDaoI.get("from ShoppingCart s where s.id="+shoppingCartDto.getId());
        if (shoppingCart==null){
            return;
        }
        shoppingcartDaoI.delete(shoppingCart);
    }

    @Override
    public void deleteShoppingcartAll(UserDto userDto) {
        List<ShoppingCart> shoppingCarts = shoppingcartDaoI.find("from ShoppingCart s where s.user.id="+userDto.getId());
        if (shoppingCarts.size()>0 && shoppingCarts!=null){
            for (ShoppingCart shoppingCart : shoppingCarts){
                shoppingcartDaoI.delete(shoppingCart);
            }
        }
    }
}

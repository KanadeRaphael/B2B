package com.myapp.service.impl;

import com.myapp.dao.GoodsDao;
import com.myapp.dao.ShoppingCartDao;
import com.myapp.dao.UserDao;
import com.myapp.entity.Goods;
import com.myapp.entity.ShoppingCart;
import com.myapp.model.CartDTO;
import com.myapp.model.TempCartDTO;
import com.myapp.service.CartService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CartServiceImpl implements CartService {
    @Autowired
    private UserDao UserDao;
    @Autowired
    private GoodsDao GoodsDao;
    @Autowired
    private ShoppingCartDao ShoppingCartDao;
    @Override
    public void saveCart(ShoppingCart sc, int uid, int gid) {
        ShoppingCart scp = ShoppingCartDao.getGoods(uid, gid, sc.getColor());
        if(scp!=null){
            scp.setNumber(scp.getNumber()+sc.getNumber());
            ShoppingCartDao.update(scp);
            return;
        }
        sc.setUser(UserDao.getById(uid));
        sc.setGoods(GoodsDao.getGoodsByid(gid));
        ShoppingCartDao.save(sc);
    }

    @Override
    public CartDTO sortCart(TempCartDTO tcd) {
        CartDTO cd = new CartDTO();
        BeanUtils.copyProperties(tcd, cd);
        Goods g = GoodsDao.getGoodsByid(cd.getGoods_id());
        cd.setIntro(g.getIntro());
        cd.setPrice(g.getPrice());
        cd.setReduction(g.getReduction());
        cd.setName(g.getName());
        return cd;
    }

    @Override
    public List<CartDTO> sortCart(int[] cart_id) {
        List<CartDTO> cds = new ArrayList<CartDTO>();
        for (int i = 0; i < cart_id.length; i++) {
            ShoppingCart sc = ShoppingCartDao.getById(cart_id[i]);
            CartDTO cd = new CartDTO();
            cd.setId(cart_id[i]);
            cd.setColor(sc.getColor());
            cd.setNumber(sc.getNumber());
            Goods g = sc.getGoods();
            cd.setGoods_id(g.getId());
            cd.setIntro(g.getIntro());
            cd.setPrice(g.getPrice());
            cd.setReduction(g.getReduction());
            cd.setName(g.getName());
            cds.add(cd);
        }
        return cds;
    }

}

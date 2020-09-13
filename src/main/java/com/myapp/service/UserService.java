package com.myapp.service;

import com.myapp.model.UserDto;

import java.util.List;

public interface UserService {
    void update(UserDto userDto);

    //-----------------------------------------------------------

    UserDto login(UserDto userDto);
    String alterPsw(String password, int myid);
    UserDto getUser(Integer id);
    UserDto getUserByEmail(String email);
    void updates(UserDto userDto);
    void register(UserDto userModel) throws Exception;
    void delete(Integer id) throws Exception;
    List<UserDto> findUser(Integer page, Integer rows, String search);
    Long getCount(String search);
}

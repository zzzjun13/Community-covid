package com.example.springboot.controller.dto;

import cn.hutool.core.annotation.Alias;
import lombok.Data;

import javax.xml.ws.soap.Addressing;

/**
 * 接受前端请求登录的参数
 */
@Data

public class UserDTO {

    private String username;
    private String password;
    private String nickname;
    private String avatarUrl;
    private String token;

}

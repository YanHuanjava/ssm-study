package com.seecen.reflect;

import org.springframework.beans.factory.annotation.Autowired;

//@MyAnnotation
public class UserController {
    @MyAnnotation
    private UserService userService;

    private String userName;
}

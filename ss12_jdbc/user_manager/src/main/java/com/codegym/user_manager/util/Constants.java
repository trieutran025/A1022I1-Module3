package com.codegym.user_manager.util;

public class Constants {
    public static final String FIND_ALL_USER = "select *from users";
    public static final String CREATE_USER = "insert into users (name,email,country) values (?,?,?);";
    public static final String FIND_BY_ID_USER = "select * from users where id=?";
    public static final String FIND_BY_COUNTRY_USER = "select * from users where country like ?";
    public static final String UPDATE_USER = "update users set name = ?,email = ?,country = ? where id = ?";
    public static final String DELETE_USER = "delete from users where id =?";
    public static final String SORT_NAME = "SELECT *FROM users \n" +
            "ORDER BY name ASC";

}

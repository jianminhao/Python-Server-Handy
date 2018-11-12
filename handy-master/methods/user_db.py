#! /usr/bin/env Python
# coding=utf-8

import methods.db as db

def select_customer(table, column, condition, value):
    connection = db.get_connection()
    cursor = connection.cursor()
    sql = "SELECT " + column + " FROM " + table + " WHERE " + condition + "='" + value + "'"
    cursor.execute(sql)
    lines = cursor.fetchall()
    return lines

def insert_user(username, email, password):
    connection = db.get_connection()
    cursor = connection.cursor()
    sql = "INSERT INTO user_info (user_name, email, password) VALUES (%s, %s, %s)"
    cursor.execute(sql, (username, email, password))
    connection.commit()

def change_password(user_name, password):
    connection = db.get_connection()
    cursor = connection.cursor()
    sql = "UPDATE user_info SET password=%s WHERE user_name=%s"
    cursor.execute(sql, (password, user_name))
    connection.commit()
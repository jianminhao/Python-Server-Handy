#! /usr/bin/env Python
# coding=utf-8

import pymysql
import pymysql.cursors

def get_connection():
    # Connect to the database
    connection = pymysql.connect(host="127.0.0.1",
                                                       user="root",
                                                       password="",
                                                       db="handy_db",
                                                       charset="utf8mb4",
                                                       cursorclass=pymysql.cursors.DictCursor  )
    return connection
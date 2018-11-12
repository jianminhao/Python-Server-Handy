#! /usr/bin/env Python
# coding=utf-8

import tornado.web

import methods.user_db as user_db

class LoginHandler(tornado.web.RequestHandler):
    def post(self):
        data = tornado.escape.json_decode(self.request.body)
        #chunk = tornado.escape.json_encode(data)
        username = data["username"]
        password = data["password"]
        response_data = {"message":"", "ecode": 0}
        self.set_header("Content-Type", "application-json; chatset=UTF-8")
        user_infos = user_db.select_customer(table="Customer", \
                                column="CID, CName, LoginID, Password, CEmail", \
                                condition="LoginID", \
                                value=username)
        if user_infos:
            customer_password = user_infos[0]["Password"]
            if customer_password == password:
                response_data["ecode"] = 0
                response_data["message"] = "welcome back" + username
            else:
                response_data["ecode"] = 1
                response_data["message"] = "password is incorrect"
        else:
            response_data["ecode"] = 2
            response_data["message"] = "account or password is incorrect"        
        chunk = tornado.escape.json_encode(response_data)
        self.write(chunk)

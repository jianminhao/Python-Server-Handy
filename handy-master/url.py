#! /usr/bin/env Python
# coding=utf-8

"""
    the url structure of website 
"""

from handles.index import IndexHandler
from handles.login import LoginHandler

url = [
    (r'/', IndexHandler),
    (r'/login', LoginHandler),
]
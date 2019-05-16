from peewee import *

from spider.xueqiu import fetch_industry_list, fetch_stocks
from testModel import *
database = MySQLDatabase('fstock', **{'charset': 'utf8', 'use_unicode': True, 'host': 'localhost', 'user': 'root', 'password': 'Yy981211'})

class Main:
    listI = fetch_industry_list()
    for element in listI:
        print(element)
        # b = Block.create(blockid=element[0],blockname=element[1])
    listS = fetch_stocks("S4901")
    for element in listS:
        print(element)

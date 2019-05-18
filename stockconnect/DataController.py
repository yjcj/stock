from peewee import *
from selenium import webdriver
from spider import tenjqka, tenjqka_stub
from spider.xueqiu import fetch_industry_list, fetch_stocks, fetch_stock_comment
from testModel import *

database = MySQLDatabase('fstock', **{'charset': 'utf8', 'use_unicode': True, 'host': 'localhost', 'user': 'root',
                                      'password': '123456'})
liststock = []


def getStockAndBlock():
    listI = fetch_industry_list()
    a = 0
    b = 0
    listt = []
    flag = 0
    for element in listI:
        print(element)
        b = Block.create(blockid=element[0], blockname=element[1])
        listS = fetch_stocks(element[0])
        for element1 in listS:
            for element2 in listt:
                if element2['symbol'] == element1['symbol']:
                    flag = 1
            if flag == 0:
                listt.insert(a, element1)

                a = a + 1
            flag = 0
            btos = Btos.create(blockid=element[0], stockid=element1['symbol'])
    for element1 in listt:
        bd = Stockdata.create(stockid=element1["symbol"], turnover_rate=element1['turnover_rate'],
                              amount=element1['amount'],
                              chg=element1['chg'], percent=element1['percent'], volume=element1['volume'],
                              current=element1['current'], volume_ratio=element1['volume_ratio'],
                              amplitude=element1['amplitude'],
                              pb=element1['pb'], current_year_percent=element1['current_year_percent'],
                              name=element1['name'],
                              market_capital=element1['market_capital'], pe=element1['pe_ttm'])


def thsGetBlock():
    listb = tenjqka.fetch_industry_list()
    a = 0
    listt = []
    flag = 0
    for ele in listb:
        for elet in listt:
            if elet[0] == ele[0]:
                flag = 1
        if flag == 0:
            listt.append(ele)
        a = a + 1
        lists = fetch_stocks(ele[0])
    print(a)
    print(len(listt))
    for ele in listt:
        thsb = Thsblock.create(blockid=ele[0], name=ele[1])
        blockinfo = tenjqka.fetch_industry_info(ele[0])
        thsbd = Thsblockdata.create(blockid=ele[0], begin=blockinfo['今开'], end=blockinfo['昨收'],
                                    min=blockinfo['最低'], max=blockinfo['最高'], volume=blockinfo['成交量(万手)'],
                                    percent=blockinfo['板块涨幅'], rank=blockinfo['涨幅排名'], input=blockinfo['资金净流入(亿)'],
                                    account=blockinfo['成交额(亿)'])
        getstockbyid(ele[0])
        getklinebyblockid(ele[0])
    #


def getstockbyid(id):
    lists = tenjqka.fetch_stocks(id)

    flag = 0

    for element in lists:
        print(element)
        bs = Thsbtos.create(blockid=id, stockid=element[0])
        for ele in liststock:
            if element[0] == ele[0]:
                flag = 1
        if flag == 0:
            liststock.append(element)
            s = Thsstockdata.create(stockid=element[0],
                                    name=element[1],
                                    current=element[2],
                                    percent=element[3],
                                    chg=element[4],
                                    speed=element[5],
                                    changehand=element[6],
                                    amount_ratio=element[7],
                                    amplitude=element[8],
                                    volume=element[9],
                                    flow=element[10],
                                    flowmarket=element[11],
                                    pe=element[12])
        flag = 0


def getklinebyblockid(id):
    listk = tenjqka.fetch_ind_kline(id)
    for ele in listk:
        print(ele)
        if ele != []:
            sk = Thsblockkline.create(blockid=id, date=ele[0], begin=ele[1], max=ele[2], min=ele[3], end=ele[4],
                                      volume=ele[5], amount=ele[6])


if __name__ == '__main__':
    print("init!!")
    getStockAndBlock()
    thsGetBlock()
    # getstockbyid("881104")
    # getklinebystockid("881109")
    # lists=fetch_stock_comment('SH603068', '2019-2-15')
    # print("????")
    # for ele in lists:
    #     print(ele)
    #     break;

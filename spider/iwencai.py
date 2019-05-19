# coding=utf-8
from selenium import webdriver
from bs4 import BeautifulSoup
import re
import requests
import urllib
from spider import utils


def fetch_stock_news(code, start_date, end_date):
    """
    获取某只股票的新闻
    :param code: 股票代码
    :param start_date: 开始日期
    :param end_date: 结束日期
    :return: list[list[]]
    每个元素：[标题, 发布时间, 文章链接]
    """
    print("--开始抓取股票新闻（{}）--".format(code))
    result = []

    params = {
        "tid": "news",
        "w": code,
        "tr": 5,
        "ft": 2,  # 1-全文搜索 2-标题搜索
        "st": 1,  # 0-按相关性排序 1-按时间顺序排序
        "qs": "pf",
        "sdate": start_date,
        "edate": end_date,
        "p": 1
    }
    cookie = utils.get_cookie("http://search.10jqka.com.cn/")
    while True:
        r = requests.get("http://search.10jqka.com.cn/search",
                         headers=utils.html_header("search.10jqka.com.cn", "http://stockpage.10jqka.com.cn/{}/news/".format(code)),
                         params=params, cookies=cookie)
        soup = BeautifulSoup(r.text, features="html.parser")
        if len(soup.select("#hidelist")) == 0:
            # cookie失效时重新获取
            cookies=utils.get_cookie("http://search.10jqka.com.cn/")
            continue
        else:
            soup = soup.select("#hidelist")[0]
        if not soup.find_all("td"):
            # 页码超出范围无搜索结果时返回结果
            print ("--结束抓取--")
            return result
        for node in soup.find_all("td"):
            if "class" in node.attrs:
                # 去除无class属性的无用td结点
                continue
            text = node.find_all("span", class_="title_word")[0].get_text()
            time = node.find_all("span", class_="gray")[0].get_text()
            link = "http://search.10jqka.com.cn" + node.find_all(href=re.compile('^/goto'))[0]["href"]
            result.append([text, time, link])

        params["p"] += 1
        print (len(result), result[-1][1])


def fetch_stock_pubnote(code, start_date, end_date):
    """
    获取某只股票的公告列表
    :param code: 股票代码
    :param start_date: 开始日期
    :param end_date: 结束日期
    :return: list[list[]]
    每个元素：[标题, 发布日期, pdf链接]
    """
    result = []

    params = {
        "tid": "pubnote",
        "w": code,
        "tr": 5,
        "qs": "pf",
        "sdate": start_date,
        "edate": end_date,
        "p": 1
    }
    cookie = utils.get_cookie("http://search.10jqka.com.cn/")
    while True:
        r = requests.get("http://search.10jqka.com.cn/search",
                         headers=utils.html_header("search.10jqka.com.cn", "http://stockpage.10jqka.com.cn/{}/news/".format(code)),
                         params=params, cookies=cookie)
        soup = BeautifulSoup(r.text, features="html.parser")
        soup = soup.select("#hidelist")[0]
        if not soup.find_all("div", class_="s_r_box"):
            return result
        for node in soup.find_all("div", class_="s_r_box"):
            text = node.find_all("span", class_="title_word")[0].get_text()
            time = node.find_all("span", class_="GGray f13 pr12")[0].get_text()
            time = time[0:4] + "-" + time[5:7] + "-" + time[8:10]
            link = "http://search.10jqka.com.cn" + node.find_all(href=re.compile('^/goto'))[0]["href"]
            result.append([text, time, link])

        params["p"] += 1
        print (len(result), result[-1][1])


def fetch_stock_forecast(code):
    """
    获取牛叉诊股的股票预测
    :param code: 股票代码
    :return: list[诊断时间, 诊断]
    时间是非格式化的，直接存成文本
    """
    params = {
        "typed": 0,
        "ts": 1,
        "f": 1,
        "querytype": "stock",
        "tid": "stockpick",
        "w": code
    }
    options = webdriver.ChromeOptions()
    options.add_argument('headless')
    driver = webdriver.Chrome(chrome_options=options)
    driver.get("http://www.iwencai.com/stockpick/search?" + urllib.urlencode(params))
    time = driver.find_element_by_css_selector('div.diagno_date')
    comment = driver.find_element_by_css_selector('ul.item_list')
    return [time.text, comment.text]

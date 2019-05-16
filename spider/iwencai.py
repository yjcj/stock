# coding=utf-8
from bs4 import BeautifulSoup
import re
import requests
import utils


def fetch_stock_news(code, start_date, end_date):
    """
    获取某只股票的新闻
    :param code: 股票代码
    :param start_date: 开始日期
    :param end_date: 结束日期
    :return: list[list[]]
    每个元素：[标题, 发布时间, 文章链接]
    """
    result = []

    params = {
        "tid": "news",
        "w": code,
        "tr": 5,
        "qs": "pf",
        "sdate": start_date,
        "edate": end_date,
        "p": 1
    }

    while True:
        r = requests.get("http://search.10jqka.com.cn/search",
                         headers=utils.html_header("search.10jqka.com.cn", "http://stockpage.10jqka.com.cn/{}/news/".format(code)),
                         params=params, cookies=utils.get_cookie("http://search.10jqka.com.cn/"))
        soup = BeautifulSoup(r.text, features="html.parser")
        soup = soup.select("#hidelist")[0]
        if not soup.find_all("td"):
            return result
        for node in soup.find_all("td"):
            if "class" in node.attrs:
                continue
            text = node.find_all("span", class_="title_word")[0].get_text()
            time = node.find_all("span", class_="gray")[0].get_text()
            link = "http://search.10jqka.com.cn" + node.find_all(href=re.compile('^/goto'))[0]["href"]
            result.append([text, time, link])

        params["p"] += 1


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

    while True:
        r = requests.get("http://search.10jqka.com.cn/search",
                         headers=utils.html_header("search.10jqka.com.cn", "http://stockpage.10jqka.com.cn/{}/news/".format(code)),
                         params=params, cookies=utils.get_cookie("http://search.10jqka.com.cn/"))
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

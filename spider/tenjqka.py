# coding=utf-8
from bs4 import BeautifulSoup
import requests
import re
from spider import utils


def fetch_industry_list():
    """
    获取同花顺行业列表
    :return: list[(code 行业代码: name 行业名称)]
    """
    r = requests.get("http://q.10jqka.com.cn/thshy/", headers=utils.html_header("q.10jqka.com.cn", "http://q.10jqka.com.cn/"))

    result = re.findall('<a href="http://q.10jqka.com.cn/thshy/detail/code/(.*?)/" target="_blank">(.*?)</a>', r.text)
    # for code, name in result:
    #     print "%s: %s" % (code, name)
    return result


def fetch_industry_table():
    """
    获取同花顺行业一览表
    :return: list[list[]]
    每一项： 序号、板块、涨跌幅（%）、总成交量（万手）、总成交额（亿元）、净流入（亿元）、上涨家数、下跌家数、均价、领涨股、最新价、涨跌幅（%）
    """
    result = []
    r = requests.get("http://q.10jqka.com.cn/thshy/",
                     headers=utils.html_header("q.10jqka.com.cn", "http://q.10jqka.com.cn/"))
    soup = BeautifulSoup(r.text, features="html.parser")
    for tr in soup.find_all("tr"):
        line = []
        for td in tr.find_all("td"):
            line.append(td.string)
        result.append(line)
    return result[1:]


def fetch_industry_info(ins_code):
    """
    行业板块数据，包括今开、昨收、最低、最高、成交量(万手)、板块涨幅、涨幅排名、涨跌家数、资金净流入(亿)、成交额(亿)
    :param ins_code: 同花顺行业代号
    :return: 字典，{数据名称：数据}
    """

    r = requests.get("http://q.10jqka.com.cn/thshy/detail/code/" + ins_code,
                     headers=utils.html_header("q.10jqka.com.cn", "http://q.10jqka.com.cn/thshy/"))
    soup = BeautifulSoup(r.text, features="html.parser")
    soup = soup.select(".board-infos")[0]
    result = {}
    for node in soup.find_all("dl"):
        result[node.dt.string] = node.dd.string
    return result


def fetch_stocks(ins_code):
    """
    抓取某个行业的股票列表
    :param ins_code: 行业代码
    :return: list[list[]]
    每一行数据分别为：代码 名称	现价 涨跌幅(%) 涨跌 涨速(%) 换手(%) 量比 振幅(%) 成交额 流通股 流通市值 市盈率
    注意：部分数据后带有单位（亿），不能直接存为字符串
    """
    page = 1
    result = []
    while True:
        r = requests.get("http://q.10jqka.com.cn/thshy/detail/field/199112/order/desc/page/%d/ajax/1/code/%s" % (page, ins_code),
                         headers=utils.html_header("q.10jqka.com.cn", None), cookies=utils.get_cookie("http://q.10jqka.com.cn/thshy/"))
        soup = BeautifulSoup(r.text, features="html.parser")
        # print(r.url)
        if len(soup.find_all("table")) == 0:
            return result
        for tr in soup.find_all("tr"):
            line = []
            for td in tr.find_all("td"):
                if td.string == u"暂无成份股数据":
                    return result
                line.append(td.string)
            if len(line) != 0:
                result.append(line[1:-1])
        page += 1


def fetch_ind_kline(ins_code, start=None):
    """
    返回行业K线，此方法需要使用selenium
    :param ins_code: 行业代码
    :return: list[list[]]
    每一项为[日期（格式示例20190515）, 开盘价, 最高, 最低价, 收盘价, 成交量, 成交额]
    """
    if start is None:
        start = "20190101"
    start_year = int(start[0:4])
    result = []

    while start_year <= 2019:
        conn = requests.session()
        r = conn.get("http://d.10jqka.com.cn/v4/line/bk_{}/01/{}.js".format(ins_code, start_year),
                     headers=utils.html_header("d.10jqka.com.cn",
                                               "http://q.10jqka.com.cn/thshy/detail/code/{}/".format(ins_code)),
                     cookies=utils.get_cookie("http://q.10jqka.com.cn/thshy/"))
        result.extend([data.split(",")[:-3] for data in r.text[47:-3].split(";")])
        start_year += 1

    def cmp(l):
        return l[0] >= start

    return list(filter(cmp, result))

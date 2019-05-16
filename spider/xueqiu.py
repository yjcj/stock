# coding=utf-8
import json
import requests
import re
import time
import utils


def fetch_industry_list():
    """
    获取雪球的申万行业分类
    :return: list[(code 行业代码: name 行业名称)]
    """
    r = requests.get("https://xueqiu.com/hq", headers=utils.html_header("xueqiu.com", "https://xueqiu.com/hq"))
    result = re.findall('data-level2code="(S.*?)">(.*?)</a>', r.text)
    # for code, name in result:
    #     print "%s: %s" % (code, name)
    return result


def fetch_stocks(ins_code):
    """

    :param ins_code: fetch_industry_list中获取的行业代码
    :return: 股票数据列表 每一项为{
        amount: 成交额
        amplitude: 振幅
        chg: 涨跌额
        current: 当前价
        current_year_percent: 年初至今涨幅（百分比）
        dividend_yield: 股息率
        float_market_capital: 2545396070
        has_follow: false
        lot_size: 100
        market_capital: 市值
        name: 股票名称
        pb: 市净率
        pe_ttm: 市盈率
        percent: 当前涨幅（百分比）
        percent5m: 0
        symbol: 股票代码
        tick_size: 0.01
        turnover_rate: 换手率
        type: 11
        volume: 成交量
        volume_ratio: 5.17
    }
    """
    params = {
        "page": 1,
        "size": 30,
        "order": "desc",
        "order_by": "percent",
        "exchange": "CN",
        "market": "CN",
        "ind_code": ins_code
    }
    result = []
    while True:
        r = requests.get("https://xueqiu.com/service/v5/stock/screener/quote/list",
                         headers=utils.json_header("xueqiu.com", "https://xueqiu.com/hq"), params=params)
        json_data = json.loads(r.text)
        if json_data["error_code"] != 0 or len(json_data["data"]["list"]) == 0:
            break
        result.extend(json_data["data"]["list"])
        params["page"] += 1

    return result


def fetch_stock_kline(symbol):
    """
    获取股票K线数据（暂时不能选择时间区间）
    :param symbol: 股票代码
    :return:
    """
    # 先访问页面获取cookie
    r1 = requests.get("https://xueqiu.com/S/SH600601",
                      headers=utils.html_header("xueqiu.com", "https://xueqiu.com/hq"))
    params = {
         "symbol": symbol,
         "begin": int(round(time.time() * 1000)),
         "period": "day",
         "type": "before",
         "count": -142,
         "indicator": "kline,pe,pb,ps,pcf,market_capital,agt,ggt,balance"
    }
    r = requests.get("https://stock.xueqiu.com/v5/stock/chart/kline.json",
                     headers=utils.json_header("xueqiu.com", "https://xueqiu.com/S/%s" % symbol),
                     params=params, cookies=r1.cookies)
    return json.loads(r.text)["data"]


def fetch_stock_comment(symbol, start_time):
    # 先访问页面获取cookie
    r1 = requests.get("https://xueqiu.com/S/SH600601",
                      headers=utils.html_header("xueqiu.com", "https://xueqiu.com/hq"))
    params = {
        "count": 10,
        "comment": 0,
        "symbol": symbol,
        "hl": 0,
        "source": "user",
        "sort": "time",
        "page": 1
    }
    result = []
    time_stamp = int(time.mktime(time.strptime(start_time, "%Y-%m-%d"))*1000)
    while True:
        r = requests.get("https://xueqiu.com/statuses/search.json",
                         headers=utils.json_header("xueqiu.com", "https://xueqiu.com/S/%s" % symbol),
                         params=params, cookies=r1.cookies)
        json_data = json.loads(r.text)
        if "error_description" in json_data.keys():
            continue
        # print json_data
        if len(json_data["list"]) == 0:
            return result
        for item in json_data["list"]:
            if item["created_at"] < time_stamp:
                return result
            else:
                result.append(item)
        params["page"] += 1
        time.sleep(2)

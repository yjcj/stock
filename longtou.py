# coding=utf-8
import datetime
from functools import cmp_to_key
from spider import tenjqka
from spider import ts_data


def get_daily_stock(ind_code, start=None):
    dict = {}
    result = {}
    ind_kline = tenjqka.fetch_ind_kline(ind_code, start=start)

    for date_line in ind_kline:
        date = date_line[0][0:4] + "-" + date_line[0][4:6] + "-" + date_line[0][6:8]
        dict[date] = [(ind_code, float(date_line[4]) / float(date_line[1]) * 100 - 100)]

    stock_code_list = [line[0] for line in tenjqka.fetch_stocks(ind_code)]

    for stock_code in stock_code_list:
        start_date = start[0:4] + "-" + start[4:6] + "-" + start[6:8]
        end_date = (datetime.datetime.now() - datetime.timedelta(days=1)).strftime("%Y-%m-%d")

        stock_data = ts_data.get_kline(stock_code, start_date=start_date, end_date=end_date)
        for daily_data in stock_data:
            dict[daily_data[0]].append((stock_code, daily_data[7]))
    # print(dict)

    for date, p_list in dict.items():
        p_list = sorted(p_list, key=cmp_to_key(lambda a, b: b[1] - a[1]))
        result[date] = p_list[0][0]

    return result


def get_stock_count(ind_code, start=None):
    """
    获取一段时间内股票成为领涨股的次数统计
    :param ind_code: 同花顺行业代码
    :param start: 开始日期，注意格式为YYYYMMDD
    :return: dict{stock_code: count}
    """
    dict = get_daily_stock(ind_code, start)
    result = {}
    for date, value in dict.items():
        if value not in result.keys():
            result[value] = 1
        else:
            result[value] += 1
    return result

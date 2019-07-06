# coding=utf-8
import numpy as np
from spider.tenjqka import fetch_ind_kline, fetch_stocks
from spider.ts_data import get_kline


class KData(object):

    def __init__(self, date, open, close, high, low, ma5=None, ma10=None, ma20=None):
        """
        将每日K线数据作为对象储存
        :param date: int 日期yyyyMMdd
        :param open: float 开盘价
        :param close: float 收盘价
        :param high: float 最高价
        :param low: float 最低价
        :param ma5: float 5日均线
        :param ma10: float 10日均线
        :param ma20: float 20日均线
        """
        self.date = date
        self.open = open
        self.close = close
        self.high = high
        self.low = low
        self.ma5 = ma5
        self.ma10 = ma10
        self.ma20 = ma20


class Interval(object):

    def __init__(self, index, date, price, flag):
        """
        涨跌区间对象
        :param index: 对应K线数据对象的index
        :param date: int 区间开始日期
        :param price: float 区间第一天收盘价
        :param flag: int 0～横盘；1～上涨区间；-1～下跌区间
        """
        self.index = index
        self.date = int(date)
        self.price = float(price)
        self.flag = flag

    def __repr__(self):
        return "%d, %d, %.3f, %d\n" % (self.index, self.date, self.price, self.flag)


def ind_to_kdata(ind_kline):
    """
    行业K线列表转化为 KData 对象列表
    :param ind_kline: 参见 tenjqka.fetch_ind_kline 返回格式
    :return: list[KData]
    """

    def do_sum(index, days):
        """
        :param index: 计算起始的index
        :param days: 天数n
        :return: n日均线
        """
        s = 0.0
        for i in range(index - days + 1, index + 1):
            s += float(ind_kline[i][4])
        return round(s / days, 4)

    result = []
    for i in range(len(ind_kline)):
        ma5 = 0
        ma10 = 0
        if i > 3:
            ma5 = do_sum(i, 5)
        if i > 8:
            ma10 = do_sum(i, 10)
        if i > 18:
            ma20 = do_sum(i, 20)
            result.append(KData(int(ind_kline[i][0]),
                                float(ind_kline[i][1]),
                                float(ind_kline[i][4]),
                                float(ind_kline[i][2]),
                                float(ind_kline[i][3]),
                                ma5, ma10, ma20))
    return result


def stock_to_kdata(stock_kline):
    """
    个股K线列表转化为 KData 对象列表
    :param stock_kline: 参见ts_data返回格式
    :return: list[KData]
    """
    stock_kline.reverse()
    result = []
    for i in range(len(stock_kline)):
        s = stock_kline[i][0]
        s = s[0:4] + s[5:7] + s[8:10]
        result.append(KData(int(s),
                            float(stock_kline[i][1]),
                            float(stock_kline[i][3]),
                            float(stock_kline[i][2]),
                            float(stock_kline[i][4]),
                            float(stock_kline[i][8]),
                            float(stock_kline[i][9]),
                            float(stock_kline[i][10])))
    return result


def kdata_to_interval(kdata_list):
    """
    从K线数据中分析涨跌区间
    :param kdata_list: list[KData]
    :return: list[Interval]
    """
    flag = 0
    # 首先根据5日均线和20日均线的交叉划分大致的涨跌区间
    result = []
    for i in range(len(kdata_list)):
        new_flag = 1 if kdata_list[i].ma5 > kdata_list[i].ma20 else -1
        if new_flag != flag:
            result.append((i, kdata_list[i].date, new_flag))
            flag = new_flag

    new_result = []
    for i in range(len(result)):
        # 获取区间起始点
        begin = result[i][0]
        end = result[i + 1][0] if i < len(result) - 1 else len(kdata_list) - 1
        # 求区间最高价 / 最低价出现时间与位置
        max_price = kdata_list[i].high
        min_price = kdata_list[i].low
        max_index = begin
        min_index = begin
        for j in range(begin + 1, end):
            if kdata_list[j].high > max_price:
                max_price = kdata_list[j].high
                max_index = j
            if kdata_list[j].low < min_price:
                min_price = kdata_list[j].low
                min_index = j
        # 根据当日涨跌情况修正max_index / min_index所在区间
        # 此后index表示下一个涨跌区间的开始
        if kdata_list[max_index].close > kdata_list[max_index].open:
            max_index += 1
        if kdata_list[min_index].close < kdata_list[min_index].open:
            min_index += 1
        # 输出涨跌区间
        # 合并两端重合的index和端点
        if max_index < min_index:
            if max_index > begin:
                new_result.append(Interval(begin, kdata_list[begin].date, kdata_list[begin].close, 1))
            new_result.append(Interval(max_index, kdata_list[max_index].date, kdata_list[max_index].close, -1))
            if min_index < end:
                new_result.append(Interval(min_index, kdata_list[min_index].date, kdata_list[min_index].close, 1))
        elif max_index > min_index:
            if min_index > begin:
                new_result.append(Interval(begin, kdata_list[begin].date, kdata_list[begin].close, -1))
            new_result.append(Interval(min_index, kdata_list[min_index].date, kdata_list[min_index].close, 1))
            if max_index < end:
                new_result.append(Interval(max_index, kdata_list[max_index].date, kdata_list[max_index].close, -1))
        else:
            new_result.append(Interval(begin, kdata_list[begin].date, kdata_list[begin].close, 0))
    # 根据端点涨跌进行微调
    for i in range(len(new_result)):
        if (kdata_list[new_result[i].index].close - kdata_list[new_result[i].index].open) * new_result[i].flag < 0:
            new_result[i].index += 1
            new_result[i].date = kdata_list[new_result[i].index].date
            new_result[i].price = kdata_list[new_result[i].index].close
    # 合并涨跌相同的相邻区间
    for i in range(len(new_result) - 1, 0, -1):
        if new_result[i].flag == new_result[i - 1].flag:
            del new_result[i]
    # 合并涨跌变化不大的横盘区间
    for i in range(len(new_result) - 2, 0, -1):
        if new_result[i + 1].index - new_result[i].index < 3 and new_result[i].index - new_result[i - 1].index < 3:
            new_result[i - 1].flag = 0
            del new_result[i]
    # 补充最后一天的时间端点
    if new_result[-1].index != len(kdata_list) - 1:
        new_result.append(Interval(len(kdata_list) - 1, kdata_list[-1].date, kdata_list[-1].close, 0))
    return new_result


def interval_to_price(interval):
    """
    根据涨跌区间确定大致的每日价格，输出数据已做过归一化处理
    :param interval: list[Interval]
    :return: list[float]
    """
    price = []
    for i in range(len(interval) - 1):
        if interval[i].flag == 0:
            k = 0
        elif interval[i+1].index == interval[i].index:
            continue
        else:
            k = (interval[i+1].price - interval[i].price) / (interval[i+1].index - interval[i].index)
        for j in range(interval[i].index, interval[i+1].index):
            price.append(interval[i].price + (j - interval[i].index) * k)
    np_price = np.array(price)
    np_price = (np_price - np.average(np_price)) / np.std(np_price)
    return np_price.tolist()


def judge(price_A, price_B):
    """
    判断两个价格序列的相似程度
    :param price_A:
    :param price_B:
    :return: 取最小值的偏移量, 最小差异
    """
    loss_list = []
    for i in range(5):
        loss = 0.0
        for j in range(i, len(price_B)):
            loss += abs(price_B[j] - price_A[j - i])
        loss_list.append(loss)
    np_loss = np.array(loss_list)
    return np.argmin(np_loss), np.min(np_loss)


def get_longtou(ind_code, start_date):

    def str_date(date):
        s = str(date)
        return s[0:4] + "-" + s[4:6] + "-" + s[6:8]

    kdatas = ind_to_kdata(fetch_ind_kline(ind_code, start=start_date))
    interval_ind = kdata_to_interval(kdatas)
    price_ind = interval_to_price(interval_ind)

    stock_code_list = [line[0] for line in fetch_stocks(ind_code)]
    min_value = 100000
    min_stock = None
    for stock_code in stock_code_list:
        interval_stock = kdata_to_interval(stock_to_kdata(get_kline(stock_code, str_date(interval_ind[0].date),
                                                                    str_date(interval_ind[-1].date))))
        price_stock = interval_to_price(interval_stock)
        if len(price_stock) != len(price_ind):
            continue
        basis, min_loss = judge(price_ind, price_stock)
        if min_loss < min_value:
            min_value = min_loss
            min_stock = stock_code
        # print(stock_code, min_loss, basis)
    return min_stock

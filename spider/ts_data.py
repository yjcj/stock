# coding=utf-8
import tushare as ts
import datetime


def get_kline(code, start_date, end_date):
    """
    tushare 接口获得的k线数据
    :param code: 股票代码，即6位数字代码
    :param start_date: 开始日期，格式YYYY-MM-DD
    :param end_date: 结束日期，格式YYYY-MM-DD
    :return: list[list[]] 其中每个列表按以下顺序组织
    [date：日期, open：开盘价, high：最高价, close：收盘价, low：最低价, volume：成交量, price_change：价格变动, p_change：涨跌幅
    ma5：5日均价, ma10：10日均价, ma20:20日均价, v_ma5:5日均量, v_ma10:10日均量, v_ma20:20日均量]
    """
    df = ts.get_hist_data(code, start_date, end_date)
    return _dataframe_to_list(df)


def _dataframe_to_list(df):
    result = []
    if df is None:
        return []
    for index, row in df.iterrows():
        result.append([index] + row.tolist())
    return result


# def date_range(start_date,end_date):
#     start_date = datetime.datetime.strptime(start_date, "%Y-%m-%d")
#     end_date = datetime.datetime.strptime(end_date, "%Y-%m-%d")
#     for n in range(int((end_date-start_date).days)):
#         yield start_date + datetime.timedelta(n)

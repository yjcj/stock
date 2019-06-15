import testModel
import time


def get_ten_days_increase(stock_id):
    '''
    :param stock_id: id字符串
    :return: [涨停次数，涨幅，流通股(单位是：亿)],例如[5, 10.23, 2135.98]
    '''
    # 涨停次数，涨幅，流通股
    stop_times, gain, flow_market = 0, 0.0, 0.0
    current_time = time.strftime('%Y-%m-%d', time.localtime(time.time()))
    query = testModel.Stockkline.select().where(testModel.Stockkline.stockid == stock_id)
    for item in query:
        import datetime
        d1 = datetime.datetime.strptime(current_time, '%Y-%m-%d')
        d2 = datetime.datetime.strptime(item.date, '%Y-%m-%d')
        delta = d1 - d2
        if delta.days <= 10:
            gain += float(item.p_change)
            if float(item.p_change) >= 10:
                stop_times += 1

    query2 = testModel.Thsstockdata.select().where(testModel.Thsstockdata.stockid == stock_id)
    for item in query2:
        flow_market = float(item.flowmarket[:-1])

    return [stop_times, gain, flow_market]

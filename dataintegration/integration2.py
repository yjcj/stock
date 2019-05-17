import testModel
from spider import iwencai


def get_block_kline_by_id(block_id):
    '''
    :param block_id:
    :return: kline_data
    '''
    kline_data = []
    query = testModel.Thsblockkline.select().where(testModel.Thsblockkline.blockid == block_id)

    for item in query:
        date_str = item.date[0:4] + '/' + item.date[4:6] + '/' + item.date[6:]
        kline_data.append(
            {'date': date_str, 'open': item.begin, 'close': item.end, 'lowest': item.min, 'highest': item.max})
    return kline_data


def get_news_by_stock_id(stock_id, start_date, end_date):
    '''
    :param stock_id:
    :param start_date:
    :param end_date:
    :return: news_data [标题，时间，链接地址]
    '''
    iwencai_data = iwencai.fetch_stock_news(stock_id, start_date, end_date)
    news_data = []
    for item in iwencai_data:
        news_data.append({'title': item[0], 'time': item[1], 'link': item[2]})
    return news_data


def get_block_main_stock():
    '''
    :return: 板块龙头股列表
    '''
    query = testModel.Blockmainstock.select()
    main_stock_data = []
    for item in query:
        main_stock_data.append({'blockid': item.blockid, 'stockid': item.stockid})
    return main_stock_data

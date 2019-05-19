import testModel
import requests
from spider import iwencai
from spider import utils


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
    # print(iwencai_data)
    news_data = []
    for item in iwencai_data:
        news_data.append({'stockid': stock_id, 'title': item[0], 'time': item[1], 'url': item[2]})
    return news_data


def get_block_main_stock():
    '''
    :return: 板块龙头股列表
    '''
    query = testModel.Blockmainstock.select()
    main_stock_data = []
    for item in query:
        inner_query1 = testModel.Thsblock.select().where(testModel.Thsblock.blockid == item.blockid).get()
        inner_query2 = testModel.Thsstockdata.select().where(testModel.Thsstockdata.stockid == item.stockid).get()
        main_stock_data.append({'blockid': item.blockid, 'blockname': inner_query1.name, 'stockid': item.stockid,
                                'stockname': inner_query2.name})
    return main_stock_data


def get_pub_note(stock_id, start_date, end_date):
    iwencai_data = iwencai.fetch_stock_pubnote(stock_id, start_date, end_date)
    print(iwencai_data)
    pub_note_data = []
    for item in iwencai_data:
        pub_note_data.append({'stockid': stock_id, 'title': item[0], 'time': item[1], 'url': item[2]})
    return pub_note_data


def get_stock_comment(stock_id, page):
    # query = testModel.Stockicomment.select().where(testModel.Stockicomment.stockid == stock_id)
    query = testModel.Btos.select().where(testModel.Btos.stockid.contains(stock_id)).get()
    new_stock_id = query.stockid
    r1 = requests.get("https://xueqiu.com/S/SH600601",
                      headers=utils.html_header("xueqiu.com", "https://xueqiu.com/hq"))
    params = {
        "count": 10,
        "comment": 0,
        "symbol": stock_id,
        "hl": 0,
        "source": "user",
        "sort": "time",
        "page": page
    }
    r = requests.get("https://xueqiu.com/statuses/search.json",
                     headers=utils.json_header("xueqiu.com", "https://xueqiu.com/S/%s" % new_stock_id),
                     params=params, cookies=r1.cookies)
    return r.text


def get_stock_kline(stock_id):
    query = testModel.Stockkline.select().where(testModel.Stockkline.stockid == stock_id)
    kline_data = []
    for item in query:
        kline_data.append(
            {'date': item.date, 'open': item.open, 'close': item.close, 'lowest': item.low, 'highest': item.high})
    return kline_data

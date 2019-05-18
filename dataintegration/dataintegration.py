from stockconnect import DataController
import testModel


def get_stock_data_by_block(block_id):
    '''
    :param block_id:
    :return: stock_data
    :说明:
    '''
    # 根据板块名称获取板块id
    # block_id = testModel.Thsblock.select().where(
    #     testModel.Thsblock.name.contains(block_name) | block_name.contains(testModel.Thsblock.name)).get().blockid

    stock_id_list = []
    # 获取该板块的所有股票代码
    query = testModel.Thsbtos.select().where(
        testModel.Thsbtos.blockid == block_id)
    for item in query:
        stock_id_list.append(item.stockid)

    stock_data = []  # 以同花顺的数据为主

    for stock_id in stock_id_list:
        this_data = testModel.Thsstockdata.select().where(
            testModel.Thsstockdata.stockid == stock_id).get()

        stock_data.append(
            {'blockid': block_id, 'id': this_data.stockid, 'name': this_data.name, 'current': this_data.current,
             'percent': this_data.percent, 'chg': this_data.chg, 'speed': this_data.speed,
             'changehand': this_data.changehand, 'amountratio': this_data.amount_ratio,
             'amplitude': this_data.amplitude, 'volume': this_data.volume, 'flow': this_data.flow,
             'flowmarket': this_data.flowmarket, 'pe': this_data.pe})
    return stock_data


def get_all_block_data():
    '''
    :return: block_data
    :说明: 返回板块数据
    '''
    query = testModel.Thsblockdata.select()
    block_data = []
    for data in query:
        inner_query = testModel.Thsblock.select().where(testModel.Thsblock.blockid == data.blockid).get()
        # name = repr(inner_query.name)
        # print(name)
        block_data.append(
            {'name': inner_query.name, 'blockid': data.blockid, 'begin': data.begin, 'end': data.end, 'min': data.min,
             'max': data.max, 'volume': data.volume, 'percent': data.percent, 'rank': data.rank, 'input': data.input,
             'account': data.account})
    return block_data


def get_stock_and_block_mapping():
    '''
    :return: 板块与股票的对应关系表
    '''
    query = testModel.Thsbtos.select()
    mapping_data = []
    for data in query:
        this_dict = {'blockid': data.blockid, 'stockid': data.stockid}
        inner_query1 = testModel.Thsblock.select().where(testModel.Thsblock.blockid == data.blockid).get()
        inner_query2 = testModel.Thsstockdata.select().where(testModel.Thsstockdata.stockid == data.stockid).get()
        if inner_query1 != None:
            this_dict['blockname'] = inner_query1.name
        else:
            this_dict['blockname'] = ''
        if inner_query2 != None:
            this_dict['stockname'] = inner_query2.name
        else:
            this_dict['stockname'] = ''
        mapping_data.append(this_dict)
    return mapping_data

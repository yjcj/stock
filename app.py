from flask import Flask, request, jsonify
from dataintegration import dataintegration
from dataintegration import integration2
from flask_cors import *
from spider import iwencai

# from gevent import monkey
# from gevent.pywsgi import WSGIServer
# monkey.patch_all()


app = Flask(__name__)
CORS(app, supports_credentials=True)


# @app.route('/')
# def hello_world():
#     return 'Hello World!'

# 获取某个板块的所有股票数据
# 所需参数: blockId（板块Id）
@app.route('/getStockByBlock', methods=['GET'])
def get_stock_by_block_id():
    block_id = request.args.get('blockId')
    data = dataintegration.get_stock_data_by_block(block_id)
    return jsonify({'code': 1, 'data': data})


# 获取所有板块的板块数据
# 所需参数：无
@app.route('/getAllBlock', methods=['GET'])
def get_all_block():
    data = dataintegration.get_all_block_data()
    return jsonify({'code': 1, 'data': data})


# 获取板块与股票对应表
# 所需参数：无
@app.route('/getBlockStockMapping', methods=['GET'])
def get_mapping():
    data = dataintegration.get_stock_and_block_mapping()
    return jsonify({'code': 1, 'data': data})


# 根据blockId获取板块K线
# 所需参数：blockId
@app.route('/getBlockKLine', methods=['GET'])
def get_block_k_line():
    block_id = request.args.get('blockId')
    data = integration2.get_block_kline_by_id(block_id)
    return jsonify({'code': 1, 'data': data})


# 根据stockId获取股票新闻
# 所需参数：stockId, startDate, endDate
@app.route('/getStockNews', methods=['GET'])
def get_news():
    stock_id = request.args.get('stockId')
    # start_date = request.args.get('startDate')
    # end_date = request.args.get('endDate')
    data = integration2.get_news_by_stock_id(stock_id, '2019-05-01', '2019-05-10')
    return jsonify({'code': 1, 'data': data})


# 获取板块龙头股列表
# 所需参数：无
@app.route('/getMainStock', methods=['GET'])
def get_main_stock():
    data = integration2.get_block_main_stock()
    return jsonify({'code': 1, 'data': data})


# 获取股票公告列表
# 所需参数：stockId, startDate, endDate
@app.route('/getPubNote', methods=['GET'])
def get_pub_note():
    stock_id = request.args.get('stockId')
    # start_date = request.args.get('startDate')
    # end_date = request.args.get('endDate')
    data = integration2.get_pub_note(stock_id, '2019-05-01', '2019-05-10')
    return jsonify({'code': 1, 'data': data})


# 获取股票评论
# 所需参数：stockId, page
@app.route('/getStockComment', methods=['GET'])
def get_stock_comment():
    stock_id = request.args.get('stockId')
    page = request.args.get('page')
    data = integration2.get_stock_comment(stock_id, page)
    return jsonify(data)


# 获取股票K线
# 所需参数：stockId
@app.route('/getStockKLine', methods=['GET'])
def get_stock_kline():
    stock_id = request.args.get('stockId')
    data = integration2.get_stock_kline(stock_id)
    return jsonify({'code': 1, 'data': data})


# 获取股票预测
# 所需参数：stockId
@app.route('/getStockPrediction', methods=['GET'])
def get_stock_prediction():
    stock_id = request.args.get('stockId')
    predict_data = iwencai.fetch_stock_forecast(stock_id)
    data = []
    data.append({'time': predict_data[0], 'text': predict_data[1]})
    return jsonify({'code': 1, 'data': data})


if __name__ == '__main__':
    # http_server = WSGIServer(('',5000),app)
    # http_server.serve_forever()
    app.run()

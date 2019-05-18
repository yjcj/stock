from flask import Flask, request, jsonify
from dataintegration import dataintegration
from dataintegration import integration2
from flask_cors import *

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
    start_date = request.args.get('startDate')
    end_date = request.args.get('endDate')
    data = integration2.get_news_by_stock_id(stock_id, start_date, end_date)
    return jsonify({'code': 1, 'data': data})


# 获取板块龙头股列表
# 所需参数：无
@app.route('/getMainStock', methods=['GET'])
def get_main_stock():
    data = integration2.get_block_main_stock()
    return jsonify({'code': 1, 'data': data})


# 获取板块龙头股列表
# 所需参数：stockId, startDate, endDate
@app.route('/getPubNote', methods=['GET'])
def get_pub_note():
    stock_id = request.args.get('stockId')
    start_date = request.args.get('startDate')
    end_date = request.args.get('endDate')
    data = integration2.get_pub_note(stock_id, start_date, end_date)
    return jsonify({'code': 1, 'data': data})

if __name__ == '__main__':
    app.run()

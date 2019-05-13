# spider模块

用于抓取网站数据
使用方式：`from spider import ...`

### xueqiu（雪球）
- fetch_industry_list(): 返回所有行业代码
- fetch_stocks(ins_code): 返回行业的股票列表
- fetch_stock_kline(symbol): 返回股票的k线数据
- fetch_stock_comment(symbol, start_time): 返回指定日期前的股票评论


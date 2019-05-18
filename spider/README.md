# spider模块

用于抓取网站数据
使用方式：`from spider import ...`

### *_stub（假数据）
由于部分代码需要使用`selenium`，故提供数据用于后端测试

### xueqiu（雪球）
- `fetch_industry_list()`: 返回所有行业代码
- `fetch_stocks(ins_code)`: 返回行业的股票列表
- `fetch_stock_kline(symbol)`: 返回股票的k线数据
- `fetch_stock_comment(symbol, start_time)`: 返回指定日期前的股票评论

### tenjqka（同花顺）
- `fetch_industry_list()`: 获取同花顺行业列表
- `fetch_industry_info(ins_code)`: 获取同花顺行业一览表
- `fetch_industry_info(ins_code)`: 行业板块数据
- `fetch_stocks(ins_code)`: 抓取某个行业的股票列表
- `fetch_ind_kline(ins_code)`: 返回行业K线

### iwencai（i问财）
- `fetch_stock_news(code, start_date, end_date)`: 获取时间段内的新闻
- `fetch_stock_pubnote(code, start_date, end_date)`: 获取时间段内的公司公告
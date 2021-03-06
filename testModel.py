from peewee import *

database = MySQLDatabase('fstock', **{'charset': 'utf8', 'use_unicode': True, 'host': 'localhost', 'user': 'root', 'password': 'Yy981211'})

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Block(BaseModel):
    blockid = CharField(null=True)
    blockname = CharField(null=True)

    class Meta:
        table_name = 'block'

class Blockcomment(BaseModel):
    author = CharField(null=True)
    bcid = AutoField()
    blockid = CharField(null=True)
    detail = CharField(null=True)

    class Meta:
        table_name = 'blockcomment'

class Blockmainstock(BaseModel):
    blockid = CharField(null=True)
    bmsid = AutoField()
    stockid = CharField(null=True)

    class Meta:
        table_name = 'blockmainstock'

class Btos(BaseModel):
    blockid = CharField(null=True)
    bsid = AutoField()
    stockid = CharField(null=True)

    class Meta:
        table_name = 'btos'

class News(BaseModel):
    date = CharField(null=True)
    stockid = CharField(null=True)
    title = CharField(null=True)
    url = CharField(null=True)

    class Meta:
        table_name = 'news'

class Notice(BaseModel):
    date = CharField(null=True)
    stockid = CharField(null=True)
    title = CharField(null=True)
    url = CharField(null=True)

    class Meta:
        table_name = 'notice'

class Stockdata(BaseModel):
    amount = FloatField(null=True)
    amplitude = FloatField(null=True)
    chg = FloatField(null=True)
    current = FloatField(null=True)
    current_year_percent = FloatField(null=True)
    market_capital = FloatField(null=True)
    name = CharField(null=True)
    pb = FloatField(null=True)
    pe = FloatField(null=True)
    percent = FloatField(null=True)
    stockid = CharField(null=True)
    turnover_rate = FloatField(null=True)
    volume = FloatField(null=True)
    volume_ratio = FloatField(null=True)

    class Meta:
        table_name = 'stockdata'

class Stockicomment(BaseModel):
    author = CharField(null=True)
    detail = CharField(null=True)
    scid = AutoField()
    stockid = CharField(null=True)

    class Meta:
        table_name = 'stockicomment'

class Stockkline(BaseModel):
    close = FloatField(null=True)
    date = CharField(null=True)
    high = FloatField(null=True)
    low = FloatField(null=True)
    open = FloatField(null=True)
    p_change = FloatField(null=True)
    price_change = FloatField(null=True)
    stockid = CharField(null=True)
    volume = FloatField(null=True)

    class Meta:
        table_name = 'stockkline'

class Thsblock(BaseModel):
    blockid = CharField(primary_key=True)
    name = CharField(null=True)

    class Meta:
        table_name = 'thsblock'

class Thsblockdata(BaseModel):
    account = FloatField(null=True)
    begin = FloatField(null=True)
    blockid = CharField(primary_key=True)
    end = FloatField(null=True)
    input = FloatField(null=True)
    max = FloatField(null=True)
    min = FloatField(null=True)
    percent = CharField(null=True)
    rank = CharField(null=True)
    volume = FloatField(null=True)

    class Meta:
        table_name = 'thsblockdata'

class Thsblockkline(BaseModel):
    amount = CharField(null=True)
    begin = CharField(null=True)
    blockid = CharField(null=True)
    date = CharField(null=True)
    end = CharField(null=True)
    max = CharField(null=True)
    min = CharField(null=True)
    volume = CharField(null=True)

    class Meta:
        table_name = 'thsblockkline'

class Thsbtos(BaseModel):
    blockid = CharField(null=True)
    stockid = CharField(null=True)

    class Meta:
        table_name = 'thsbtos'

class Thsstockdata(BaseModel):
    amount_ratio = CharField(null=True)
    amplitude = CharField(null=True)
    changehand = CharField(null=True)
    chg = CharField(null=True)
    current = CharField(null=True)
    flow = CharField(null=True)
    flowmarket = CharField(null=True)
    name = CharField(null=True)
    pe = CharField(null=True)
    percent = CharField(null=True)
    speed = CharField(null=True)
    stockid = CharField(primary_key=True)
    volume = CharField(null=True)

    class Meta:
        table_name = 'thsstockdata'


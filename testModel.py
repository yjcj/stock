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

class Blockcommit(BaseModel):
    author = CharField(null=True)
    bcid = AutoField()
    blockid = CharField(null=True)
    detail = CharField(null=True)

    class Meta:
        table_name = 'blockcommit'

class Blockhistory(BaseModel):
    beginprice = FloatField(null=True)
    bhid = AutoField()
    blockid = IntegerField(null=True)
    blockname = CharField(null=True)
    date = DateTimeField(null=True)
    endprice = FloatField(null=True)
    endpricebefore = FloatField(null=True)
    increase = FloatField(null=True)
    maxprice = FloatField(null=True)
    minprice = FloatField(null=True)

    class Meta:
        table_name = 'blockhistory'

class Blockk(BaseModel):
    bkid = AutoField()
    date = DateTimeField(null=True)

    class Meta:
        table_name = 'blockk'

class Blockmainstock(BaseModel):
    blockid = CharField(null=True)
    bmsid = AutoField()
    stockid = CharField(null=True)

    class Meta:
        table_name = 'blockmainstock'

class Btos(BaseModel):
    blockid = IntegerField(null=True)
    bsid = AutoField()
    stockid = IntegerField(null=True)

    class Meta:
        table_name = 'btos'

class Sotck(BaseModel):
    stockid = AutoField()
    stockname = CharField(null=True)

    class Meta:
        table_name = 'sotck'

class Stockhistory(BaseModel):
    beginprice = FloatField(null=True)
    date = DateTimeField(null=True)
    endprice = FloatField(null=True)
    endpricebefore = FloatField(null=True)
    increase = FloatField(null=True)
    maxprice = FloatField(null=True)
    minprice = FloatField(null=True)
    shid = AutoField()
    stockid = IntegerField(null=True)
    stockname = FloatField(null=True)

    class Meta:
        table_name = 'stockhistory'

class Stockicommit(BaseModel):
    author = CharField(null=True)
    detail = CharField(null=True)
    scid = AutoField()
    stockid = IntegerField(null=True)

    class Meta:
        table_name = 'stockicommit'

class Stockk(BaseModel):
    skid = AutoField()
    stockid = IntegerField(null=True)

    class Meta:
        table_name = 'stockk'

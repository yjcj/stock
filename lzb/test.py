import datetime
d1 = datetime.datetime.strptime('2015-03-05 17:41:20', '%Y-%m-%d %H:%M:%S')
d2 = datetime.datetime.strptime('2015-03-02 17:42:20', '%Y-%m-%d %H:%M:%S')
delta = d1 - d2
print(delta.days)
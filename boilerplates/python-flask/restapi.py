from logzero import logger, logfile
import logging

logfile("my_logfile.log", loglevel=logging.WARNING)

class RestAPI:
    def __init__(self, name, age):
        self.name = name
        self.age = age
        logger.warning("abc")

p1 = RestAPI("John", 36)



print(p1.name)
print(p1.age) 



#https://pypi.org/project/logzero/
#https://github.com/metachris/logzero/blob/master/docs/index.rst
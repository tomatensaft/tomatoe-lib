"""
locallib
version 0.1
"""

# imports
import logging

# create logger and set level
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

# set format
formatter = logging.Formatter('%(asctime)s|%(levelname)s|%(message)s')

# create file handler
file_handler = logging.FileHandler('customlog.log')
file_handler.setLevel(logging.DEBUG)
file_handler.setFormatter(formatter)

# create console handler
console_handler = logging.StreamHandler()
console_handler.setLevel(logging.INFO)
console_handler.setFormatter(formatter)

# add file and cosnoel handler
logger.addHandler(file_handler)
logger.addHandler(console_handler)

# datamodel for log entyr
class LogEntry():
    def __init__(self, timestamp, level,msg):
        self.timestamp = timestamp
        self.level = level
        self.msg = msg
    
# get value from element
def get_jsonvalue(id,payload):
    return next((e for e in payload if e['id'] == id), None)

# validate value
def valid_value(value):
    for key in value.keys():
        if key != 'name':
            return False
    return True

# read last n lines
def readLastlines(fname, N):
    data = [] #list
    with open(fname) as file:
        # iterate line
        for line in (file.readlines() [-N:]):
            splitline=line.split("|")
            data.append(LogEntry(splitline[0],splitline[1],splitline[2]))
    return data
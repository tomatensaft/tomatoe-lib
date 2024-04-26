"""
log configuration
version 0.1
"""

# imports
from logzero import logger
import logzero

# log configuration
logzero.logfile("customlog.log")
#logzero.json()
logzero.loglevel(logzero.INFO)
logger.info("logger configuration loaded")
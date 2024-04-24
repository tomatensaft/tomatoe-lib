import os
from logzero import logger, logfile
import logging
import restapi

logfile("my_logfile.log", loglevel=logging.WARNING)

if __name__ == "__main__":
    print("test")
    logger.info("This log message saved in the log file")
    logger.warning("This log message saved in the log file")
    #port = int(os.environ.get("PORT", 8000))
    #app = create_app()
    #app.run(host="0.0.0.0", port=port)

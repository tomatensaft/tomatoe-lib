"""
main application
version 0.1
"""

import os
import sys
import parameter
import locallib
import weblog

# main program
if __name__ == "__main__":

    # main header
    locallib.logger.info("start main program")
    locallib.logger.info("app name" + parameter.env_name)
    locallib.logger.info("app version" + parameter.env_version)

    # start restapi interface
    port = int(os.environ.get("PORT", 8000))
    weblog.app.run(host="0.0.0.0", port=port)

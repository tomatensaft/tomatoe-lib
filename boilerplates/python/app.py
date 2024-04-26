"""
main application
version 0.1
"""

import os
import parameter
import logconfig
import restapi

# main program
if __name__ == "__main__":

    # main header
    logconfig.logger.info("start main program")
    logconfig.logger.info("app name" + parameter.env_name)
    logconfig.logger.info("app version" + parameter.env_version)

    # start restapi interface
    port = int(os.environ.get("PORT", 8000))
    restapi.app.run(host="0.0.0.0", port=port)

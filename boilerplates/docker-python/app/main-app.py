class App:
    def main(self):
        print("This is boilerplate!")


if __name__ == "__main__":
    App().main()


###########
    
    import logging
from os import environ
from sys import exit
from flask import Flask, render_template
from pythonjsonlogger import jsonlogger

# Setting up a modern JSON logging format
log = logging.getLogger('werkzeug')
log.setLevel(logging.ERROR)
logger, logHandler, formatter = [logging.getLogger('gcp_json'), logging.StreamHandler(), jsonlogger.JsonFormatter()]
logHandler.setFormatter(formatter)
logger.addHandler(logHandler)
logger.setLevel(logging.DEBUG)

ENV = environ.get('ENV')
if not ENV:
    logger.error("No ENV variable found!!", extra={"severity": "error"})
    exit()
if (ENV == "dev" or ENV == "local"):
    logger.warning(f"Running in {ENV} environment!", extra={"severity": "warning"})
    DEFINE_SOME_DEV = "variables here maybe?"
elif (ENV == "prod"):
    DEFINE_SOME_PROD = "variables here maybe?"

# create our little application :)
app = Flask(__name__, static_url_path='/static/')
app.config.from_object(__name__)

# Define all your routes here
@app.route('/')
def index():
    return render_template('index.html')

# Starting app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True if ENV != "prod" else False)

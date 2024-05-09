from flask import Flask

app = Flask(__name__)

@app.route('/container/', methods=['GET', 'POST'])
def container():
    return "container works"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
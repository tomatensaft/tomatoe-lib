"""
restapi interface
version 0.1
"""

# imports
import locallib
import os
import json
from flask import Flask, render_template

# create app
app = Flask(__name__)

# app route /
@app.route('/')
def index():
    logdata = locallib.readLastlines('customlog.log',10)
    return render_template('logtable.html', title='Logtable',
        logdata=logdata) 
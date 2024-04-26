"""
global env parameter
version 0.1
"""

# imports
import os
from os import environ, path
from dotenv import load_dotenv

# load base parameters
appdir = path.abspath(path.dirname(__file__))
load_dotenv(path.join(appdir, '.env'))

# extract .env file
env_name = os.getenv("NAME")
env_version = os.getenv("VERSION")
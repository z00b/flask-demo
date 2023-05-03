'''The core of our flask app.'''

from flask import Flask

APP = Flask(__name__)

@APP.route("/")
def hello():
    '''Ensure that people feel very welcome.'''
    return "Good day, my friends!"

if __name__ == "__main__":
    APP.run()

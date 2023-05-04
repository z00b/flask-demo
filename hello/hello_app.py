'''The core of our flask app.'''

from flask import Flask

APP = Flask(__name__)

@APP.route("/")
def hello():
    '''Ensure that people feel very welcome.'''
    return "Hello, visitor!"

@APP.route('/goodbye')
def goodbye():
    '''Returns a farewell message.'''
    return 'Goodbye!'


if __name__ == "__main__":
    APP.run()

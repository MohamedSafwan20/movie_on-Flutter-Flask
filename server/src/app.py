from flask import Flask
from movie import movie_blueprint

app = Flask(__name__)

app.register_blueprint(movie_blueprint)

if __name__ == '__main__':
    app.run(host='0.0.0.0')


import pandas as pd

from flask import Flask, jsonify, request
from flask_restx import Api, Resource


app = Flask(__name__)
api = Api(app, version='1.0', title='Happiness Ranking API')

df = pd.read_csv('happiness_reports.csv', encoding='utf8')


@api.route("/rank")
@api.doc(params={'year': 'Year', 'country': 'Country'})
class Rank(Resource):
    def get(self):
        year  = request.args.get('year', type=int, default=2020)
        country  = request.args.get('country', type=str, default='België')
        
        out = df[(df['Jaar'] == year) & (df['Land'] == country)]
        rank = int(out['Positie'])
        
        return jsonify(rank)


if __name__ == '__main__':
    app.run(port=5000, debug=True)

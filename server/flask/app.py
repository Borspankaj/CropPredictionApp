from flask import Flask , request , jsonify
import model
app = Flask(__name__)


@app.route('/api', methods = ['GET'])
def hello_world():
    data = str(request.args['params'])
    pred = model.get_prediction(data)
    context = {}
    context['prediction'] = pred
    return jsonify(context)


if __name__ == '__main__':
    app.run()
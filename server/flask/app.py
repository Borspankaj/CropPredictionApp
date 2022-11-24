from flask import Flask , request , jsonify , Markup
import model
import pandas as pd
from utils.fertilizer import fertilizer_dic
app = Flask(__name__)


@app.route('/get-prediction', methods = ['GET'])
def get_prediction():
    data = str(request.args['params'])
    pred = model.get_prediction(data)
    context = {}
    context['prediction'] = pred
    return jsonify(context)

@app.route('/get-fertilizer' , methods = ['GET'])
def get_fertilizer() :
    data = str(request.args['params'])
    data = data.split()
    crop_name = data[0]
    N = int(data[1])
    P = int(data[2])
    K = int(data[3])

    df = pd.read_csv('fertilizer.csv')

    nr = df[df['Crop'] == crop_name]['N'].iloc[0]
    pr = df[df['Crop'] == crop_name]['P'].iloc[0]
    kr = df[df['Crop'] == crop_name]['K'].iloc[0]

    n = nr - N
    p = pr - P
    k = kr - K
    temp = {abs(n): "N", abs(p): "P", abs(k): "K"}
    max_value = temp[max(temp.keys())]
    if max_value == "N":
        if n < 0:
            key = 'NHigh'
        else:
            key = "Nlow"
    elif max_value == "P":
        if p < 0:
            key = 'PHigh'
        else:
            key = "Plow"
    else:
        if k < 0:
            key = 'KHigh'
        else:
            key = "Klow"

    context = {}
    context['fert'] = Markup(str(fertilizer_dic[key]))
    return jsonify(context)

if __name__ == '__main__':
    app.run()
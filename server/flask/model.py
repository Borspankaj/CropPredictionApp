from __future__ import print_function
import pandas as pd
import numpy as np
import warnings
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
warnings.filterwarnings('ignore')

PATH = 'Crop_recommendation.csv'
df = pd.read_csv(PATH , encoding="ISO-8859-1")
features = df[['N', 'P','K','temperature', 'humidity', 'ph', 'rainfall']]
target = df['label']
labels = df['label']
acc = []
model = []
Xtrain, Xtest, Ytrain, Ytest = train_test_split(features,target,test_size = 0.2,random_state =2)
RF = RandomForestClassifier(n_estimators=20, random_state=0)
RF.fit(Xtrain,Ytrain)

def get_prediction(data) :
    data = np.array([list(map(float, data.split()))])
    prediction = RF.predict(data)
    return prediction[0]



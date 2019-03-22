import sys
import pandas as pd
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer

from sklearn.linear_model import SGDClassifier
from sklearn.pipeline import Pipeline
from sklearn.feature_extraction.text import TfidfTransformer

from sklearn.metrics import accuracy_score, confusion_matrix
from sklearn.metrics import classification_report
from sklearn.naive_bayes import MultinomialNB

from sklearn.model_selection import train_test_split


def read_training_data(path):
    targets = []
    data = []
    with open(path) as f:
        _ = f.readline()
        for line in f:
            targets.append(line[0])
            data.append(line[2:])
    return pd.DataFrame({"document": data, "class": targets})

def read_input_data():
    t = int(input().strip())
    data = []
    for i in range(t):
        line = input()
        data.append(line.strip())
    return pd.Series(data)

if __name__ == '__main__':
    df = read_training_data('trainingdata.txt')
    in_serie = read_input_data()

    # Exploring the Data
    #df['class'].value_counts()

    X = df['document']
    y = df['class']
    my_tags = [str(i) for i in range(1, 9)]
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.7, random_state=42)

    sgd = Pipeline([('vect', CountVectorizer()),
                    ('tfidf', TfidfTransformer()),
                    ('clf',
                     SGDClassifier(loss='hinge', penalty='l2', alpha=1e-3, random_state=42, max_iter=5, tol=-np.infty)),
                    ])
    sgd.fit(X, y)
    #sgd.fit(X_train, y_train)
    #y_pred = sgd.predict(X_test)

    #print('accuracy %s' % accuracy_score(y_pred, y_test))
    #print(classification_report(y_test, y_pred, target_names=my_tags))

    y_pred = sgd.predict(in_serie)
    for i in y_pred:
        print(i)


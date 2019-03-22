# Data Engineer Challenge


## 1. Map Reduce Word Counts
~~~shell
virtualenv -p /usr/bin/python2.7 env2
source env2/bin/activate
python word-count.py
cat sample_input.txt | python word-count.py
~~~

## 2. Document Classification

~~~
conda create -n byprice python=3.6
source activate byprice
wget https://s3.amazonaws.com/hr-testcases/597/assets/trainingdata.txt
python document_classification.py < sample_input_predict.txt
~~

## Tutorial
~~~
wget https://storage.googleapis.com/tensorflow-workshop-examples/stack-overflow-data.csv
~~
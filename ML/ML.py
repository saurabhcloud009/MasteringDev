# Load libraries
import pandas
from pandas.plotting import scatter_matrix
import matplotlib.pyplot as plt
from sklearn import model_selection
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC

# Load dataset
url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
names = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
dataset = pandas.read_csv(url, names=names)

# shape total no of row and Columnsx
print(dataset.shape)

# head /data listing
print(dataset.head(20))

# descriptions min /max
print(dataset.head(20).describe())

# class distribution Group By
print(dataset.groupby('class').size())

# box and whisker plots--> Univariate plots to get better understanding of each attribute
#dataset.head(20).plot(kind='box', subplots=True, layout=(2,2), sharex=False, sharey=False)
#plt.show()


# scatter plot matrix Multivariate plots to get better understanding of relationShip b/w 2 attributes--(need to review)
#scatter_matrix(dataset.head(20))
#plt.show()


# Split-out validation dataset

array = dataset.values
X = array[:,0:4]
Y = array[:,4]
validation_size = 0.20
seed = 7
X_train, X_validation, Y_train, Y_validation = model_selection.train_test_split(X, Y, test_size=validation_size, random_state=seed)


# Test options and evaluation metric
seed = 7
scoring = 'accuracy'
# Spot Check Algorithms
models = []
models.append(('LR', LogisticRegression()))
models.append(('LDA', LinearDiscriminantAnalysis()))
models.append(('KNN', KNeighborsClassifier()))
models.append(('CART', DecisionTreeClassifier()))
models.append(('NB', GaussianNB()))
models.append(('SVM', SVC()))
# evaluate each model in turn
results = []
names = []
for name, model in models:
	kfold = model_selection.KFold(n_splits=10, random_state=seed)
	cv_results = model_selection.cross_val_score(model, X_train, Y_train, cv=kfold, scoring=scoring)
	results.append(cv_results)
	names.append(name)
	msg = "%s: %f (%f)" % (name, cv_results.mean(), cv_results.std())
	print(msg)



# Make predictions on validation dataset
knn = KNeighborsClassifier()
knn.fit(X_train, Y_train)
predictions = knn.predict(X_validation)
print(accuracy_score(Y_validation, predictions))
print(confusion_matrix(Y_validation, predictions))
print(classification_report(Y_validation, predictions))





Binary classification accuracy metrics quantify the two types of correct predictions and two types of errors. 
Typical metrics are accuracy (ACC), 
                    precision,
                    recall,
                    false positive rate,
                    F1-measure. 
Each metric measures a different aspect of the predictive model. 

Accuracy (ACC) measures the fraction of correct predictions. 
Precision measures the fraction of actual positives among those examples that are predicted as positive. 
Recall measures how many actual positives were predicted as positive. 
F1-measure is the harmonic mean of precision and recall.
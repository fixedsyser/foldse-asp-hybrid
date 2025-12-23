
"""
Source Attribution:
This code originates from the FOLD-SE service provided by the University of Texas at Dallas.

The FOLD-SE service is provided for free for educational purposes and for limited 
experimental use. The service is provided "as is" without any warranties. The creators 
of FOLD-SE and their employers are not liable for any damages arising out of or in 
connection with the use of this service.

For more information, visit: http://ec2-52-0-60-249.compute-1.amazonaws.com/
"""

import pandas as pd
import configparser
import requests
from sklearn.model_selection import train_test_split

# reads config
config = configparser.ConfigParser()
config.read("config.ini")

# Enter File Paths
# path = "./data/autism.csv" # Enter the train file path
# dataset_name = "autism"
path = "./data/student_depression.csv" # Enter the train file path
dataset_name = "student_depression"
# test_path = "" # Uncomment this line if you wish to provide a test dataset

df = pd.read_csv(path) 
# test_df = pd.read_csv(test_path) # Uncomment this line if you wish to provide a separate test dataset

train_df, test_df = train_test_split(df, test_size=0.2, random_state=42)

data_frame_json = train_df.to_json(orient='split')
try:
    test_data_frame_json = test_df.to_json(orient='split')
except:
    test_data_frame_json = ''

# Set Model Parameters
numattrs = "age" # Enter the names of numerical features seperated ',' (For eg - 'feature1,feature2,feature3')
strattrs = "a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,gender,ethnicity,jaundice,pdd,used_app_before,relation" # Enter the names of categorical features seperated by ',' (For eg - 'feature1,feature2,feature3')
hyp1 = "0.8" # Enter the Train Test split (Ignore if providing a seperate test dataset. If you keep hyp1 as blank or enter a value <0.5 or >=1 only rules will be generated, no testing will be done)
hyp2 = "0.5" # Enter the Level of exceptions ratio
hyp3 = "0.005" # Enter the Tail ratio
positive_value = "NO" # Enter the Classification label (Optional and only for binary classification. Keep unchanged otherwise)
target_column = "depression" # Enter the name of the target column
save_model = "local" # If you want to save the model ("local" will return the json model, else the model won't be saved)
# Visit http://ec2-52-0-60-249.compute-1.amazonaws.com/example/ to view a example.

# Enter Your Username and Password
username = config.get("settings", "foldse_username")
password = config.get("settings", "foldse_password")
# If your username and password combination does not work, please try to register again with the same email id. Please contact us if that does not work.

payload = {
    'username': username,
    'password': password,
    'data_frame_json': data_frame_json,
    'numattrs': numattrs,
    'strattrs': strattrs,
    'hyp1': hyp1,
    'hyp2': hyp2,
    'hyp3': hyp3,
    'positive_value': positive_value,
    'test_data_frame_json': test_data_frame_json,
    'label_value': target_column,
    'save_model' : save_model
}

response = requests.post("http://ec2-52-0-60-249.compute-1.amazonaws.com/auth/foldmodel_binary/", json=payload) # Uncomment if you want to run binary classification model.
#response = requests.post("http://ec2-52-0-60-249.compute-1.amazonaws.com/auth/foldmodel_multicategory/", json=payload) # Uncomment if you want to run multi-category classification model.

try:
    response_obj = response.json()
    try:
        if(response_obj['error']==None):
            # If there is no error the response_obj dictionary contains the following keys - rules, accuracy, f1_score, precision, recall, 
            # n_rules (No of rules), n_preds (No of unique predicates), size (Ruleset size), test_results (List of test dataset results only if test dataset provided).
            # Rules can be accessed with response_obj['rules'] and are returned as a string with two rules seperated by a line break (\n).

            print('rules', response_obj['rules'])
            # Similarly you can use response_obj['accuracy'], response_obj['f1_score'], response_obj['precision'], response_obj['recall'] (These will not be generated if test dataset not provided and (hyp1>=1 or hyp1<0.5 or hyp1 is blank), 
            # response_obj['n_rules'], response_obj['n_preds'], response_obj['size'], response_obj['test_results'] (Only id test dataset provided).
            print('accuracy', response_obj['accuracy'])
            print('f1_score', response_obj['f1_score'])
            print('precision', response_obj['precision']) 
            print('recall', response_obj['recall'])
            print('n_rules', response_obj['n_rules']) 
            print('n_preds', response_obj['n_preds']) 
            print('size', response_obj['size'])
            print('test_results', response_obj['test_results'])
            
            # If save_model = "local" - You can get the model as a json object with response_obj['model_json']. You can save the model to a file using 
            with open(dataset_name+'.json', 'w') as f: f.write(response_obj['model_json'] + '\n')
        else:
            print('Error: ',response_obj['error'])
    except:
        print("There was an error processing your request.")
except:
    print(response)
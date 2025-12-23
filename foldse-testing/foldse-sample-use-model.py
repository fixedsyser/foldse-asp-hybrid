
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
import requests
import configparser

# reads config
config = configparser.ConfigParser()
config.read("config.ini")


# Enter File Paths
json_path = "./foldse-testing/model/autism.json" # Enter the model file path
test_path_list = ['./data/autism.csv'] # Enter the test dataset paths as a comma seperated list

with open(json_path, 'r') as f:
    model_json = f.read()

test_df_json_list = []
for test_path in test_path_list:
    test_df = pd.read_csv(test_path)
    try:
        test_data_frame_json = test_df.to_json(orient='split')
        test_df_json_list.append(test_data_frame_json)
    except:
        print("Error processing file at file path ",test_path)

payload = {
    'username': config.get("settings", "foldse_username"),
    'password': config.get("settings", "foldse_password"),
    'test_data_frame_json_list': test_df_json_list,
    'json_model': model_json
}

response = requests.post("http://ec2-52-0-60-249.compute-1.amazonaws.com/auth/foldmodel_binary_json/", json=payload) # Uncomment if you want to run binary classification model.
#response = requests.post("http://ec2-52-0-60-249.compute-1.amazonaws.com/auth/foldmodel_multicategory_json/", json=payload) # Uncomment if you want to run multi-category classification model.

try:
    response = response.json()
    for response_obj in response:
        try:
            if(response_obj['error']==None):
                # If there is no error the response_obj dictionary contains the following keys - accuracy, f1_score, precision, recall, test_results (List of test dataset results only if test dataset provided).
                print("accuracy", response_obj['accuracy'])
                print('f1_score', response_obj['f1_score'])
                print('precision', response_obj['precision'])
                print('recall', response_obj['recall'])
                
                # Similarly you can use response_obj['accuracy'], response_obj['f1_score'], response_obj['precision'], response_obj['recall'], response_obj['test_results'].
            else:
                print('Error: ', response_obj['error'])
        except:
            print("There was an error processing your request.")
except:
    print(response)
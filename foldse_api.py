import configparser
import json
import requests
import pandas as pd

from fold_model import FoldModel


# reads config
config = configparser.ConfigParser()
config.read("config.ini")

def generate_model(model: FoldModel, train_dict, dataset_name) -> FoldModel:
    train_df = pd.DataFrame.from_dict(train_dict)
    print("generating model for dataset " + dataset_name + "..")
    
    data_frame_json = train_df.to_json(orient='split', index=True)

    username = config.get("settings", "foldse_username")
    password = config.get("settings", "foldse_password")

    nums = ','.join(model.num_attrs)
    strs = ','.join(model.str_attrs)

    payload = {
        'username': username,
        'password': password,
        'data_frame_json': data_frame_json, 
        'numattrs': nums,
        'strattrs': strs,
        'hyp1': "", # Enter the Train Test split (Ignore if providing a seperate test dataset. If you keep hyp1 as blank or enter a value <0.5 or >=1 only rules will be generated, no testing will be done)
        'hyp2': "0.5", # Enter the Level of exceptions ratio
        'hyp3': "0.005", # Enter the Tail ratio
        'positive_value': '1',
        'test_data_frame_json': '',
        'label_value': 'label',
        'save_model' : "local"
    }
    try:
        response = requests.post("http://ec2-52-0-60-249.compute-1.amazonaws.com/auth/foldmodel_binary/", json=payload) # Uncomment if you want to run binary classification model.
        response_obj = response.json()
        if(response_obj['error']==None):             
            return set_model(response_obj, model)
        
        else:
            print('Error: ',response_obj['error'])
    except Exception as e:
        print("There was an error processing your request:")
        print(e)
    return model

def predict_with_model(model: FoldModel, test_dict)  -> list[bool]:
    print('predict with foldse...')
    test_df = pd.DataFrame.from_dict(test_dict)
    test_data_frame_json = test_df.to_json(orient='split', index=True)
    json_model = model
    json_model.label = 'label'
    json_model.rule_head = ('label', '==', '1')
    json_model.pos_val = '1'
    json.dumps((json_model.__dict__))
    
        
    payload = {
        'username': config.get("settings", "foldse_username"),
        'password': config.get("settings", "foldse_password"),
        'test_data_frame_json_list': [test_data_frame_json],
        'json_model': json.dumps((model.__dict__))
    }

    response = requests.post("http://ec2-52-0-60-249.compute-1.amazonaws.com/auth/foldmodel_binary_json/", json=payload) # Uncomment if you want to run binary classification model.

    try:
        response = response.json()
        for response_obj in response:
            try:
                if(response_obj['error']==None):
                    return response_obj['test_results']
                else:
                    print('Error: ', response_obj['error'])
            except Exception as e:
                print("There was an error processing your request:")
                print(e)
                print("-----")
    except:
        print(response)
    return []
        

def set_model(json_obj, model):
    model_data = json.loads(json_obj['model_json'])
    model.flat_rules = model_data['flat_rules']
    model._asp = json_obj['rules']
    return model


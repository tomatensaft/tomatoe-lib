"""
restapi interface
version 0.1
"""

# imports
import logconfig
import os
import json
from flask import Flask, jsonify, request

# create app
app = Flask(__name__)

# json data/payload
jsonarraysize=10
jsonpayload = [
    { 'id': 0, 'name': 'value_00', 'value': 30 },
    { 'id': 1, 'name': 'value_01', 'value': 41  },
    { 'id': 2, 'name': 'value_02', 'value': 52  },
    { 'id': 3, 'name': 'value_03', 'value': 63  },
    { 'id': 4, 'name': 'value_04', 'value': 74  },
    { 'id': 5, 'name': 'value_05', 'value': 85  },
    { 'id': 6, 'name': 'value_06', 'value': 21  },
    { 'id': 7, 'name': 'value_07', 'value': 43  },
    { 'id': 8, 'name': 'value_08', 'value': 67  },
    { 'id': 9, 'name': 'value_09', 'value': 88  }
]

# rest-api GET all values
@app.route('/jsonpayload', methods=['GET'])
def get_jsonpayload():
    return jsonify(jsonpayload)

# rest-api GET value with ID
@app.route('/jsonpayload/<int:id>', methods=['GET'])
def get_value_by_id(id: int):
    value = get_value(id)
    if value is None:
        return jsonify({ 'error': 'valueitem does not exist'}), 404
    return jsonify(value)

# rest-api POST with payload
@app.route('/jsonpayload', methods=['POST'])
def create_value():
    global nextvalueId
    value = json.loads(request.data)
    if not valid_value(value):
        return jsonify({ 'error': 'invalid value properties.' }), 400

    value['id'] = nextvalueId
    nextvalueId += 1
    jsonpayload.append(value)

    return '', 201, { 'location': f'/jsonpayload/{value["id"]}' }

# rest api PUT new data with ID
@app.route('/jsonpayload/<int:id>', methods=['PUT'])
def update_value(id: int):
    value = get_value(id)
    if value is None:
        return jsonify({ 'error': 'value does not exist.' }), 404

    updated_value = json.loads(request.data)
    if not valid_value(updated_value):
        return jsonify({ 'error': 'invalid value properties.' }), 400

    value.update(updated_value)

    return jsonify(value)

# rest api DELETE data from array
@app.route('/jsonpayload/<int:id>', methods=['DELETE'])
def delete_value(id: int):
    global jsonpayload
    value = get_value(id)
    if value is None:
        return jsonify({ 'error': 'value does not exist.' }), 404

    jsonpayload = [e for e in jsonpayload if e['id'] != id]
    return jsonify(value), 200

# rest api helpers
def get_value(id):
    return next((e for e in jsonpayload if e['id'] == id), None)

def valid_value(value):
    for key in value.keys():
        if key != 'name':
            return False
    return True
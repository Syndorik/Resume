#!/usr/bin/env python3

import logging
import json

import connexion
from connexion import NoContent
from photographer import Photographer
from pymodm import connect
from bson.objectid import ObjectId
from bson import json_util
from bson.errors import InvalidId
from pymongo import ASCENDING
from flask import jsonify
import json
import flask

def get_photographers(offset, limit):

    return [flask.request.url_root + "photographer/" + str(ph._id)
            for ph in Photographer.objects.all().order_by([('_id', ASCENDING)]).skip(offset).limit(limit)]

def get_photographer(photographer_id):
    logging.debug('Getting photographer with id: ' + photographer_id)
    try:
        ph = Photographer.objects.get({'_id': ObjectId(photographer_id)})
        ph._data.pop('_id') # This is not very clean ...
    except (Photographer.DoesNotExist, InvalidId) as e:
        return 'Not Found', 404
    return json.loads(json.dumps(ph._data, indent=4, default=json_util.default))

def post_photographers(photographer):
    count = Photographer.objects.raw({'display_name': photographer['display_name']}).count()
    if count > 0:
        return 'Conflict', 409
    else:
        ph = Photographer(display_name = photographer['display_name'],
                          first_name = photographer['first_name'],
                          last_name = photographer['last_name'],
                          interests = photographer['interests']).save()
        return 'Created', 201, {'location': '/photographer/' + str(ph._id)}

def delete_photographer(photographer_id):
    ph = Photographer.objects.get({'_id': ObjectId(photographer_id)}).delete()
    return 'NoContent', 204

def put_photographer(photographer_id, display_name = "", first_name = "", last_name = "", interests = None):
    try:
        ph = Photographer.objects.get({'_id': ObjectId(photographer_id)})
        if display_name != "" :
            ph.display_name =display_name
            ph.save()

        if first_name != "" :
            ph.first_name = first_name
            ph.save()
        print("###")
        print(len(last_name))
        print("###")
        if last_name != "":
            ph.last_name = last_name
            ph.save()

        if interests != None:
            ph.interests = interests
            ph.save()



    except (Photographer.DoesNotExist, InvalidId) as e:
        return 'Not Found', 404

    return 'Modified', 202






logging.basicConfig(level=logging.DEBUG)
app = connexion.FlaskApp(__name__)
app.add_api('photographer_service.yml')
connect("mongodb://user:user@mongodb_photographr:27017/photographers", alias="photographers")

# from http://coderobot.downley.net/swagger-driven-testing-in-python.html
# set the WSGI application callable to allow using uWSGI:
# uwsgi --http :8080 -w app
application = app.app

if __name__ == '__main__':
    app.run(port=8080)

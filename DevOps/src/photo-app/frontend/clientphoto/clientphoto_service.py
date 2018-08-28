#!/usr/bin/env python3

import logging
import json

import connexion
from connexion import NoContent
from clientphoto import clientPhoto
from pymodm import connect
from bson.objectid import ObjectId
from bson import json_util
from bson.errors import InvalidId
from pymongo import ASCENDING
from flask import jsonify
import json
import flask
import requests

def get_clientPhotos(offset, limit):
    return [flask.request.url_root + "Photo/image/" + str(ph.photo._id)+ "/" + str(ph.author)
            for ph in clientPhoto.objects.all().order_by([('author', ASCENDING)]).skip(offset).limit(limit)]


def get_photographer(photographer_id):
    logging.debug('Getting photographer with id: ' + photographer_id)
    try:
        cc = clientPhoto.objects.raw({'author': photographer_id})
        ph =[]
        for po in cc:
            po._data.pop('_id') # This is not very clean ...
            ph.append(po._data)
        if ph == []:
            logging.debug('clientPhoto.DoesNotExist raised')
            return 'Not Found', 404
    except (clientPhoto.DoesNotExist, InvalidId) as e:
        return 'Not Found', 404
    return json.loads(json.dumps(ph, indent=4, default=json_util.default))

def get_metaimages(image_id):
    print(image_id)
    logging.debug('Getting photographer with IMAGE id: ' + image_id)
    try:
        ph = clientPhoto.objects.get({'photo':ObjectId(image_id)})
        print(ph)
    except (clientPhoto.DoesNotExist, InvalidId) as e:
        return 'Not Found', 404
    return json.loads(json.dumps(ph._data, indent=4, default=json_util.default)), 200

def get_imagefromid(image_id):
    logging.debug('Getting photographer with IMAGE id: ' + image_id)
    try:
        ph = clientPhoto.objects.get({'photo':ObjectId(image_id)})
        thep = ph.photo
        #sol = [l for l in thep]
        print("#######")
        print("#######")
    except (clientPhoto.DoesNotExist, InvalidId) as e:
        return 'Not Found', 404
    return flask.send_file(thep, mimetype = 'image/jpeg'), 200

def post_clientPhotos(authorpa= " ",itags=[" "],ilocation=" ",icomments=" ",ititle=" ",thephoto=" "):
    print("COUCOU")
    print(authorpa)
    print(thephoto)
    print("\n#\n#\n#")
    ph = clientPhoto(tags = itags,
                      title = ititle,
                      author = authorpa,
                      comments = icomments,
                      location = ilocation,
                      photo = thephoto).save()
    return 'Created', 201, {'location': '/Photo/image' + str(ph._id)}


def delete_image(image_id):
    ph = clientPhoto.objects.get({'photo': ObjectId(image_id)}).delete()
    return 'NoContent', 204

def put_image(image_id, ititle = "", iauthor = "", icomments = "", itags = None, ilocation = ""):
    try:
        ph = clientPhoto.objects.get({'photo': ObjectId(image_id)})
        if iauthor != "" :
            ph.author = iauthor

        if icomments != "" :
            ph.comments = icomments

        if itags != "":
            ph.tags = itags

        if icomments != None:
            ph.comments = icomments

        if ilocation != "":
            ph.location = ilocation

        ph.save()

    except (clientPhoto.DoesNotExist, InvalidId) as e:
        return 'Not Found', 404

    return 'Modified', 202






logging.basicConfig(level=logging.DEBUG)
app = connexion.FlaskApp(__name__)
app.add_api('clientphoto_service.yml')
connect("mongodb://user:user@mongodb_clientphoto:27017/clientPhoto", alias="clientPhoto")

# from http://coderobot.downley.net/swagger-driven-testing-in-python.html
# set the WSGI application callable to allow using uWSGI:
# uwsgi --http :8080 -w app
application = app.app

if __name__ == '__main__':
    app.run(port=8081)

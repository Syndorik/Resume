#!/usr/bin/env python3

'''
This is a very minimal implementation of a frontend for the photo application.
This implementation relies on the Flask framework (see http://flask.pocoo.org).
Of course, the frontend is a REST client of both Photo and Photographer services.
It assumes the following endpoints and associated HTTP methods for the Photo service:
- GET /photo/{id} to retrieve a photo
- GET /photo/{id}/attributes to retrieve the attributes of a photo
- GET /photos to get the list of photos uris
- POST /photographer/{id}/photos to upload a photo

This toy implementation does not handle errors. A real implementation MUST handle
errors that could be returned by the Photo and Photographer services.
'''

from flask import render_template
from flask import Flask
from flask import request
from flask import send_file
from flask import make_response

import io
import shutil
import json
import requests

app = Flask(__name__)

photographer_service = "photographer"
photo_service = "clientphoto"

@app.route('/')
def hello():
    return render_template('login.html')

@app.route('/logout')
def logout():
    return render_template('login.html')

@app.route('/register/')
def register():
    return render_template('register.html')

@app.route('/image_upload/<id>')
def image_upload(id):
    a_photographer = requests.get('http://'+photographer_service+':8080/photographer/' + str(id))
    display_name = a_photographer.json()['display_name']
    return render_template('image_upload.html', id=id, display_name=display_name)

@app.route('/photo/<id>')
def image_download(id):

    photo = requests.get('http://'+photo_service+':8081/Photo/image/' + id, headers={"Accept": "image/jpg"}, stream=True)

    # Rewrite the following code without using an intermediate file
    with open("/tmp/foo.jpg", 'wb') as f:
        photo.raw.decode_content = True
        f.write(photo.content)
        shutil.copyfileobj(photo.raw, f)

    response = make_response(send_file("/tmp/foo.jpg", mimetype='image/jpg'))
    response.headers['Pragma-Directive'] = 'no-cache'
    response.headers['Cache-Directive'] = 'no-cache'
    response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
    return response

@app.route('/gallery/<id>')
def gallery(id):

    # Get the display_name of the <id> photograph
    a_photographer = requests.get('http://'+photographer_service+':8080/photographer/' + str(id))
    display_name = a_photographer.json()['display_name']


    # The following implementation is awful: it asks for all the photos and then
    # checks for the author.
    # TODO: Add endpoint to the Photo service to get the photos from a given photographer
    # and rewrite the following code
    photos_uris = requests.get('http://'+photo_service+':8081/Photo?offset=0&limit=100')
    ids = []
    for uri in photos_uris.json():
        interm = uri.rpartition('/')[-3]
        photo_id = interm.rpartition('/')[-1]
        photo_attributes = requests.get('http://'+photo_service+':8081/Photo/ph/' + photo_id )

        if photo_attributes.json()['author'] == display_name:
            ids.append(photo_id)
    return render_template('gallery.html', ids=ids, id=id,
                           display_name=display_name,
                           image_url=request.url_root)

@app.route('/newphotographer', methods=['POST'])
def newphotographer():
    ph = request.form.to_dict()
    # Horrible ack for getting an array ... but it works
    ph.pop('interests[]')
    ph['interests'] = request.form.getlist('interests[]')
    r = requests.post('http://'+ photographer_service +':8080/photographers', json=ph)
    if 'location' in r.headers:
        id = r.headers['Location'].rpartition('/')[-1]
    else:
        return render_template('register.html', msg="Display nam already exists")
    return render_template('login.html', msg="")

@app.route('/identification', methods=['POST'])
def identification():
    display_name = request.form.to_dict()['display_name']

    # Horrible implementation to search for a display_name
    uris = requests.get('http://'+photographer_service+':8080/photographers?offset=0&limit=1000')
    for uri in uris.json():
        ph = requests.get(uri)
        if ph.json()['display_name'] == display_name:
            id = uri.rpartition('/')[-1]
            return render_template('image_upload.html', id=id, display_name=display_name)
    return render_template('login.html', msg="Login error")

@app.route('/photographer/<id>/photos', methods=['POST'])
def uploading_file(id):
    a_photographer = requests.get('http://'+photographer_service+':8080/photographer/' + str(id))
    display_name = a_photographer.json()['display_name']
    f = request.files['pic']
    sendFile= {'thephoto': f}
    print('\n # \n # \n #\n #\n #\n #\n #')
    payload = {'authorpa': display_name, 'itags': 'test=test&test', 'ilocation': 'test', 'icomments': 'test', 'ititle':'test'}
    print(payload)
    r = requests.post(url='http://'+photo_service+':8081/Photo/post',
                      files=sendFile,
                      data=payload)
    print(r)
    return render_template('image_upload.html', id=id, display_name=display_name)

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0', port= 8017)

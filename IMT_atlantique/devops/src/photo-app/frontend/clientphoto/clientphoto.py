from pymodm import MongoModel, fields
from pymongo.write_concern import WriteConcern
from bson import json_util
import json
from PIL import ImageFile
import connexion
from connexion import NoContent
from pymodm import connect

connect("mongodb://user:user@mongodb_clientphoto:27017/clientPhoto", alias="clientPhoto")
class clientPhoto(MongoModel):
    tags = fields.ListField()
    title = fields.CharField()
    author = fields.CharField()
    comments = fields.CharField()
    location = fields.CharField()
    photo = fields.ImageField()

    class Meta:
        write_concern = WriteConcern(j=True)
        connection_alias = "clientPhoto"

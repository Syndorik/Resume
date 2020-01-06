from pymodm import MongoModel, fields
from pymongo.write_concern import WriteConcern
from bson import json_util
import json

class Photographer(MongoModel):
    interests = fields.ListField()
    last_name = fields.CharField()
    display_name = fields.CharField()
    first_name = fields.CharField()

    class Meta:
        write_concern = WriteConcern(j=True)
        connection_alias = "photographers"

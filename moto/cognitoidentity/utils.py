from moto.core.utils import get_random_hex
import datetime
import jwt



def get_random_identity_id(region):
    message = {
    'email': 'first@first.com',
    'poolIdentiyId': region,
    'iat': datetime.datetime.utcnow(), 
    'exp': datetime.datetime.utcnow()+datetime.timedelta(minutes=30) 
    }
    token = jwt.encode(message,'secret', algorithm='HS256')
    return token.decode('UTF-8')



def get_user_token(region,token):
    return "{0}:{1}".format(region, token)

from flask import Flask, request
from flask_httpauth import HTTPBasicAuth


app = Flask(__name__)
auth = HTTPBasicAuth()

users = {
        'admin': '12345678'
}
app.url_map.strict_slashes = False

PINS = ['Helsinki', 'Espoo', 'Vantaa', 'Tampere']

PINS_STATUS = {'Helsinki':'0', 'Espoo': '0', 'Vantaa':'0', 'Tampere':'0'}

@auth.get_password
def get_pw(username):
        if username in users:
                return users.get(username)
        return None

@app.route('/')
@auth.login_required
def index():
        return "Hello, %s!" % auth.username()

def get_html_string():
        html_str = '<h1>*Helsinki={} *Espoo={} *Vantaa={} *Tampere={}</h1>'.format(PINS_STATUS['Helsinki'],
                                                PINS_STATUS['Espoo'],
                                            PINS_STATUS['Vantaa'],
                                            PINS_STATUS['Tampere'])
        return html_str

def parse_cmd_args(args):
        global current_status
        if str(args['CMD']) == 'SetPower':
                for key in args:
                        if key in PINS:
                                PINS_STATUS[key] = str(args[key])
                            
                return get_html_string()
    
        if str(args['CMD']) == 'GetPower':
                return get_html_string()
   

@app.route('/SetCmd', methods=['GET','POST'])
def rps():
    if request.method=="GET":
            args=request.args.to_dict()
            ret = parse_cmd_args(args)
            return ret
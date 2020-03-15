import os
import MeCab
from flask import Flask, request
import json

app = Flask(__name__)
mecab = MeCab.Tagger('-d /usr/local/lib/mecab/dic/mecab-ipadic-neologd')

@app.route('/parse', methods=['POST'])
def parse():
    try:
        data = json.loads(request.data)
        if not 'text' in data:
            return "", 400
        if not type(data["text"]) is str:
            return "", 400

        morphemes = mecab.parse(data["text"]).split("\n")[:-2]
        parsed = []
        for morpheme in morphemes:
            temp = morpheme.split("\t")
            parsed.append([temp[0], temp[1].split(",")])

        return json.dumps({
            "parsed": parsed
        }, ensure_ascii=False)
    except:
        return "", 500
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))

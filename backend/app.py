import os
from dotenv import load_dotenv
from flask import Flask, request, jsonify
import requests

load_dotenv()

app = Flask(__name__)

@app.route("/generate", methods=["POST"])
def generate_text():
    prompt = request.json.get("prompt")
    if not prompt:
        return jsonify({"error": "Prompt is required."}), 400

    try:
        url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key={os.environ.get('GEMINI_API_KEY')}"
        
        headers = {"Content-Type": "application/json"}
        data = {
            "contents": [
                {
                    "parts": [{"text": prompt}]
                }
            ]
        }

        response = requests.post(url, headers=headers, json=data)
        response.raise_for_status()
        
        return jsonify(response.json())
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
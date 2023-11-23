import base64
from fastapi import FastAPI


def image_to_data_url(image_path):
    with open(image_path, "rb") as file:
        image_data = file.read()
        base64_encoded = base64.b64encode(image_data).decode("utf-8")
        data_url = f"data:image/jpeg;base64,{base64_encoded}"
        return data_url

# Replace 'input_image.jpg' with the path to your local JPEG file
image_path = r'D:\apps\Activity-Monitoring-Of-Any-Person\activity_monitoring_of_any_person\lib\backend\profile.jpg'

data_url = image_to_data_url(image_path)
image_urls = {"image_url" : data_url}




app = FastAPI()

@app.get("/get_data")
def get_image_urls():
    return image_urls

import uvicorn
uvicorn.run(app, host="0.0.0.0", port=5200)

import logging
import os

import functions_framework
import google.cloud.logging
from msg_publisher import publish

TOPIC_PATH = os.getenv("TOPIC_PATH")
LOG_LEVEL = os.getenv("LOG_LEVEL", "INFO")
PROJECT_ID = os.getenv("GOOGLE_CLOUD_PROJECT")
REQUEST_ID = "bridge"

# Setup Google Cloud Logging
client = google.cloud.logging.Client()
client.setup_logging(log_level=getattr(logging, LOG_LEVEL))


# Setup Python logging
class CustomFormatter(logging.Formatter):
    def format(self, record):
        record.request_id = REQUEST_ID
        return super().format(record)


formatter = CustomFormatter(
    fmt="%(levelname)-5s - Request_id: %(request_id)-45s - %(message)s"
)
logger = logging.getLogger(__name__)
for handler in logging.root.handlers:
    handler.setFormatter(formatter)


@functions_framework.http
def main(request):
    try:
        # TODO: Decode and process the request body as needed
        publish(TOPIC_PATH, REQUEST_ID, {})
        return ({"message": f"msg published to topic {TOPIC_PATH}"}, 200)
    except Exception:
        logger.exception("Error while processing request")
        raise

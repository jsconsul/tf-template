import json
import logging
import os

from google.cloud import pubsub_v1

logger = logging.getLogger(__name__)

PROJECT_ID = os.getenv("GOOGLE_CLOUD_PROJECT")
REGION = os.getenv("REGION")

publisher = pubsub_v1.PublisherClient()


def publish(topic_path, request_id, data):
    try:
        logger.info(
            "Publishing message to topic: %s, request_id: %s, data: %s",
            topic_path,
            request_id,
            data,
        )
        message_bytes = json.dumps(data).encode("utf-8")
        future = publisher.publish(topic_path, data=message_bytes)
        future.result()
        logger.info("Message published.")
    except Exception as e:
        logger.error("Failed to publish message: %s", e)
        raise

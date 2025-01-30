import sentry_sdk

BUGSINK_URL = "http://xxxx@localhost:8000/1" # replaceme

sentry_sdk.init(
    BUGSINK_URL,
    send_default_pii=True,
    max_request_body_size="always",

    # Setting up the release is highly recommended. The SDK will try to
    # infer it, but explicitly setting it is more reliable:
    # release=...,

    traces_sample_rate=0,
)

raise Exception("Raised Exception on purpose to send it to Bugsink")

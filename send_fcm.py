#!/usr/bin/python

# pip install pyfcm
# ref: https://github.com/olucurious/PyFCM
from pyfcm import FCMNotification
from os import environ
from pprint import PrettyPrinter

# requirement:
# export FCM_API_KEY and FCM_TOKENS in .profile

api_key = environ["FCM_API_KEY"]
device_tokens = environ['FCM_TOKENS'].split(";")

print "using api_key=", api_key, "device_tokens=", device_tokens

fcm = FCMNotification(api_key = api_key)
pretty_printer = PrettyPrinter(indent=2)

message_title = "FCM Message Title"
message_body = "FCM Test Message"
data_message = {
	"message": "FCM Test Message",
	"link": "https://jackcsk.me"
}
result = fcm.notify_multiple_devices(registration_ids = device_tokens, message_title = message_title, message_body = message_body, data_message = data_message)
#result = fcm.multiple_devices_data_message(registration_ids = device_tokens, data_message = data_message)

print "FCM Response:"
pretty_printer.pprint(result)
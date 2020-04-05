#!/usr/bin/python3

from requests import Session, RequestException
from re import search
from contextlib import closing


def connect_to_guest():
    print("Created new session")
    session = Session()

    print("Getting redirect page")
    resp = session_get("http://172.217.8.110", session)
    if 'Location' in resp.headers:
        print("Connecting to Guest Portal...")
        url = resp.headers['Location']
        print(f"Got url {url}")

        token = search("&token=.*$", url)[0][7:]
        print(f"Got token: {token}")

        REGISTRATION_URL = 'https://guest-access.floridapoly.edu:8443/portal/SelfRegistration.action?from=LOGIN'
        REGISTRATION_POST_URL = 'https://guest-access.floridapoly.edu:8443/portal/CreateAccount.action?from=SELF_REGISTRATION'
        REGISTRATION_SIGN_ON_URL = 'https://guest-access.floridapoly.edu:8443/portal/SelfRegistrationSuccess.action?from=SELF_REGISTRATION_SUCCESS'
        USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36'
        HEADERS = {'User-Agent': USER_AGENT}

        print("Navigating to portal")
        resp = session_get(url, session, headers=HEADERS)
        print(f"Received: {resp.content}")



        formData = {"token": token}
        print("Navigating to registration page...")
        resp = session_post(REGISTRATION_URL, session, headers=HEADERS, payload=formData)
        print(f"Received response: {resp.content}")

        formData = {
                    "guestUser.fieldValues.ui_first_name": "Wdada",
                    "guestUser.fieldValues.ui_last_name": "dadwad",
                    "guestUser.fieldValues.ui_email_address": "afsdada@gmail.com",
                    "guestUser.fieldValues.ui_phone_number": 1111111111,
                    "guestUser.fieldValues.ui_location": "Florida",
                    "guestUser.fieldValues.ui_sms_provider": "Global Default",
                    "aupAccepted": "true"
                }

        print("Submitting registration")
        resp = session_post(REGISTRATION_POST_URL, session, headers=HEADERS, payload=formData)
        print(f"Received response: {resp.content}")
        print("Signing on to portal")
        resp = session_post(REGISTRATION_SIGN_ON_URL, session, headers=HEADERS)
        print(f"Received response: {resp.content}")

        print("Authorized through guest portal!")


def wait_for_connection():
    print("Waiting for connection...")
    while True:
        resp = get("http://172.217.8.110")
        if not 'Location' in resp.headers:
            print("Connection established")
            break


def session_post(url, session, payload=None, headers=None):
    try:
        print(f"Sending post request to {url} with payload {payload} and headers {headers}")
        with closing(session.post(url, data=payload, headers=headers)) as resp:
                return resp
    except RequestException as e:
        print('Error during requests to {0} : {1}'.format(url, str(e)))



def session_get(url, session, payload=None, headers=None):
    TAG = "session_get"
    try:
        print(f"Sending get request to {url} with payload {payload} and headers {headers}")
        resp = session.get(url, stream=True, params=payload, headers=headers)
        session.close()
        return resp
        
    except RequestException as e:
        print('Error during requests to {0} : {1}'.format(url, str(e)))
        session.close()
        return None


if __name__ == "__main__":
    connect_to_guest()

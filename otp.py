#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import hmac
import base64
import struct
import hashlib
import time


def get_hotp_token(secret, intervals_no):
    key = base64.b32decode(secret, True)
    msg = struct.pack(">Q", intervals_no)
    h = hmac.new(key, msg, hashlib.sha1).digest()
    o = h[19] & 15
    h = (struct.unpack(">I", h[o:o+4])[0] & 0x7fffffff) % 1000000
    return "{{:0{}d}}".format(6).format(h)


def get_totp_token(secret):
    return get_hotp_token(secret, intervals_no=int(time.time())//30)


if __name__ == "__main__":
    print(get_totp_token("YHDUNLTROQGRHSQQ"))

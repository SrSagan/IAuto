import urllib.request

r = urllib.request.urlopen('http://192.168.4.1/left')
print(r.read())
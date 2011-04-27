
from BeautifulSoup import BeautifulStoneSoup


import urllib2 

from appid import Appid
import re
import sys
import binascii


def pi(stuff):
    #makestr = 'http://api.wolframalpha.com/v2/query?input=\'1%2b1\'&format=image&appid='+Appid
#    makestr = 'http://api.wolframalpha.com/v2/query?input=\'int%20x%5e%28pi%2f3%29%20dx%200%20to%201\'&format=image&appid='+Appid
    #makestr = 'http://api.wolframalpha.com/v2/query?input=\'int%20x%5e%28pi%2f3%29%20dx%20\'&format=image&appid='+Appid
    makestr = 'http://api.wolframalpha.com/v2/query?input=\''+stuff+'\'&format=image&appid='+Appid
    get = urllib2.urlopen(makestr)
    soup = BeautifulStoneSoup(get)
    return soup, makestr



if __name__ == "__main__":
    debug = 0
    request_type = sys.argv[1]
    stuff = sys.argv[2]
    newstuff = ""

    for i in stuff:
        newstuff += "%"
        newstuff += binascii.hexlify(i)

    stuff = newstuff
    if debug:
        print stuff
        print request_type
    soup, makestr = pi(stuff)
    if debug:
        print soup.prettify()
    if request_type == 'raw':
        podiwant = soup.find('pod')
        try:
            val = dict(podiwant.img.attrs)['alt']
        except AttributeError:
            val "Didn't Work (TM)"
        print val
    elif request_type == 'indef':
        podiwant = soup.find('pod', attrs= {'title' : 'Indefinite integral'})
        try:
            val = dict(podiwant.img.attrs)['alt']
        except AttributeError:
            val "Didn't Work (TM)"
        print val

import time
import datetime
import boto3
from botocore.errorfactory import ClientError
from selenium import webdriver

from selenium.webdriver.chrome.options import Options
from pybloom import ScalableBloomFilter
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException
import pickle



options = Options()
options.headless = True
options.binary_location = '/opt/headless-chromium'
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--single-process')
options.add_argument('--disable-dev-shm-usage')


def lambda_handler(event, context):
    print('scraping logic goes here')

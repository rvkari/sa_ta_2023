from selenium import webdriver

class WebDriverManager(object):

    __driver = None

    @classmethod
    def get_web_driver(cls, browser):
        if cls.__driver is None:
            if (browser.lower()) == "chrome":
                options = webdriver.ChromeOptions() 
                options.add_argument("start-maximized")
                #options.add_experimental_option('excludeSwitches', ['enable-logging'])
                #cls.__driver = webdriver.Chrome(options=options, executable_path=r'C:\chromedriver_win32\chromedriver.exe') # Check where you have placed CHROMEDRIVER.EXE
                cls.__driver = webdriver.Chrome(options=options)
            if (browser.lower()) == "firefox":
                options = webdriver.FirefoxOptions()
                cls.__driver = webdriver.Firefox(options=options)
            #if (browser.lower()) == "edge":
                #options = webdriver.EdgeOptions()
                #cls.__driver = webdriver.Edge(options=options)


        return cls.__driver
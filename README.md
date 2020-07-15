## balenaCloud + WebdriverIO using Chromium on ARM Devices

> Superior web automation now becomes portable, with high-performance ARM-based devices.

This repository contains code of [Getting Started with Webdriverio](https://webdriver.io/docs/gettingstarted.html) compatible to run as a service on balenaCloud with any balenaOS ARM device such as BalenaFin, Raspberrypi3 and more. Tested on [balenaFin](https://www.balena.io/fin) running balenaOS 2.48.0+rev1


![](https://webdriver.io/img/devtools.png)
Illustration Source: [WebdriverIO docs](https://webdriver.io/docs/automationProtocols.html#devtools-protocol) 

Chromedriver and Selenium not being available for the ARM architecture. Lead us to work with WebDriverIO for our web automation and testing needs, which uses [Chrome DevTools protocol](https://webdriver.io/blog/2019/09/16/devtools.html) by default. Using Chrome Devtools protocol natively and replacing legacy Webdriver Protocol comes with many benefits. Some being: 

- Lesser dependencies to manage
- Works natively with major browsers without the need for a driver (even Firefox)
- Faster, more efficient performance (The communication happens without any proxy, directly to the browser using WebSockets)
- Be able to test browser performance and much more. 

It has cons too which are better explained on [WebdriverIO Automation protocols](https://webdriver.io/docs/automationProtocols.html#devtools-protocol) page. Mainly, it can't be used remotely which works out for us as we run everything in containers. Let's get started.

## Quick installation for local testing

1. Clone the repository using 

```
git clone REPO_URL
```

1. Navigate to the cloned repository in your system.
2. In the terminal run the command,

```      
sudo apt install chromium-browser git-core python3 gcc g++ make
```

1. Next, install the dependencies. If you don't have Node installed, then install the [latest Node LTS](https://nodejs.org/en/download/) version. 

```
npm install
```
 
1. Run Webdriver. 

```
npx wdio wdio.conf.js -y
```

The tests will run, open Chromium browser with the arguments provided in the [wdio.conf.js](https://github.com/vipulgupta2048/balena-webdriverio/blob/master/wdio.conf.js) file, connect puppeteer with the browser, and execute the tests. In the end, you would see test results over on the terminal.


## Run Webdriver on balenaCloud

[![](https://www.balena.io/deploy.png)](https://dashboard.balena-cloud.com/deploy)

1. Grab a balenaFin, flash with the configuration for the application you just deployed, connect it, and wait for the magic to happen.
2. Head over to the balenaCloud application to see if your device is online (It take at most 2-5 minutes)
3. When done, the device would automatically start downloading the latest docker image and when done will run the tests. 
4. You can check the output in the logs on your balenaCloud dashboard
   
![](https://user-images.githubusercontent.com/22801822/87546279-ebcb1280-c6c6-11ea-91b5-6ae202fb21fd.png)
Webdriverio Testrunner running on BalenaFin over on Balena Cloud 

That's about it, now you can modify your tests from the tests folder (Written using Mocha) and explore more into Web automation and Webdriverio

## Support & Credits
For any queries or bug reports, feel free to open an issue.
Thanks to Christian Bromann for his help! 

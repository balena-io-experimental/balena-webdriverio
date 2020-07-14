## Running WebdriverIO + Chromium with ChromeDev Tools Protocol

More about what this protocol is all about - https://webdriver.io/blog/2019/09/16/devtools.html
Also, a comparison with past and present explaining why we won't need a Chromedriver now - https://webdriver.io/docs/automationProtocols.html#devtools-protocol

## How to get started?
1. `git clone git@github.com:vipulgupta2048/psychic-octo-barnacle.git webdriver`
2. `cd webdriver`
3. `npm install` 
4. `sudo apt install chromium-browser git-core python3 gcc g++ make` or similar for MacOS. Most you would already have.
5. `npx wdio wdio.conf.js -y`

Runs best on Node --> v12.18.2, 

## How to run it on your device on BalenaCloud?
1. Grab a balenaFin, flash with configuration for `webdriver-e2e` application or just move a online device if you have to the application.
2. The device won't auto run the test, since I wanted to debug it first. 
3. SSH into the `webdriver` service
4. `npx wdio wdio.conf.js -y`

## Problems 
As you can see, it runs like a charm locally (I hope) and much better, faster. It's driver independent. Running directly using Chrome DevTools protocol.

In the container though, we get the error 

```
[0-0] 2020-07-14T14:43:04.299Z INFO devtools: Launch Google Chrome with flags: --disable-extensions --disable-background-networking --disable-background-timer-throttling --disable-backgrounding-occluded-windows --disable-sync --metrics-recording-only --disable-default-apps --mute-audio --no-first-run --disable-hang-monitor --disable-prompt-on-repost --disable-client-side-phishing-detection --password-store=basic --use-mock-keychain --disable-component-extensions-with-background-pages --disable-breakpad --disable-dev-shm-usage --disable-ipc-flooding-protection --disable-renderer-backgrounding --enable-features=NetworkService,NetworkServiceInProcess --disable-features=site-per-process,TranslateUI,BlinkGenPropertyTrees --window-position=0,0 --window-size=1200,900 headless disable-gpu no-sandbox

[0-0] 2020-07-14T14:43:29.598Z ERROR @wdio/runner: Error: connect ECONNREFUSED 127.0.0.1:50653
    at TCPConnectWrap.afterConnect [as oncomplete] (net.js:1141:16)
[0-0]  Error:  connect ECONNREFUSED 127.0.0.1:50653

[0-0] FAILED in chrome - /test/specs/basic.js
2020-07-14T14:43:29.750Z INFO @wdio/cli:launcher: Run onComplete hook

Spec Files:	 0 passed, 1 failed, 1 total (100% completed) in 00:00:28 

2020-07-14T14:43:29.756Z INFO @wdio/local-runner: Shutting down spawned worker
2020-07-14T14:43:30.013Z INFO @wdio/local-runner: Waiting for 0 to shut down gracefully
2020-07-14T14:43:30.016Z INFO @wdio/local-runner: shutting down
```

Debugging steps taken to resolve this error 
- Change `network_mode` to `host` (I thought it to be a port issue at first)
- Talked with maintainer, if we can get puppeteer to connect at one specific port and not random ones. https://gitter.im/webdriverio/webdriverio?at=5f0c9491f017fc46213a60d1
- Tried finding the code in Devtools package where ports are being set. No mention of ports at all. 
- There are several solutions for this problem online, but they all relate to selenium server not running. Obviously we are not running Selenium. Check this out https://blog.kevinlamping.com/common-selenium-and-webdriverio-error-messages/#errorconnecteconnrefused1270014444 (But now that I think about it. Have to check my local system but highly unlikely)
- And, several more. 

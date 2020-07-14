## Running Webdriver with ChromeDev Tools Protocol

More about what this protocol is all about - https://webdriver.io/blog/2019/09/16/devtools.html
Also, a comparison with past and present explaining why we won't need a Chromedriver now - https://webdriver.io/docs/automationProtocols.html#devtools-protocol


## How to get started?
1. Clone 
2. Run `npm install` 
3. RUN `sudo apt install chromium-browser` or similar for MacOS. 
4. Run `npx wdio wdio.conf.js -y`

## How to run it on your device?
1. Grab a balenaFin, flash with configuration for `webdriver-e2e` application or just move a online device if you have. I find moving to be much easier than flashing. 
2. The device won't auto run the test, since I wanted to debug it first. 
3. SSH into the `webdriver` service
4. Run `npx wdio wdio.conf.js -y`

## Problems 
As you can see, it runs like a charm locally and much better faster. It's driver independent. Running directly using Chrome DevTools directly.

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

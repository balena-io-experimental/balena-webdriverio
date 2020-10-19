describe('webdriver.io page', () => {
    it('should have the right title', () => {
		browser.url('file:///home/chromium/index.html')
        expect(browser).toHaveTitle("balenalabs-browser");
    })
})

describe('webdriver.io page', () => {
    it('should have the right title', () => {
        browser.url('https://balena.io')
        expect(browser).toHaveTitle('balena - The complete IoT fleet management platform');
    })
})

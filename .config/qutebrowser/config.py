config.load_autoconfig()

config.set('content.blocking.method', 'adblock')
# Bindings
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('O', 'set-cmd-text :open {url}')
config.bind('J', 'tab-next')
config.bind('gt', 'tab-next')
config.bind('<Ctrl+l>', 'tab-next')
config.bind('<Ctrl+h>', 'tab-prev')
config.bind('gT', 'tab-prev')
config.bind('<backspace>', 'back')
config.bind(';o', 'hint links fill :open {hint-url}')
config.bind(';O', 'hint links fill :open -t {hint-url}')
config.bind('<ctrl-->', 'zoom-out')
config.bind('<ctrl-+>', 'zoom-in')
config.bind('Gh', 'back -t')
config.bind('Gl', 'forward -t')

c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/easylistdutch.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']

def makePadding(top, bottom, left, right):
    return { 'top': top, 'bottom': bottom, 'left': left , 'right': right }
# Disable media keys
config.set('input.media_keys', False)
# Downloads
config.set('downloads.location.suggestion', 'both')
# Tabs
config.set('tabs.background', True)
config.set('tabs.indicator.width', 0)
config.set('tabs.padding', makePadding(2, 2, 5, 5))
#config.set('tabs.position', 'left');
#config.set('tabs.width', 270);
# Statusbar
config.set('statusbar.padding', makePadding(0, 2, 2, 0))
# Completion
config.set('completion.height', '27%')
# Content
config.set('content.pdfjs', True)
# Url
config.set('url.searchengines', {
    "DEFAULT": "https://google.com/search?hl=en&q={}",
    "imdb": "http://www.imdb.com/find?q={}",
    "sk": "http://www.sanakirja.org/search.php?q={}",
    "gr": "https://www.goodreads.com/search?q={}",
    "trans": "https://translate.google.com/#auto/en/{}"
})
config.set('content.webgl', False)

# Colors
#c.colors.webpage.darkmode.enabled = True
fg_default = '#e0def5'
bg_default = '#191724'
hilight_bg = '#2E2B46'
selected_item = '#9ccfd8'
completion_text = '#eb6f92'
error_color = '#eb6f92'

# Messages
c.colors.messages.error.bg = error_color
c.colors.messages.error.fg = bg_default
c.colors.messages.info.bg = hilight_bg
c.colors.messages.info.fg = fg_default

# Downloads
c.colors.downloads.bar.bg = bg_default
c.colors.downloads.start.fg = fg_default
c.colors.downloads.stop.bg = selected_item
c.colors.downloads.stop.fg = bg_default
c.colors.downloads.start.bg = hilight_bg

# Completion
c.colors.completion.item.selected.match.fg = completion_text
c.colors.completion.match.fg = completion_text
c.colors.completion.fg = fg_default
c.colors.completion.odd.bg = bg_default
c.colors.completion.even.bg = bg_default
c.colors.completion.category.fg = fg_default
c.colors.completion.category.bg = hilight_bg
c.colors.completion.category.border.top = 'transparent'
c.colors.completion.item.selected.bg = selected_item
c.colors.completion.item.selected.border.top = selected_item
c.colors.completion.item.selected.border.bottom = selected_item
# Tabs
c.colors.tabs.bar.bg = bg_default
c.colors.tabs.odd.fg = fg_default
c.colors.tabs.odd.bg = bg_default
c.colors.tabs.even.fg = fg_default
c.colors.tabs.even.bg = bg_default
c.colors.tabs.selected.odd.fg = fg_default
c.colors.tabs.selected.odd.bg = hilight_bg
c.colors.tabs.selected.even.fg = fg_default
c.colors.tabs.selected.even.bg = hilight_bg
# Status
c.colors.statusbar.normal.bg = bg_default
c.colors.statusbar.command.fg = fg_default
c.colors.statusbar.command.bg = bg_default

# Fonts
c.fonts.messages.info = '10pt monospace'
c.fonts.messages.error = '10pt monospace'
c.fonts.messages.warning = '10pt monospace'
c.fonts.completion.entry = '11pt monospace'
c.fonts.completion.category = '11pt monospace'
c.fonts.statusbar = '11pt monospace'
c.fonts.tabs.unselected = '10pt monospace'
c.fonts.tabs.selected = '10pt monospace'

# Bindings
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('O', 'set-cmd-text :open {url}')
config.bind('J', 'tab-focus')
config.bind('gt', 'tab-focus')
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
config.bind('s', 'set content.user_stylesheets ~/.local/share/qutebrowser/userstyle.css ;; reload')
config.bind('S', 'set content.user_stylesheets "" ;; reload')

def makePadding(top, bottom, left, right):
    return { 'top': top, 'bottom': bottom, 'left': left , 'right': right }

# Tabs
config.set('tabs.background', True)
config.set('tabs.favicons.show', False)
config.set('tabs.width.indicator', 0)
config.set('tabs.padding', makePadding(2, 2, 5, 5))
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
    "trans": "https://translate.google.com/#auto/en/{}"
})
config.set('content.webgl', False)

# Colors
c.colors.completion.fg = '#ebdbb2'
c.colors.completion.odd.bg = '#282828'
c.colors.completion.category.fg = '#ebdbb2'
c.colors.completion.category.bg = '#458588'
c.colors.completion.category.border.top = 'transparent'
c.colors.completion.item.selected.border.top = '#e8c000'
c.colors.tabs.odd.fg = '#ebdbb2'
c.colors.tabs.odd.bg = '#282828'
c.colors.tabs.even.fg = '#ebdbb2'
c.colors.tabs.even.bg = '#282828'
c.colors.tabs.selected.odd.fg = '#ebdbb2'
c.colors.tabs.selected.odd.bg = '#458588'
c.colors.tabs.selected.even.fg = '#ebdbb2'
c.colors.tabs.selected.even.bg = '#458588'
c.colors.statusbar.normal.bg = '#282828'
c.colors.statusbar.command.fg = '#ebdbb2'
c.colors.statusbar.command.bg = '#282828'

# Fonts
c.fonts.tabs = '11pt monospace'
c.fonts.messages.info = '10pt monospace'
c.fonts.messages.error = '10pt monospace'
c.fonts.messages.warning = '10pt monospace'
c.fonts.completion.entry = '11pt monospace'
c.fonts.completion.category = '11pt monospace'
c.fonts.statusbar = '11pt monospace'
c.fonts.monospace = 'Ubuntu Mono'

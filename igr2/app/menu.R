# menu.R

menuElement <- dropdownMenu(
  type = 'messages',
  badgeStatus = 'success',
  messageItem('Support Team',
              'This is the content of the message',
              time = '5 mins'),
  messageItem('Support Team',
              'This is the content of another message',
              time = '2 hours'),
  messageItem('New User',
              'Can I get some help?',
              time = 'Today')
)
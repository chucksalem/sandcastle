ActionMailer::Base.smtp_settings = { 
  port: '587',
  address: 'smtp.mailgun.org',
  user_name: 'postmaster@sandbox8120f6a879d1457a99765c0d2aeb2392.mailgun.org',
  password: '6e9cb27d3ada515b8f9f825e607d5a4c',
  domain: 'sandbox8120f6a879d1457a99765c0d2aeb2392.mailgun.org',
  authentication: :plain,
  enable_starttls_auto: true
} 

ActionMailer::Base.delivery_method = :smtp
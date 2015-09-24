if %w(test development).include?(Rails.env)
  Paperclip::Attachment.default_options.merge!(
    path: ':rails_root/public/system/:class/:attachment/:record_locator/:filename',
    url: '/system/:class/:attachment/:record_locator/:filename')
else
  Paperclip::Attachment.default_options.merge!(
    path: ':class/:attachment/:record_locator/:filename',
    storage:              :s3,
    s3_credentials:       Rails.configuration.aws,
    s3_protocol:          'https',
    bucket:               Rails.configuration.aws[:bucket],
    url: ':s3_domain_url'
  )
end

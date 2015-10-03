Paperclip::Attachment.default_options.merge!(
  path: ':rails_root/public/system/:class/:attachment/:record_locator/:filename',
  url: '/system/:class/:attachment/:record_locator/:filename')

# copyright: 2018, The Authors

# you add controls here
control "NGX-0003" do                        # A unique ID for this control
  title "Verify NGINX modules installed"
  impact 1.0                                # The criticality, if this control fails.
  desc "The installed modules should include #{input('nginx_modules').join(", ")}"
  desc 'fix', "Install the following modules: #{input('nginx_modules').join(", ")}."  
  tag severity: 'high'
  
  nginx_modules = input('nginx_modules')

  describe nginx do
    nginx_modules.each do |current_module|
      its('modules') { should include current_module}
    end
    # its('modules') { should include 'http_ssl' }
    # its('modules') { should include 'stream_ssl' }
    # its('modules') { should include 'mail_ssl' }
  end

end

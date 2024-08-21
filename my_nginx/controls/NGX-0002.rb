# copyright: 2018, The Authors

# you add controls here
control "NGX-0002" do                        # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "Check NGINX version is at least #{input('nginx_version')}"             # A human-readable title
  desc "The version of NGINX available should be at least ${input('nginx_version')}"
  desc 'fix', "Install NGINX version #{input('nginx_version')} or greater."  
  tag severity: 'high'
  
  describe nginx.version do
    it { should cmp >= input('nginx_version') }
  end

end

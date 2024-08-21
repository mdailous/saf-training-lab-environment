# copyright: 2018, The Authors

# you add controls here
control "NGX-0001" do                        # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "Verify NGINX installation."  
  summary "Make sure NGINX is installed. If it is not, nothing else will work."
  desc 'fix', "Install NGINX version #{input('nginx_version')} or greater."  
  tag severity: 'high'
  
  describe package('nginx') do
    it { should be_installed }
  end
  
end

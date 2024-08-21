# copyright: 2018, The Authors

# you add controls here
control "NGX-0004" do                        # A unique ID for this control
  title "The NGINX configuration file should exist as a file."
  impact 1.0                                # The criticality, if this control fails.
  desc 'fix', "Make sure the configuration file exists and is a file."  
  tag severity: 'high'

  describe file(input('nginx_conf')) do
    it { should exist }
    it { should be_file }
  end

end

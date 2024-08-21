# copyright: 2018, The Authors

# you add controls here
control "NGX-0005" do                        # A unique ID for this control
  title "Verify nginx.conf file ownership and permissions"
  impact 0.7                                # The criticality, if this control fails.
  desc "The NGINX configuration file should:
    * be owned by the `root` user and group.
    * not be readable, writeable, or executable by others.
  "
  desc 'fix', "Make sure the owner and permissions of the `nginx.conf` are correct."  
  tag severity: 'high'

  describe file(input('nginx_conf')) do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should_not be_readable.by('others') }
    it { should_not be_writable.by('others') }
    it { should_not be_executable.by('others') }
  end

end

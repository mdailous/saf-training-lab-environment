# copyright: 2018, The Authors

control "NGX-0006" do  
  title "The NGINX shell access should be restricted to admin users."
  impact 0.7                                # The criticality, if this control fails.
  desc "The NGINX shell should be limited to admin users only."
  desc 'fix','Change the NGINX shell permissions'
  tag severity: 'high'

  describe users.shells(/bash/).usernames do
    it { should be_in input('admin_users') }
  end

end

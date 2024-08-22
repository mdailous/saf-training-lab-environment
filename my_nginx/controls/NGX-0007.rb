# copyright: 2018, The Authors

control "NGX-0007" do  
  title "Require a manual attestation."
  impact 1.0                                # The criticality, if this control fails.
  desc "This is a test that will force the pipeline to require an attestation."
  desc 'fix','Manually attest this validation'
  tag severity: 'high'

  describe 'Manual attestation' do
    skip 'Needs a manual attestation'
  end

end

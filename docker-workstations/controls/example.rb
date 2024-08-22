title "Example"

describe yaml('./resources/docker-compose.yml') do
  its(['services', 'workstation', 'image']) { should eq 'learnchef/inspec_workstation' }
  its(['services', 'workstation', 'volumes']) { should cmp '.:/root' }
end

describe docker_compose_config(input('config_path')) do
  its('services.workstation.image') { should eq 'learnchef/inspec_workstation' }
  its('image') { should eq 'learnchef/inspec_workstation' }
  its('services.workstation.volumes') { should cmp '.:/root' }
end
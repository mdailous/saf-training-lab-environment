# Uncomment the below lines to add gems and files required by the resource
require "hashie/mash"
# require_relative ""

# Change module if required
module Inspec::Resources
  # Most custom InSpec resource inherit from a dynamic class, InSpec.resource(1).
  # If you wish to inherit from a core resource, you need to follow special instructions -
  # see https://www.chef.io/blog/extending-inspec-resources-core-resource-inheritance
  class DockerComposeConfig < Inspec.resource(1)
    # Every resource requires an internal name.
    name "docker_compose_config"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    # supports platform: "linux"

    desc "Resource for inspecting Docker Compose configurations"

    example <<~EXAMPLE
      describe docker_compose_config('path-to-compose-file') do
        its('services.workstation.image') { should eq 'learnchef/inspec_workstation' }
        its('services.workstation.volumes') { should cmp '.:/root' }
      end
    EXAMPLE

    # Resource initialization. Add any arguments you want to pass to the contructor here.
    # Anything you pass here will be passed to the "describe" call:
    # describe docker_compose_config(YOUR_PARAMETERS_HERE) do
    #   its("shoe_size") { should cmp 10 }
    # end
    def initialize(path)
      skip_resource "The #{path} file does not exist." unless inspec.file(path).exist?
      skip_resource "The #{path} file is not a Docker Compose file" unless (inspec.yaml(path).version && inspec.yaml(path).services)
      @path = path
      @yaml = inspec.yaml(path)
    end

    def services
      Hashie::Mash.new(@yaml['services'])
    end

    def workstation
      Hashie::Mash.new(services()['workstation'])
    end

    def image
      Hashie::Mash.new(workstation()['image'])
    end

    def volumes
      Hashie::Mash.new(workstation()['volumes'])
    end

    def to_s
      "Docker Compose Config #{@path || "content"}"
    end

  end
end

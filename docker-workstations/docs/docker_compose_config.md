+++
title = "docker_compose_config resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "docker_compose_config"
    identifier = "inspec/resources/docker_compose_config.md docker_compose_config resource"
    parent = "inspec/resources"
+++

Use the `docker_compose_config` Chef InSpec audit resource to test the Docker Compose configuration file.


## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `docker_compose_config` Chef InSpec audit resource ...

    describe docker_compose_config('path-to-compose-file') do
      its('services.workstation.image') { should eq 'learnchef/inspec_workstation' }
      its('services.workstation.volumes') { should cmp '.:/root' }
    end
where

- `'shoe_size'` is some property of this resource
- `42` is the value to test for shoe size
- `be_purple` is a matcher of this resource
- `have_bells` is a matcher of this resource

## Properties

- Properties of the resources: `shoe_size`

### shoe_size

The shoe_size property tests ....

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).

The specific matchers of this resource are: `be_purple`, `have_bells`

### be_purple

The `be_purple` matcher tests the ...:

    it { should be_purple }

## Examples
The following examples show how to use this Chef InSpec audit resource.

### Example 1

`shoe_size` returns ...

    describe docker_compose_config do
      its("shoe_size") { should eq 42 }
    end

### Example 2

`be_purple` checks for ...

    describe docker_compose_config do
      it { should be_purple }
    end


# copyright: 2018, The Authors

title "sample section"
# encoding: utf-8
# copyright: 2018, The Authors

git_dir = input('project_path')

# The following banches should exist
describe git(git_dir) do
  its('branches') { should include 'main' }
  its('branches') { should include 'testBranch' }
  its('current_branch') { should cmp 'main' }
  its('last_commit_hash') { should match /^e5f562/ }
  its('last_commit_hash_short') { should eq 'e5f5620' }
  its('previous_commit_hash') { should match /^15bd19/ }
  its('previous_commit_hash_short') { should eq '15bd199' }
end

# # What is the latest commit
# describe command("git --git-dir #{git_dir} log -1 --pretty=format:'%h'") do
#   its('stdout') { should match /edc207f/ }
# end

# # What is the second to last commit
# describe command("git --git-dir #{git_dir} log --skip=1 -1 --pretty=format:'%h'") do
#   its('stdout') { should match /8c30bff/ }
# end

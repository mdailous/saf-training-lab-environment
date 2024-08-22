# encoding: utf-8
# copyright: 2019, The Authors

class Git < Inspec.resource(1)
    name 'git'

    def initialize(path)
        @path = path
    end

    def branches
        run_command("branch")
    end

    def current_branch
        run_command("rev-parse --abbrev-ref HEAD").strip
    end

    def last_commit_hash
        run_command("rev-parse HEAD").strip
    end

    def last_commit_hash_short
        run_command("rev-parse --short HEAD").strip
    end

    def previous_commit_hash
        run_command("rev-parse HEAD~1").strip
    end

    def previous_commit_hash_short
      run_command("rev-parse --short HEAD~1").strip
    end

    private

    # Methods to help the resource's public methods
    def run_command(command)
        inspec.command("git --git-dir #{@path} #{command}").stdout
    end
end
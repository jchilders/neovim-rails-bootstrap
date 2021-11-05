#!/usr/bin/env ruby
# frozen_string_literal: true

require 'English'
require 'net/ssh'
require 'net/ssh/proxy/socks5'

proxy = Net::SSH::Proxy::SOCKS5.new('52.222.32.121', 2001, user: 'dsva')
Net::SSH.start('172.31.2.171', 'socks', proxy: proxy, forward_agent: true) do |ssh|
  ssh.open_channel do |channel|
    channel.on_data do |_ch, data|
      puts data
    end
  end
  ssh.loop { true }
end

def run_ssh(host, user, password, command)
  Net::SSH.start(host, user, password: password) do |ssh|
    ssh.open_channel do |channel|
      channel.exec(command) do |_ch, _success|
        channel.on_data do |_ch, data|
          puts data
        end
      end
    end
    ssh.loop { true }
  end
end

run_ssh(host, u, p, cmd)

# pid = fork do
#   # cmd = 'ssh socks -D 2001 -N'
#   cmd = 'ssh localhost -D 1080 -N'
#   system(cmd)
# end


# Process.detach(pid)

puts "It stopped! exit code: #{$CHILD_STATUS}"

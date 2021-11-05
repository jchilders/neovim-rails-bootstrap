# frozen_string_literal: true

Eye.config do
  logger File.expand_path(File.join(File.dirname(__FILE__), %w[log sleeper.log]))
end

Eye.application 'sleeper' do
  working_dir File.expand_path(File.join(File.dirname(__FILE__), %w[processes]))
  stdall 'trash.log'

  process :sleeper do
    pid_file 'sleeper.pid'
    start_command 'sleeper.rb'
    stdout 'sleeper.out'
    daemonize true
    stop_signals [:QUIT, 2.seconds, :KILL]
  end
end

# Eye.application 'vasocks' do
#   process :ssh_socks do
#     daemonize true
#     pid_file 'va_socks.pid'
#     stdout 'va_socks.log'
#     start_command 'ssh socks -D 2001 -N'
#     stop_signals [:QUIT, 2.seconds, :KILL]

#     # check :socket,
#     #       addr: 'tcp://127.0.0.1:2001',
#     #       every: 1.minute,
#     #       times: 2,
#     #       timeout: 1.second
#   end
# end

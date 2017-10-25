#namespace :setup_account do
desc "Setup an account"
task setup_account: %i(common) do
  logger.debug "creating account..."
  logger.info  "created account!"
end
#end

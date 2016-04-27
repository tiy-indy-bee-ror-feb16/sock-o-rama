# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


# Together with the Rake.application.remove_task in db/test.rake, when uncommented the block below will prevent the test database from being reset in between runs of the test suite

# Rake::TaskManager.class_eval do
#   def remove_task(task_name)
#     @tasks.delete(task_name.to_s)
#   end
# end

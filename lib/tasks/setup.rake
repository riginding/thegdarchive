desc "setup thegdarchive"
task :setup do
  begin
    # Check if there are pending migrations
    silence { Rake::Task["db:abort_if_pending_migrations"].invoke }
    puts "Skip: Database already setup"
  rescue Exception
    silence do
      Rake::Task["db:create"].invoke
      Rake::Task["db:schema:load"].invoke
    end
    puts "Database setup"
  end
  Rake::Task["db:seed"].invoke
  puts "Seed Data loaded"
end
def silence
  begin
    orig_stderr = $stderr.clone
    orig_stdout = $stdout.clone

    $stderr.reopen File.new('/dev/null', 'w')
    $stdout.reopen File.new('/dev/null', 'w')

    return_value = yield
  rescue Exception => e
    $stdout.reopen orig_stdout
    $stderr.reopen orig_stderr
    raise e
  ensure
    $stdout.reopen orig_stdout
    $stderr.reopen orig_stderr
  end

  return_value
end

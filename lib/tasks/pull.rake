namespace :feeder do
  desc 'Pull one specific feed: "rake feeder:pull[feed_name]"'
  task pull: :environment do |_task, args|
    feed_name = args.extras[0]
    raise 'feed name is required' unless feed_name
    feed = Service::FeedBuilder.call(feed_name)
    PullJob.perform_later(feed)
  end

  desc 'Pull all feeds'
  task pull_all: :environment do
    Service::FeedsList.names.each do |feed_name|
      feed = Service::FeedBuilder(feed_name)
      PullJob.perform_later(feed)
    end
  end

  desc 'Pull stale feeds'
  task pull_stale: :environment do
    BatchPullJob.perform_later
  end
end

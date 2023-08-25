class DashboardController < ApplicationController
  def index
    start_app_time = Time.now
    response.headers['Last-Modified'] = Time.now.httpdate
    @helloWorld = "Hello from Dashboard#Controller"
    end_app_time = Time.now
    elapsed_load_time = end_app_time - start_app_time
    Rails.logger.info "Elapsed For fetched data is #{elapsed_load_time} s"

    render stream: true
  end

  def kindaSlowString
    "This is just a slow string"
  end

  def slowMethod
    sleep(2)
    "executed in 2 seconds 😴😴😴"
  end

  def actuallySlowThing
    start_time = Time.now
    return @the_slow_thing if defined? @the_slow_thing

    @the_slow_thing ||= begin
      sleepyTimeParam = request.query_parameters['sleep']
      Rails.logger.info "sleep time set! #{sleepyTimeParam}"

      if sleepyTimeParam
        Rails.logger.info "sleep time set! #{sleepyTimeParam}"
        sleepyTime = sleepyTimeParam.to_i
        if sleepyTime > 0
          Rails.logger.info "sleepyTime #{sleepyTime}"
          sleep(sleepyTime)

          return "Executed in #{sleepyTime}s"
        end
      end

      "Executed in 0s. Slow this down with `?sleep=<int>`"
    end

    end_time = Time.now
    elapsed_time = end_time - start_time
    Rails.logger.info "elapsed_time of actuallySlowThing: #{elapsed_time}"

    return @the_slow_thing
  end
end

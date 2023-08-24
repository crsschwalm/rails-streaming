# Scratch Rails Project

Trying out [ActionController::Streaming](https://api.rubyonrails.org/classes/ActionController/Streaming.html) and [ActionController::Live](https://api.rubyonrails.org/classes/ActionController/Live.html).

## Run the app locally

1. Clone the app
2. Install Ruby (v2.7.0) & sqlite3
3. Install Rails `gem install rails`
4. `cd <project>`
5. Start the server `bin/rails server`


## Routes

### `/` (`/?sleep=3`)

renders the default layout in `application.html.erb` and the "dashboard" template `dashboard/index.html.erb`

Accepts a query param `sleep` which increases the time to derive a slow function in the DashboardController.

This shows capabilities of HTML streaming - you should see `<head>` content as well as Layout content that precedes rendering the dashboard template.

### `/stream`

This route streams text content via the StreamController.  It updates the response value 5 times, waiting 1 second after each write.


### Caveats

In both cases, it was necessary to modify the response header like:
`response.headers['Last-Modified'] = Time.now.httpdate`

This is from a bug pointed out [here](https://github.com/rack/rack/issues/1619#issuecomment-848460528)

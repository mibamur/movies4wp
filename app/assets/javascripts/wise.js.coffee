$(document).ready ->
    # DOM element with id = "content" will be replaced after data load.
    window.wiselinks = new Wiselinks($('#contentm'))

    $(document).off('page:loading').on(
        'page:loading'
        (event, $target, render, url) ->
            console.log("Loading: #{url} to #{$target.selector} within '#{render}'")
            # code to start loading animation
    )

    $(document).off('page:redirected').on(
        'page:redirected'
        (event, $target, render, url) ->
            console.log("Redirected to: #{url}")
            # code to start loading animation
    )

    $(document).off('page:always').on(
        'page:always'
        (event, xhr, settings) ->
            console.log("Wiselinks page loading completed")
            # code to stop loading animation
    )

    $(document).off('page:done').on(
        'page:done'
        (event, $target, status, url, data) ->
            console.log("Wiselinks status: '#{status}'")
    )

    $(document).off('page:fail').on(
        'page:fail'
        (event, $target, status, url, error, code) ->
            console.log("Wiselinks status: '#{status}'")
            # code to show error message
    )

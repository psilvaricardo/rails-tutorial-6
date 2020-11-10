class ApplicationController < ActionController::Base

    # this is an action and live inside the controller
    def hello
        render html: "hello world!!"
    end
end

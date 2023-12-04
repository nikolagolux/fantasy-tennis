class BlogController < ApplicationController
    def home
        @ime="Nikola Tesla"
        @x=2+5
        @clanak=Post.first
    end

    def post
    end

    def contact
    end
end
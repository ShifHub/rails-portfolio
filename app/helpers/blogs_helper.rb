module BlogsHelper

    def blog_debut(num)
        blog = @blogs[num]
        if blog
            first_sentence(blog) + '..'
        else
            'Coming soon..'
        end
    end

    def blog_title(num)
        blog = @blogs[num]
        if blog
            blog.title
        else
            'New Posts'
        end
    end

    def blog_date(num)
        blog = @blogs[num]
        if blog
            blog.created_at.strftime('%m/%d/%Y')
        else
            '--/--/--'
        end
    end

    private
    ##helpers
    def first_sentence(blog)
        sentences = blog.body.split('.')
        sentences[0] + '.'
    end
end

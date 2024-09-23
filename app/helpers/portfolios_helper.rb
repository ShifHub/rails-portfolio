module PortfoliosHelper

    def image_generator(height:, width:)
        "http://placehold.it/#{height}x#{width}"
    end

    def portfolio_img img, type
        if img
            img
        elsif type == 'thumb'
            image_generator(height: 420, width: 300)
        else
            image_generator(height: 600, width: 400)
        end
    end

    def linkify_subtitle(subtitle)
        sanitize(auto_link(subtitle, :all)).html_safe
    end
end

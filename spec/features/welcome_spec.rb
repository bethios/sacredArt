require 'rails_helper'

RSpec.feature "Welcome", :type => :feature do

  describe "visit welcome page" do
    context "Goes to welcome page" do
      it "Has jumbotron" do
        visit '/'
        expect(page).to have_css "h1", text: "Handmade. Local. Independent."
        expect(page).to have_css ".jumbotron"
      end
      it "Has welcome message" do
        page.has_css?('.who-we-are h2', text: 'Welcome.')
        page.has_css?('.who-we-are p', text: 'Sacred Art was founded in 2006 with the motto “Art Is Not A Luxury.”')
      end
      it "has a navbar" do
        page.has_css?('nav img', class: '.logo')
        page.has_css?('nav li', text: 'ABOUT')
        page.has_css?('nav li', text: 'ARTISTS')
        page.has_css?('nav li', text: 'SHOP')
        page.has_css?('nav li', text: 'NEW')
        page.has_css?('nav li', text: 'FAQ')
        page.has_css?('nav li', text: 'SUBMISSIONS')
        page.has_css?('nav li', text: 'CONTACT')
        page.has_css?('nav #ion-navicon-round', visible: :hidden)
      end
      it "has a footer" do
        page.has_css?('.footer row .footer-col', text: 'ADDRESS:')
        page.has_css?('.footer row .footer-col', text: 'HOURS')
        page.has_css?('.footer row .footer-col', text: 'GET OUR NEWSLETTER')
        page.has_css?('.footer row .footer-col #mc_embed_signup', text: 'Email Address' )
        page.has_css?('.footer row .footer-col #mc_embed_signup', text: 'First Name' )
        page.has_css?('.footer row .footer-col #mc_embed_signup', text: 'Last Name' )
        page.has_css?('.footer row .footer-col #mc_embed_signup btn', text: 'Subscribe' )
      end
    end
  end

end
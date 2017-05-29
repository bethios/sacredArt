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

  describe "visit about page" do
    context "goes to about page" do
      it "shows images" do
        visit '/about'
        page.has_css?('row .side-images', visible: :show)
      end
      it "has about text" do
        visit '/about'
        page.has_css?('row .col-sm-9 .text-container h1', text: 'OUR VISION')
      end
    end
  end

  describe "visit FAQ page" do
    context "goes to FAQ page and accesses answers" do
      it "shows images" do
        visit '/faq'
        page.has_css?('row .side-images', visible: :show)
      end
      it "has questions visible" do
        visit '/faq'
        expect(page).to have_content('What is your return policy?')
      end
      it "has answers hidden" do
        page.has_css?('#faq1', visible: :hidden)
      end
      it "has answers visible on click" do
        visit '/faq'
        click_on('What is your return policy?')
        page.has_css?('#faq1', visible: :show)

      end
    end
  end

  describe "visit CONTACT page" do
    context "goes to Contact page and shows info" do
      it "shows address" do
        visit '/contact'
        page.has_css?('row .col-sm-6 .contact', text: "VISIT")
      end
      it "shows map in iframe" do
        visit '/contact'
        page.has_css?('row .col-sm-6 iframe', visible: :show)
      end
      it "shows email address" do
        visit '/contact'
        page.has_css?('row .col-sm-6 div', text: "GENERAL INQUIRIES:")
      end
      it "shows social media icons" do
        visit '/contact'
        page.has_css?('row .col-sm-6 div', class: 'social ion-social-twitter')
        page.has_css?('row .col-sm-6 div', class: 'social ion-social-facebook')
        page.has_css?('row .col-sm-6 div', class: 'social ion-social-instagram')
      end
      it "shows store hours" do
        visit '/contact'
        page.has_css?('row .col-sm-6 div', text: "HOURS")
      end
      it "has newsletter template" do
        visit '/contact'
        page.has_css?('row .col-sm-6 div', text: "GET OUR NEWSLETTER" )
      end
    end
  end

  describe "visit SUBMISSIONS page" do
    context "goes to submissions page and shows info and pictures" do
      it "shows images" do
        visit '/submissions'
        page.has_css?('row .side-images', visible: :show)
      end
      it "has submission text" do
        visit '/submissions'
        page.has_css?('row .col-sm-9 .text-container h1', text: 'ARTIST SUBMISSION GUIDELINES')
      end
    end
  end

  describe "visit NEW page" do
    context "goes to new page and shows latest instagram" do
      it "shows image and comment" do
        visit '/new'
        page.has_css?('.instagram-image')
        page.has_css?('.instagram-comment')
      end
    end
  end

  describe "visit CATEGORIES page" do
    context "goes to categories page and shows tiled categories" do
      it "shows images" do
        visit '/categories'
        page.has_css?('.categoryImage')
      end
      it "shows category label" do
        visit '/categories'
        page.has_css?('.categoryLabel', text:"JEWELRY")
      end
    end
  end

end

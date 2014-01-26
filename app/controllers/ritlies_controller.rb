class RitliesController < ApplicationController

  def index
  end

  def create
    r = Ritly.new

  	link = params[:ritly][:link]
  	link.slice!("http://") if link.include?("http://")
    link.slice!("https://") if link.include?("https://")
  	full_url = ["http://", link].join
  	r.link = full_url

    generate_str = SecureRandom.urlsafe_base64(10)
    r.random_string = generate_str
    r.visits = 0

  	r.save

  	redirect_to action: :show, random_str: generate_str
  end

  def show
  	@ritly = Ritly.where(random_string: params[:random_str]).first
    @ritlies = Ritly.all.limit(5)
  end

  def redirect
  	ritly = Ritly.where(random_string: params[:random_str]).first
  	ritly.visits += 1
  	ritly.save

  	redirect_to ritly.link
  end

  def all
  	@links = Ritly.all
  	@ritlies = Ritly.all.limit(5)
  end

end

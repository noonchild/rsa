class OptionController < ApplicationController
  
  def quit_job
    @message = "Feel like picking a fight with the bouncer? You would probably get arrested and lose your job. "
    render :text => @message
  end
  def sell_soul_ny
    @message = "Don't do this unless you have to. You are literally selling your soul for cash."
    render :text => @message
  end
  def sell_soul_nash
    @message = "Down here they just call it making a deal."
    render :text => @message
  end
  def sell_soul_la
    @message = "Don't do this unless you have to. You are barely worth the price of two burgers."
    render :text => @message
  end
  def buy_love
    @message = "Can you really afford this? $41 for one point for you to use as you see fit."
    render :text => @message
  end
  def buy_red_cake
    @message = "The mother of all impulse buys. 2 points to put anywhere you want - for $69."
    render :text => @message
  end
  def buy_cosmic_pizza
    @message = "For $33, you get one point to use however you want - and a slice of pizza."
    render :text => @message
  end
  
  def sell_charity_bar
    @message = "You can sell your charity bars here for a small profit."
    render :text => @message
  end
  
  def organic_bar
    @message = "High on protein for rockstars on the go - but you have to eat it here."
    render :text => @message
  end
  
  def capture_the_flag
    @message = "The zookeepers like to play capture the flag during lunch break. Do you feel like stepping in for a round?"
    render :text => @message
  end
  
  def music_row_coffee
    @message = "You might want to have lunch and grab some coffee around here. There are a lot of people here you could connect with."
    render :text => @message
  end
  
  def country_candy_bars
    @message = "Do you feel like helping out a good cause? If you would like to buy a box of candy bars for $16, you can resell them for a profit."
    render :text => @message
  end
  
  def clean_toilets
    @message = "It is nasty work, but you can make some money cleaning bathrooms around here. You have to buy the uniform, though."
    render :text => @message
  end
  
  def paint_cages
    @message = "You might be able to convince the Nashville Zoo to pay you $10 an hour to repaint the monkey cages. Does that sound like fun?"
    render :text => @message
  end
  
  def bank
    @message = "You can open a hassle-free savings account with an initial deposit of $100. Are you interested?"
    render :text => @message
  end
  
  def bank_job
    @message = "Chazz Manhattan is looking for a teller. The pay is pretty good but you'll have to wear a suit. You will also need to have a certain amount of charisma to be successful. Are you in?"
    render :text => @message
  end
  
  def largo_busk
    @message = "You probably could make some decent money performing your ballads for the dinner patrons. How about a free sandwich?"
    render :text => @message
  end

  def open_mic
    @message = "The Hut in New York City has an amazing open mic tradition. For 40 years they have hosted the likes of Jeff Buckley and Ryan Adams in an intimate, if slightly seedy, Manhattan location.
    Would you like to perform?"
    render :text => @message
  end

  def livingroom_job
    @message = "The Hut needs a new barista. It's not great money, but you have flexible hours and they will let you play your guitar for the customers. Can you cover the day shifts?"
    render :text => @message
  end
  
  def roxy_gig
    @message = "You have been waiting for this day. The Roxy wants to know if you can put together a decent crowd on short notice. Can you do it?"
    render :text => @message
  end
  
  def roxy_job
    @message = "You think you can handle showing up here a couple of days per week? We need to keep a rising star like you in front of the cameras."
    render :text => @message
  end
  
  def nashville_openmic
    @message = "Some of the best artists in modern music have played the Bluebird Cafe on their way to the top. Would you like to follow in their footsteps?"
    render :text => @message
  end

  def car_loan
    @message = "Chazz Manhattan is willing to finance your car for $1000 down. You can trade in your beater car for a minivan you can go on tour with. Do you want the loan?"
    render :text => @message
  end
  
  def disney_box
    @message = "How do you feel about temporarily setting up a shantie? Disney Hall gives some of the best rain protection around."
    render :text => @message
  end
  
  def classical_lesson
    @message = "The greatest thing about Disney Hall is the buffet - plus they give great theory workshops. Do you want to give it a try for $40?"
    render :text => @message
  end
  
  def troubador_gig
    @message = "After this performance, you know your world will change. This could be your best gig yet. You will need a small army of fans for them to take you seriously."
    render :text => @message
  end
  
  def largo_gig
    @message = "Largo on a Friday Night. Life is good. You are the toast of Hollywood. Will your band be ready by this Friday?"
    render :text => @message
  end
  
  def livingroom_car
    @message = "You can buy a beater car cheap, all cash up front for $400. Do you want it?"
    render :text => @message
  end
  
  def jazz_lesson
    @message = "The blue Note offers the best Jazz lessons in town. They cost $55 a session. Are you interested?"
    render :text => @message
  end
  
  def roxy_waitress
    r = rand(8)
    if r == 4 then
      @message = "Someone at the bar is coming on to you. Are you ready to make some sparks?"
    else
      @thisguy=Actor.find_by_user_id(current_user)
      @message = "The bartender likes the way you look. '#{@thisguy.name} will you be around after my shift?'"
    end
    render :text => @message
  end
  
  def jazz_band
    @message = "There's an opening tonight for the house piano player. It pays $100. You need a skill level of 20. Do you have the chops?"
    render :text => @message
  end
  
  def beg
    @message = "You can probably make some good cash selling friendship bracelets. All you have to do is pout a little. Are you down?"
    render :text => @message
  end
  
  def frisbee
    @message = "It's a gorgeous day. Some friends are playing ultimate frisbee in the park. Think you can handle it?"
    render :text => @message
  end
  
  def central_park_busk
    @message = "You are thinking about setting up somewhere and giving a little impromptu concert. You might even sell some cds. What do you think?"
    render :text => @message
  end
  
  def hollow_body
    @message = "One of the bartenders is selling his '77 Gibson hollow-body for $1000. Do you want to buy it?"
    render :text => @message
  end
  
  def buy_espresso
    @message = "Just a little pick-me-up for $4. You want one, don't you?"
    render :text => @message
  end
  
  def buy_burger
    @message = "2 veggie burgers for $22. You want cheese on that?"
    render :text => @message
  end
  def buy_burger_la
    @message = "2 beef sliders for $25 - it ain't cheap but man, are they tasty!"
    render :text => @message
  end
  def buy_burger_nashville
    @message = "2 grilled chicken burgers for $15. You won't find a better deal anywhere."
    render :text => @message
  end
  
  def visit_vineyard
    @message = "Get onto a train, and go up the coast to Martha's Vineyard. The weather is supposed to be beautiful this weekend. It might cost you a few hundred dollars, but a natural tan is hard to beat. "
    render :text => @message
  end
end


class State < ActiveRecord::Base
  has_one :location
  has_one :user
  has_one :hood
  has_one :option
  
  attr_reader :return_message
  PRICE_OF_UNIFORM = 22
  BURGER_LIMIT = 5
  
  def isactive?
    (self.current_enthusiasm > 0)
  end
  
  def lose_enthuse!(factor = 1)
    self.current_enthusiasm -= (1 * factor)
    self.name = "You are visiting"
  end
  
  def change_location!(location)
    self.location_id = location
  end
  
  def reset_enthuse!
    self.current_enthusiasm = 100
  end
  
  def change_hood!(hood)
    self.hood_id = hood
    self.location_id = 1
    self.name = "Please choose somewhere to visit:"
  end
  
  def set_option!(id)
    self.option_id = id
  end
  
  def choose_option?
    s=""
    @option = Option.find_by_id(self.option_id)
    @thisguy=Actor.find_by_user_id(self.user_id)
    if @thisguy.cash < @option.cash_price then
      s= s << "You need at least $#{@option.cash_price}. "
    end
    if self.current_enthusiasm < @option.enthuse_price then
      s= s << "You need at least #{@option.enthuse_price} enthusiasm points. "
    end
    if (@thisguy.has_uniform < @option.uniform_needed) and (@option.give_uniform < 1) then
      s= s << "You need a uniform for this and you can't get one here. "
    end
    if (@thisguy.has_uniform < @option.uniform_needed) and (@option.give_uniform == 1) and (@thisguy.cash < PRICE_OF_UNIFORM) then
      s= s << "You need a uniform for this and you can't afford one - you are short $#{PRICE_OF_UNIFORM - @thisguy.cash}. "
    end
    if (@thisguy.has_job >= @option.give_job) and (@option.give_job > 0) then
      s= s << "You already have a job. "
    end
    if @thisguy.charisma < @option.charisma_needed then
      s= s << "You need at least #{@option.charisma_needed} charisma points. "
    end
    if @thisguy.skill < @option.skill_needed then
      s= s << "You need at least #{@option.skill_needed} skill points. "
    end
    if @thisguy.savvy < @option.savvy_needed then
      s= s << "You need at least #{@option.savvy_needed} savvy points. "
    end
    if @thisguy.looks < @option.looks_needed then
      s= s << "You need at least #{@option.looks_needed} looks points. "
    end
    if @option.take_point > 0 and ( @thisguy.savvy < 1 and @thisguy.charisma < 1 and @thisguy.skill < 1 and @thisguy.looks < 1 )
      s= s << "You have no points left to sell, you masochist. "
    end
    if @thisguy.fans < @option.fans_needed then
      s= s << "You need at least #{@option.fans_needed} fans. "
    end
    if @option.give_charity_bar > 0 and @thisguy.charity_bar > 1
      s= s << "You already have #{@thisguy.charity_bar==1 ? "1 box" : "2 boxes"} of candy bars. "
    end
    if @option.charity_bar_price > 0 and @thisguy.charity_bar < 1
      s= s << "You can't sell candy bars that you don't have. "
    end
    #BURGER CHECK
    if @option.give_burger == 2
      if (@thisguy.burgers + 2) > BURGER_LIMIT
        s= s << "You can't carry any more burgers. "
      end
    end
    
    if @thisguy.has_car < @option.car_needed then
      if @thisguy.has_car > 0 then
        nicer = " nicer"
      end
      s= s << "You need a #{nicer} car. "
    end
    if (s.strip) == "" then
      true
    else
      r = rand(5)
      if r==1 then
        @return_message="Sorry #{@thisguy.name}, you can't #{@option.name.upcase} Apparently you are not good enough right now. #{s}"
      elsif r==2
        @return_message="Sorry #{@thisguy.name}, you can't #{@option.name.upcase} It's not working out for you. #{s}"
      elsif r==3
        @return_message="Sorry #{@thisguy.name}, you can't #{@option.name.upcase} Maybe next time. #{s}"
      elsif r==4
        @return_message="Sorry #{@thisguy.name}, you can't #{@option.name.upcase} What a shame. #{s}"
      else
        @return_message="Sorry #{@thisguy.name}, you can't #{@option.name.upcase} You are coming up a little short. #{s}"
      end
      false
    end
  end
  def process_option!
    @option = Option.find_by_id(self.option_id)
    @thisguy=Actor.find_by_user_id(self.user_id)
    @thisguy.cash -= @option.cash_price.to_i
    self.current_enthusiasm -= @option.enthuse_price.to_i
    @thisguy.cash+=@option.cash_payout
    self.current_enthusiasm = (self.current_enthusiasm + @option.enthuse_payout)>100 ? 100 : self.current_enthusiasm + @option.enthuse_payout
    @thisguy.charisma = @thisguy.charisma + (@thisguy.charisma*(@option.charisma_quotient*0.001))
    @thisguy.skill = @thisguy.skill + (@thisguy.skill*(@option.skill_quotient*0.001))
    @thisguy.savvy = @thisguy.savvy + (@thisguy.savvy*(@option.savvy_quotient*0.001))
    @thisguy.looks = @thisguy.looks + (@thisguy.looks*(@option.looks_quotient*0.001))
    if @option.cash_price > 0 then
      s="You spent $#{@option.cash_price}. "
    else
      s=""
    end
    if @option.cash_payout > 0 then
      s= s << "You made $#{@option.cash_payout}. "
    end
    if @option.enthuse_payout > 0 then
      s= s << "You feel better. "
    end
    if @option.charisma_quotient > 0 then
      s= s << "Your mojo is off the hook. "
    end
    if @option.skill_quotient > 0 then
      s= s << "Your skill went up a bit. "
    end
    if @option.savvy_quotient > 0 then
      s= s << "Your savvy has improved. "
    end
    if @option.looks_quotient > 0 then
      s= s << "You just got prettier. "
    end
    if @option.give_car > 0 then
      @thisguy.has_car = @option.give_car
      s= s << "You got wheels. "
    end
    if @option.give_pet > 0 then
      @thisguy.has_pet = @option.give_pet
      s= s << "Your new pet loves you. "
    end
    if (@option.give_uniform == 1) and (@thisguy.has_uniform < 1) then
      @thisguy.cash -= PRICE_OF_UNIFORM
      @thisguy.has_uniform = 1
      s= s << "You paid $#{PRICE_OF_UNIFORM} for your uniform. "
    end
    if @option.give_box > 0 then
      @thisguy.has_box = @option.give_box
      s= s << "You now have somewhere to live. "
    end
    if @option.give_job > 0 then
      @thisguy.has_job = @option.give_job
      @thisguy.works_at = @option.location_id
      @thisguy.last_pay_date = Time.now
      s= s << "You just got hired. "
    end
    if @option.take_point > 0
      whichever = rand(4)
      if whichever == 1 
        @thisguy.skill -= 1
        name = "skill"
      elsif whichever == 2
        @thisguy.charisma -= 1
        name = "charisma"
      elsif whichever == 3
        @thisguy.savvy -= 1
        name = "savvy"
      else
        @thisguy.looks -= 1
        name = "looks"
      end
      s= s << "You lost a point of #{name}. "
    end
    if @option.give_point > 0
      if @option.give_point == 1 
        quant = "1 point"
      else
        quant = "#{@option.give_point} points"
      end
      @thisguy.points_to_give += @option.give_point
      s= s << "You gained #{quant} to use however you wish. Just click on the the PDA icon by your burgers."
    end
    if @option.take_job > 0
      s= s << ((@thisguy.has_job>0) ? "You lost your job. " : "You got arrested for no reason. ")
      @thisguy.has_job = 0
    end
    if @option.give_guitar > 0 then
      @thisguy.has_guitar = @option.give_guitar
      s= s << "You bought the guitar. "
    end
    if @option.charity_bar_price > 0 
      @thisguy.charity_bar -= 1
      s= s << "You sold a box of candy bars. "
    end
    if @option.give_acct > 0 then
      @thisguy.has_acct = @option.give_acct
      s= s << "You will be earning #{@option.give_acct * $SAVINGS_QUOTIENT}% interest. "
    end
    if @option.give_burger > 0 then
      if @option.give_burger == 1 then
        burger_count = " 1 burger "
      else
        burger_count = " #{@option.give_burger} burgers "
      end
      if (@option.give_burger == 1) and (@thisguy.burgers == BURGER_LIMIT)
        s= s << "You took a burger with you but it fell out of your pocket. "
      else
        @thisguy.burgers += @option.give_burger
        s= s << "You wrapped up#{burger_count} to put in your pocket. "
      end
    end
    if @option.random_money > 0 then
      r = rand(100)
      if @option.random_money > (r - (@option.random_money/2)) then
        x = (@option.random_money * (r/1.6) + @option.random_money + (r * @option.random_money))
        @thisguy.cash += x
        s= s << "You got lucky for an extra $#{(x).to_i}. "
      end
    end
    if @option.random_pet > 0 then
      r = rand(100)
      if (@option.random_pet >= r) then
        @thisguy.has_pet += 1
        s= s << "You seduced a stray puppie with your charm. "
      end
    end
    #straight given fan
    if @option.give_fan > 0
      netgain = @option.give_fan 
        if netgain > 1 then
          s_suffix = "s"
        else
          s_suffix = ""
        end
        @thisguy.fans += netgain
        s= s << "#{netgain} new fan#{s_suffix} came up to you after the show. "
    end
    #random fan
    if @option.random_fan > 0
      netgain = 0
      r = rand(90)
      if @option.random_fan >= r then
        random_factor = 0
        for i in r..@option.random_fan
          random_factor = (random_factor + i)
        end
        netgain = random_factor
      end
      if netgain > 0 then
        if netgain > 1 then
          s_suffix = "s"
        else
          s_suffix = ""
        end
        @thisguy.fans += netgain
        s= s << "#{netgain} new fan#{s_suffix} came to your website. "
      end
    end if
    if @option.give_charity_bar > 0
      @thisguy.charity_bar += 1
    end
    @return_message = s
    @thisguy.save
    self.save
  end
   
  def return_message
    @return_message
  end
  
  def return_message=(val)
    @return_message = val
  end
  def take_shelter!
    x = self.current_enthusiasm += 50
    if x > 100
      x = 100
    end
    self.current_enthusiasm = x
  end
  
end

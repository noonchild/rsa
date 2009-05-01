class Actor < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 26, :message => "The name you have chosen is too long. You are allowed up to 26 characters."
  
  #belongs_to :user
  REGULAR_LEVEL = 1.004
  RAISED_LEVEL1 = 1.014
  $SAVINGS_QUOTIENT = 2
  WAGES_QUOTIENT = 9
  
  attr_reader :hasjob
  
  def exercise!
    self.looks *= REGULAR_LEVEL
  end
  def learn!
    self.skill *= REGULAR_LEVEL
  end
  def lose_burger!
    self.burgers -= 1
  end
  def flirt!
    self.charisma *= REGULAR_LEVEL
  end
  def pavement!
    self.savvy *= RAISED_LEVEL1
  end
  def add_looks!
    self.looks += 1
    lose_point
  end
  def add_charisma!
    self.charisma += 1
    lose_point
  end
  def add_skill!
    self.skill += 1
    lose_point
  end
  def add_savvy!
    self.savvy += 1
    lose_point
  end
  
  def lose_point
    self.points_to_give -= 1
  end
  
  def haspoints?
    (self.points_to_give > 0) 
  end
  
  def hasjob?
    (self.works_at>0) 
  end
  
  def has_state?
    @state = State.find_by_user_id(current_user.id)
    defined? @state
  end
  
  def name_of_job
    Location.find(self.works_at).name
  end
  
  def gorandom!
    while self.points_to_give > 5
      i = rand(90)
      i %= 5
      if i == 1 then
        self.add_skill!
      end
      if i == 2 then
        self.add_charisma!
      end
      if i == 3 then
        self.add_looks!
      end
      if i == 4 then
        self.add_savvy!
      end
    end
    #self.save
  end
  def calc_savings!
    #call this first
    if self.has_acct > 0 and self.cash > 0
      cash_on_hand = self.cash
      percentage = ($SAVINGS_QUOTIENT*self.has_acct)
      added_cash = ((cash_on_hand*percentage).to_i)/100
      self.cash += added_cash
      "You made $#{added_cash} in interest on your account. <br>"
    else
      ""
    end
  end
  def clear_log!
    self.log = "Ok. "
  end
  def calc_wages!
    if self.has_job > 0
      cash_wages = self.has_job * WAGES_QUOTIENT
      self.cash += cash_wages
      self.consecutive_work_hours += 1
      self.last_pay_date = Time.now
      "You made $#{cash_wages} working at #{Location.find(self.works_at).name}, hour ##{self.consecutive_work_hours}. <br>"
    else
      ""
    end
  end
end
#end class
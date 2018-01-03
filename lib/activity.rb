class Activity

  attr_reader :name
  attr_accessor :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, amount_paid)
    participants[name] = amount_paid
  end

  def total_cost
    amounts_paid = participants.values
    amounts_paid.reduce(:+)
  end

  def split_cost
    total_cost/participants.length.to_f
  end

  def amount_owed(name)
    owed = split_cost - participants[name]
      if owed > 0
        "#{name} owes #{owed} dollars"
      elsif owed < 0
        "#{name} is owed #{owed.abs} dollars"
      else
        "#{name} is all squared-up"
      end
  end

end

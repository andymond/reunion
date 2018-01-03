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
    split_cost - participants[name]
  end

end

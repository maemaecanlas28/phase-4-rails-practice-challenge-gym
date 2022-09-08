class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_amount

  def total_amount
    puts self.object.memberships.first.charge
    sum = 0
    # refers to the current object/model
    self.object.memberships.each{ |membership| sum = membership.charge + sum}
    return sum
  end
end

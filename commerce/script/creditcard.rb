
credit_card = ActiveMerchant::Billing::CreditCard.new(
  number:     '4345455252525',
  month:      '12',
  year:       '2111,
  first_name: 'kholofelo',
  last_name:  'Masemola',
  verification_value:  '325' 
)

puts "Is #{credit_card.number} valid?  #{credit_card.valid?}"

puts "\n*************************LOAN CALCULATOR*************************"

loop do
  puts "\nPlease enter the loan amount:"
  amount = ''
  loop do
    amount = gets.chomp.to_f

    if amount.to_s.empty? || amount.to_f <= 0
      puts "\nEnter a valid number, please."
    else
      break
    end
  end

  puts "\nPlease enter the Annual Percentage Rate as a percent:"
  a_p_r = ''
  loop do
    a_p_r = gets.chomp.to_f

    if a_p_r.to_s.empty? || a_p_r.to_f <= 0
      puts "\nEnter a valid number, please."
    else
      break
    end
  end

  puts "\nPlease enter the loan duration in years:"
  duration = ''
  loop do
    duration = gets.chomp.to_f

    if duration.to_s.empty? || duration.to_f <= 0
      puts "\nEnter a valid number, please."
    else
      break
    end
  end

  m_duration = duration * 12
  m_i_r = a_p_r / 1200
  m_payment = amount * (m_i_r / (1 - (1 + m_i_r)**-m_duration))
  t_payment = m_payment * m_duration

  puts "\nYour monthly payment is $#{m_payment.round(2)}."
  puts "Your payments will total $#{t_payment.round(2)}"

  puts "\nDo you have another loan you'd like to calculate? (Y/N)"
  go_again = gets
  break unless go_again.downcase.start_with?('y')

end

puts "\nThank you for using the Loan Calculator!"
puts "Good bye!"

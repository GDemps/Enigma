module Encryptable
  a_key = key[0..1]
  b_key = key[1..2]
  c_key = key[2..3]
  d_key = key[3..4]
  last4 = (date.to_i * date.to_i).to_s[-4..-1]
  a_offset = last4[0]
  b_offset = last4[1]
  c_offset = last4[2]
  d_offset = last4[3]
  shifts = [a = a_key.to_i + a_offset.to_i,
           b = b_key.to_i + b_offset.to_i,
           c = c_key.to_i + c_offset.to_i,
           d = d_key.to_i + d_offset.to_i]
end

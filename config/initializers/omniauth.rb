# To change this template, choose Tools | Templates
# and open the template in the editor.

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '309239202559071', '5b5758f912217ad91ae54049df986915'
#  provider :facebook, '1432016053716750', 'b723c5f8ee8998d92667c0842ffde138'
end
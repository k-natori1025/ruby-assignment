class User < ApplicationRecord
  validates :name, presence: true,
                   length: {maximum: 15, message: '名前は15文字まで'}
                   
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: {with: VALID_EMAIL_REGEX}
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze          
  validates :password, presence: true, 
                       length: {in: 8..32, message: 'パスワードの文字数を8~32文字のみ可能'},
                       format: {with: VALID_PASSWORD_REGEX  ,message: '半角英数を両方含む必要があります'}
                       
  validates :password_confirmation, confirmation: true                     
  
  has_secure_password
end

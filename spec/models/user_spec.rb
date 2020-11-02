require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、本名、誕生日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないとユーザー登録できない' do
        @user.email = 'user_example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角数字のみだとユーザー登録できない' do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字のみだとユーザー登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空だとユーザー登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid. Input full-width katakana characters.")
      end
      it 'nameが空だとユーザー登録できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank", "Name is invalid. Input full-width katakana characters.")
      end
      it 'jp_family_nameが空だとユーザー登録できない' do
        @user.jp_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp family name can't be blank", "Jp family name is invalid. Input full-width characters.")
      end
      it 'jp_nameが空だとユーザー登録できない' do
        @user.jp_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp name can't be blank", "Jp name is invalid. Input full-width characters.")
      end
      it 'birth_dayが空だとユーザー登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'family_nameが全角（カタカナ）以外だとユーザー登録できない' do
        @user.family_name ="name"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width katakana characters.")
      end
      it 'nameが全角（カタカナ）以外だとユーザー登録できない' do
        @user.name = "name"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid. Input full-width katakana characters.")
      end
      it 'jp_family_nameが全角（漢字）以外だとユーザー登録できない' do
        @user.jp_family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Jp family name is invalid. Input full-width characters.")
      end
      it 'jp_nameが全角（漢字）以外だとユーザー登録できない' do
        @user.jp_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp name is invalid. Input full-width characters.")
      end
    end
  end
end

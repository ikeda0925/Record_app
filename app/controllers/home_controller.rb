class HomeController < ApplicationController
  def record
    @player_1 = User.find_by(id: 1)
    @player_2 = User.find_by(id: 2)

    @characters = Character.all
  end

  def select
    @player_1 = User.find_by(id:1)
    @player_2 = User.find_by(id:2)

    @character1 = Character.find_by(name: params[:player_1])
    @character2 = Character.find_by(name: params[:player_2])

    if params[:win]
      @record = Record.new(character_1_id: @character1.id,
                           character_2_id: @character2.id,
                           win_user_id: @player_1.id,
                           lose_user_id: @player_2.id)
    elsif params[:lose]
      @record = Record.new(character_1_id: @character1.id,
                           character_2_id: @character2.id,
                           win_user_id: @player_2.id,
                           lose_user_id: @player_1.id)
    end

    @record.save

    redirect_to("/result")
    flash[:notice] = "対戦結果を保存しました"
  end

  def result
    @players = User.all
    @records = Record.all.order(id: "DESC")
    @characters = Character.all

    @player_1_main = Character.find_by(name: "ジョーカー")
    @player_2_main = Character.find_by(name: "リュカ")

    @player_1_sub = Character.where(name: "パルテナ")
                             .or(Character.where(name: "ピカチュウ"))
                             .order(id: "DESC")
    @player_2_sub = Character.where(name: "キングクルール")
                             .or(Character.where(name: "子どもリンク")
                             .or(Character.where(name: "シーク")))
                             .order(id: "DESC")

    @count = 0
    @win_count_1 = 0
    @win_count_2 = 0

    @records.each do |record|
      if record.win_user_id == 1 then
        @win_count_1 = @win_count_1 + 1
      else
        @win_count_2 = @win_count_2 + 1
      end
      @count = @count + 1
    end

    if @count != 0 then
      @rate_1 = (@win_count_1.to_f / @count ) * 100
      @rate_2 = (@win_count_2.to_f / @count ) * 100

      @rate_1 = @rate_1.floor(1).to_f
      @rate_2 = @rate_2.floor(1).to_f
    else
      @rate_1 = 0
      @rate_2 = 0
    end

  end

  def search_1
    @players = User.all
    character_search = Character.find_by(name: params[:character])
    @characters = Character.all
    @search = Record.where(character_1_id: character_search.id)

    @player_1_main = Character.find_by(name: "ジョーカー")
    @player_2_main = Character.find_by(name: "リュカ")

    @player_1_sub = Character.where(name: "パルテナ")
                             .or(Character.where(name: "ピカチュウ"))
                             .order(id: "DESC")
    @player_2_sub = Character.where(name: "キングクルール")
                             .or(Character.where(name: "子どもリンク")
                             .or(Character.where(name: "シーク")))
                             .order(id: "DESC")

    @count = 0
    @win_count_1 = 0
    @win_count_2 = 0

    @search.each do |record|
      if record.win_user_id == 1 then
        @win_count_1 = @win_count_1 + 1
      else
        @win_count_2 = @win_count_2 + 1
      end
      @count = @count + 1
    end
    if @count != 0 then
      @rate_1 = (@win_count_1.to_f / @count ) * 100
      @rate_2 = (@win_count_2.to_f / @count ) * 100

      @rate_1 = @rate_1.floor(1).to_f
      @rate_2 = @rate_2.floor(1).to_f
    else
      @rate_1 = 0
      @rate_2 = 0
    end

  end

  def search_2
    @players = User.all
    character_search = Character.find_by(name: params[:character])
    @characters = Character.all
    @search = Record.where(character_2_id: character_search.id)

    @player_1_main = Character.find_by(name: "ジョーカー")
    @player_2_main = Character.find_by(name: "リュカ")

    @player_1_sub = Character.where(name: "パルテナ")
                             .or(Character.where(name: "ピカチュウ"))
                             .order(id: "DESC")
    @player_2_sub = Character.where(name: "キングクルール")
                             .or(Character.where(name: "子どもリンク")
                             .or(Character.where(name: "シーク")))
                             .order(id: "DESC")

    @count = 0
    @win_count_1 = 0
    @win_count_2 = 0

    @search.each do |record|
      if record.win_user_id == 1 then
         @win_count_1 = @win_count_1 + 1
      else
         @win_count_2 = @win_count_2 + 1
      end
      @count = @count + 1
    end

    if @count != 0 then
      @rate_1 = (@win_count_1.to_f / @count ) * 100
      @rate_2 = (@win_count_2.to_f / @count ) * 100

      @rate_1 = @rate_1.floor(1).to_f
      @rate_2 = @rate_2.floor(1).to_f
    else
      @rate_1 = 0
      @rate_2 = 0
    end
  end
end

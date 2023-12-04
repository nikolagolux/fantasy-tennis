class GamePoint < ApplicationRecord
  belongs_to :game_gem
  belongs_to :game_set
  belongs_to :match

  before_create :check_player_points_original
  after_create :check_status


  def check_player_points_original
    
    # Definišemo:
    # - koji je meč u toku
    # - koji je set u toku
    # - koji je gem u toku

    current_gem = self.game_gem
    current_set = current_gem.game_set
    current_match = current_gem.game_set.match
    
    # Definišemo:
    # - ukupan broj setova na meču
    # - ukupan broj gemova u trenutnom setu

    set_count = current_match.game_sets.count
    gem_count = current_match.game_sets.last.game_gems.count

    # Definišemo:
    # - broj poena prvog igrača
    # - broj poena drugog igrača

    first_player_points = current_gem.first_player_points
    second_player_points = current_gem.second_player_points

    # Štampamo status u Ruby on Rails konzoli

    print_status(
      match_id = current_match.id, 
      ukupno_setova = set_count, 
      ukupno_gemova_na_setu = gem_count, 
      current_gem_id = current_gem.id, 
      first_player_points_in_this_gem = current_gem.first_player_points, 
      second_player_points_in_this_gem = current_gem.second_player_points 
    )

    # Proveravamo da li je Tie Break

    if current_set.first_player_gems == 6 && current_set.second_player_gems == 6

      print_tie_break

      # Proveravamo da li je 1. igrac dobio poen

      if self.is_first_player_win 

        case current_gem.current_first_player_points
        when 0, "0", nil
          current_gem.update(first_player_points: 1)
          self.current_first_player_points = 1
          self.current_second_player_points = current_gem.second_player_points
        when 1, "1"
          current_gem.update(first_player_points: 2)
          self.current_first_player_points = 2
          self.current_second_player_points = current_gem.second_player_points
        when 2, "2"
          current_gem.update(first_player_points: 3)
          self.current_first_player_points = 3
          self.current_second_player_points = current_gem.second_player_points
        when 3, "3"
          current_gem.update(first_player_points: 4)
          self.current_first_player_points = 4
          self.current_second_player_points = current_gem.second_player_points
        when 4, "4"
          current_gem.update(first_player_points: 5)
          self.current_first_player_points = 5
          self.current_second_player_points = current_gem.second_player_points
        when 5, "5"
          current_gem.update(first_player_points: 6)
          self.current_first_player_points = 6
          self.current_second_player_points = current_gem.second_player_points
        when 6, "6"
          current_gem.update(first_player_points: 7)
          self.current_first_player_points = 7
          self.current_second_player_points = current_gem.second_player_points

          # Proveravamo da li drugi igrač ima 0, 1, 2, 3, 4 ili 5 poena
          if current_gem.second_player_points.to_i < 6
            first_player_gets_gem
          end
        
        # when  8, 9... points etc.
        else
          check_status
          
          current_gem.update(first_player_points: current_gem.first_player_points.to_i + 1)
          self.current_first_player_points = current_gem.first_player_points
          self.current_second_player_points = current_gem.second_player_points
          
          check_status

          if current_gem.current_first_player_points.to_i == current_gem.current_second_player_points.to_i + 2
            first_player_gets_gem
          end

        end
      
      # Proveravamo da li je 2. igrac dobio poen
      else

        case current_gem.current_second_player_points
        when 0, "0", nil
          current_gem.update(second_player_points: 1)
          self.current_second_player_points = 1
          self.current_first_player_points = current_gem.first_player_points
        when 1, "1"
          current_gem.update(second_player_points: 2)
          self.current_second_player_points = 2
          self.current_first_player_points = current_gem.first_player_points
        when 2, "2"
          current_gem.update(second_player_points: 3)
          self.current_second_player_points = 3
          self.current_first_player_points = current_gem.first_player_points
        when 3, "3"
          current_gem.update(second_player_points: 4)
          self.current_second_player_points = 4
          self.current_first_player_points = current_gem.first_player_points
        when 4, "4"
          current_gem.update(second_player_points: 5)
          self.current_second_player_points = 5
          self.current_first_player_points = current_gem.first_player_points
        when 5, "5"
          current_gem.update(second_player_points: 6)
          self.current_second_player_points = 6
          self.current_first_player_points = current_gem.first_player_points
        when 6, "6"
          current_gem.update(second_player_points: 7)
          self.current_second_player_points = 7
          self.current_first_player_points = current_gem.first_player_points

          # Proveravamo da li prvi igrač ima 0, 1, 2, 3, 4, 5 poena
          if current_gem.current_first_player_points.to_i < 6
            second_player_gets_gem
          end
        
        # when 8, 9... points etc.
        else
          check_status
          
          current_gem.update(second_player_points: current_gem.second_player_points.to_i + 1)
          self.current_second_player_points = current_gem.second_player_points
          self.current_first_player_points = current_gem.first_player_points

          check_status

          if current_gem.current_second_player_points.to_i == current_gem.current_first_player_points.to_i + 2
            second_player_gets_gem
          end
          
        end
        
      end

    # Ako smo ustanovili da nije Tie Break, onda radimo sledeće
    
    else
      
      # prvi igrac je dobio poen
      if self.is_first_player_win # proveravamo da li je prvi igrac dobio poen
        case current_gem.current_first_player_points
        when "0", nil
          current_gem.update(first_player_points: "15")
          self.current_first_player_points = 15
          self.current_second_player_points = current_gem.second_player_points
        when "15"
          current_gem.update(first_player_points: "30")
          self.current_first_player_points = 30
          self.current_second_player_points = current_gem.second_player_points
        when "30"
          current_gem.update(first_player_points: "40")
          self.current_first_player_points = 40
          self.current_second_player_points = current_gem.second_player_points
        when "40"
          case current_gem.second_player_points
          when "40"
            current_gem.update(first_player_points: "A")
            self.current_first_player_points = "A"
            self.current_second_player_points = current_gem.second_player_points
          when "0", nil, "15", "30"
            self.current_first_player_points = "W"
            self.current_second_player_points = current_gem.second_player_points
            first_player_gets_gem
          when "A"
            current_gem.update(second_player_points: "40")
            self.current_first_player_points = "40"
            self.current_second_player_points = "40"
          end
        when "A"
          self.current_first_player_points = "W"
          self.current_second_player_points = current_gem.second_player_points
          first_player_gets_gem
        end
        
      # drugi igrac je dobio poen
      else
        case current_gem.current_second_player_points 
        when "0", nil
          current_gem.update(second_player_points: "15")
          self.current_second_player_points = 15
          self.current_first_player_points = current_gem.first_player_points
        when "15"
          current_gem.update(second_player_points: "30")
          self.current_second_player_points = 30
          self.current_first_player_points = current_gem.first_player_points
        when "30"
          current_gem.update(second_player_points: "40")
          self.current_second_player_points = 40
          self.current_first_player_points = current_gem.first_player_points
        when "40"
          case current_gem.first_player_points
          when "40"
            current_gem.update(second_player_points: "A")
            self.current_second_player_points = "A"
            self.current_first_player_points = current_gem.first_player_points
          when "0", nil, "15", "30"
            self.current_first_player_points = current_gem.first_player_points
            self.current_second_player_points = "W"
            second_player_gets_gem
          when "A"
            current_gem.update(first_player_points: "40")
            self.current_second_player_points = "40"
            self.current_first_player_points = "40"
          end
        when "A"
          self.current_first_player_points = current_gem.first_player_points
          self.current_second_player_points = "W"
          second_player_gets_gem
        end
      end
    end
  end

  def check_status
    match = Match.last # Potrebno da se promeni u buducnosti
    current_set = match.game_sets.last
    current_gem = match.game_sets.last.game_gems.last
    current_gem_id = current_gem.id

    set_count = match.game_sets.count
    gem_count = match.game_sets.last.game_gems.count
    first_player_points = match.game_sets.last.game_gems.last.first_player_points
    second_player_points = match.game_sets.last.game_gems.last.second_player_points
    
    Rails.logger.info(".")
    Rails.logger.info("------------------------------------------------------------")
    Rails.logger.info("Sada smo u check_status metodi")
    Rails.logger.info("match = #{match.id}")
    Rails.logger.info("set = #{set_count}.")
    Rails.logger.info("gem_in_set = #{gem_count}.")
    Rails.logger.info("current_gem_id = #{current_gem_id}.")
    Rails.logger.info("first_player_points = #{first_player_points}.")
    Rails.logger.info("second_player_points = #{second_player_points}.")
    Rails.logger.info("------------------------------------------------------------")
    Rails.logger.info(".")
  end

  def print_status(match_id, ukupno_setova, ukupno_gemova_na_setu, current_gem_id, first_player_points_in_this_gem, second_player_points_in_this_gem )
    Rails.logger.info(".")
    Rails.logger.info("------------------------------------------------------------")
    Rails.logger.info("Sada smo na početku check_player_points_original metode")
    Rails.logger.info("match = #{match_id}")
    Rails.logger.info("set = #{ukupno_setova}.")
    Rails.logger.info("gem_in_set = #{ukupno_gemova_na_setu}.")
    Rails.logger.info("current_gem_id = #{current_gem_id}.")
    Rails.logger.info("first_player_points = #{first_player_points_in_this_gem}.")
    Rails.logger.info("second_player_points = #{second_player_points_in_this_gem}.")
    Rails.logger.info("------------------------------------------------------------")
    Rails.logger.info(".")
  end

  def first_player_gets_gem
    # match = Match.last # Potrebno da se promeni u buducnosti
    # current_set = match.game_sets.last
    # current_gem = match.game_sets.last.game_gems.last

    current_gem = self.game_gem
    current_set = current_gem.game_set
    current_match = current_set.match

    # Update rezultata gemova u okviru seta
    current_gem.game_set.update(first_player_gems: current_gem.game_set.first_player_gems.to_i + 1)

    if (current_set.first_player_gems.to_i == 6 && current_set.second_player_gems.to_i < 5) || (current_set.first_player_gems.to_i == 7)
      
      current_match.update(first_player_sets: current_gem.game_set.match.first_player_sets.to_i + 1)
      
      if current_set.match.first_player_sets.to_i == 3
        first_player_win_match
      else

        new_current_set = GameSet.create(
          match_id: current_gem.game_set.match.id)
        
        new_current_gem = GameGem.create(
          match_id: current_match.id,
          game_set_id: new_current_set.id,
          first_player_points: 0,
          second_player_points: 0
        )

      end
    
    else # Kreiramo novi gem u okviru meča
    
      # current_set.update(first_player_gems: current_set.first_player_gems.to_i + 1) # Vec smo uradili ovo

      GameGem.create(
        match_id: current_match.id, #current_gem.game_set.match.id,
        game_set_id: current_set.id, #current_gem.game_set.id
        first_player_points: 0,
        second_player_points: 0
      )

    end

  end

  def first_player_win_match
    self.match.update(is_match_finished: true, is_first_player_win: true)
  end

  def print_tie_break
    Rails.logger.info(".")
    Rails.logger.info("------------------------------------------------------------")
    Rails.logger.info("Sada je 6 prema 6 u gemovima")
    Rails.logger.info("------------------------------------------------------------")
    Rails.logger.info(".")
  end

  def second_player_gets_gem
    # match = Match.last # Potrebno da se promeni u buducnosti
    # current_set = match.game_sets.last
    # current_gem = match.game_sets.last.game_gems.last

    current_gem = self.game_gem
    current_set = current_gem.game_set
    current_match = current_set.match

    # Update rezultata gemova u okviru seta
    current_gem.game_set.update(second_player_gems: current_gem.game_set.second_player_gems.to_i + 1)

    if (current_set.second_player_gems.to_i == 6 && current_set.first_player_gems.to_i < 5) || (current_set.second_player_gems.to_i == 7)
      
      current_match.update(second_player_sets: current_gem.game_set.match.second_player_sets.to_i + 1)
      
      if current_set.match.second_player_sets.to_i == 3
        second_player_win_match
      else

        new_current_set = GameSet.create(
          match_id: current_gem.game_set.match.id)
        
        new_current_gem = GameGem.create(
          match_id: current_match.id,
          game_set_id: new_current_set.id,
          first_player_points: 0,
          second_player_points: 0
        )

      end
    
    else # Kreiramo novi gem u okviru meča
    
      # current_set.update(first_player_gems: current_set.first_player_gems.to_i + 1) # Vec smo uradili ovo

      GameGem.create(
        match_id: current_match.id, #current_gem.game_set.match.id,
        game_set_id: current_set.id, #current_gem.game_set.id
        first_player_points: 0,
        second_player_points: 0
      )

    end

  end

  def second_player_win_match
    self.match.update(is_match_finished: true, is_first_player_win: false)
  end
end

require 'pry'

def get_first_name_of_season_winner(data, season)
  first_name = 0
  data.each do |s, contestants|
    if s==season
      contestants.each do |person|
        person.each do |attribute, value|
          if attribute == "status" && value == "Winner"
            first_name = person["name"].split[0]
          end
        end
      end
    end
  end
  first_name
end

def get_contestant_name(data, occupation)
  first_name = 0
  data.each do |s, contestants|
    contestants.each do |person|
      person.each do |attribute, value|
        if value == occupation
          first_name = person["name"]
        end
      end
    end
  end
  first_name
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |s, contestants|
    contestants.each do |person|
      person.each do |attribute, value|
        if attribute == "hometown" && value==hometown
          counter+=1
        end
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  occupation=0
  data.each do |s, contestants|
    contestants.find do |person|
      if person["hometown"]==hometown
        occupation = person["occupation"]
      end
    end
  end
  occupation
end

#def get_occupation(data, hometown)
#  occupation=0
#  data.each do |s, contestants|
#    contestants.each do |person|
#      person.each do |attribute, value|
#        if value == hometown
#          occupation = person["occupation"]
#          binding.pry
#        end
#      end
#    end
#  end
#  occupation
#end

def get_average_age_for_season(data, season)
  sum=0
  count = 0
  data.each do |s, contestants|
    if s == season
      contestants.each do |person|
        person.each do |attribute, value|
          if attribute == "age"
            sum+=value.to_i
            count+=1
          end
        end
      end
    end
  end
  (sum/count.to_f).round
end

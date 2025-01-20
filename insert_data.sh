#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games;")

#LEE LOS EQUIPOS EN games.csv Y LOS AGREGA A teams.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")

    if [[ -z $TEAM_ID ]] 
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi
  fi

  if [[ $OPPONENT != "opponent" ]]
  then
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

    if [[ -z $TEAM_ID ]] 
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    fi
  fi
done

#LEE TODO de games.csv Y LOS AGREGA A games con winner_id y opponent_id.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR'
    and round='$ROUND' 
    and winner_id in (SELECT team_id FROM teams WHERE name='$WINNER')
    and opponent_id in (SELECT team_id FROM teams WHERE name='$OPPONENT')
    and winner_goals=$WINNER_GOALS
    and opponent_goals=$OPPONENT_GOALS;")

    if [[ -z $GAME_ID ]] 
    then
      TEAM_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
      TEAM_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
      
      INSERT_GAME_ID_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,
      opponent_id,winner_goals,opponent_goals) VALUES($YEAR, '$ROUND',
       $TEAM_ID_WINNER, $TEAM_ID_OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS);")
      
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR'
      and round='$ROUND' 
      and winner_id in (SELECT team_id FROM teams WHERE name='$WINNER')
      and opponent_id in (SELECT team_id FROM teams WHERE name='$OPPONENT')
      and winner_goals=$WINNER_GOALS
      and opponent_goals=$OPPONENT_GOALS;")
    fi
  fi  
done
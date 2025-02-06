#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Services ~~~~~\n"
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Select a service"
  echo -e "\n1) Alpha\n2) Betha\n3) Gamma\n4) Exit"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) ALPHA ;;
    2) BETHA ;;
    3) GAMMA ;;
    4) EXIT ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

ALPHA() {

  #get number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers 
  WHERE phone='$CUSTOMER_PHONE'")

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    #get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) 
    VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

    CUSTOMER_ID=$($PSQL "SELECT customer_id 
    FROM customers WHERE name='$CUSTOMER_NAME'")

    SERVICE_NAME=$($PSQL "SELECT name FROM services 
    WHERE service_id=$SERVICE_ID_SELECTED")

    #SERVICE_NAME2=$(echo '$SERVICE_NAME' | sed -E '/s/^ *| *$//g')

    #SETTING TIME
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME

    #INSERT NEW SERVICE
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) 
    VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

  else
    #insert a new appointment
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id 
    FROM customers WHERE phone='$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$($PSQL "SELECT name 
    FROM customers WHERE phone='$CUSTOMER_PHONE'")

    SERVICE_NAME=$($PSQL "SELECT name FROM services 
    WHERE service_id=$SERVICE_ID_SELECTED")

    #SETTING TIME
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME

    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,
    service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  fi 
}

BETHA() {

  #get number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers 
  WHERE phone='$CUSTOMER_PHONE'")

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    #get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) 
    VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

    CUSTOMER_ID=$($PSQL "SELECT customer_id 
    FROM customers WHERE name='$CUSTOMER_NAME'")

    SERVICE_NAME=$($PSQL "SELECT name FROM services 
    WHERE service_id=$SERVICE_ID_SELECTED")

    #SETTING TIME
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME

    #INSERT NEW SERVICE
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,
    service_id,time) 
    VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

  else
    #insert a new appointment
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id 
    FROM customers WHERE phone='$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$($PSQL "SELECT name 
    FROM customers WHERE phone='$CUSTOMER_PHONE'")

    SERVICE_NAME=$($PSQL "SELECT name FROM services 
    WHERE service_id=$SERVICE_ID_SELECTED")

    #SETTING TIME
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME

    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,
    service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  fi 
}

GAMMA() {

  #get number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers 
  WHERE phone='$CUSTOMER_PHONE'")

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    #get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) 
    VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

    CUSTOMER_ID=$($PSQL "SELECT customer_id 
    FROM customers WHERE name='$CUSTOMER_NAME'")
    
    SERVICE_NAME=$($PSQL "SELECT name FROM services 
    WHERE service_id=$SERVICE_ID_SELECTED")

    #SETTING TIME
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME

    #INSERT NEW SERVICE
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,
    service_id,time) 
    VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

  else
    #insert a new appointment
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id 
    FROM customers WHERE phone='$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$($PSQL "SELECT name 
    FROM customers WHERE phone='$CUSTOMER_PHONE'")

    SERVICE_NAME=$($PSQL "SELECT name FROM services 
    WHERE service_id=$SERVICE_ID_SELECTED")

    #SETTING TIME
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME

    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,
    service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  fi 
}

EXIT() {
  echo -e "\nThank you for your preference.\n"
}

MAIN_MENU
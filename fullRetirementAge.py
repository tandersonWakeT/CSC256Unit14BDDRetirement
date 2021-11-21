def main():
    print("Social Security Full Retirement Age Calculator")

    flag = True
    while flag:
        year, month = gather_info()
        calc_age(year, month)
        print()


def gather_info_test(birth_year, birth_month):

    try:
        birth_year = birth_year # int(input("Enter the year you were born (or enter to exit): "))
        if birth_year > 2021 or birth_year < 1900:
            raise ValueError
    except ValueError:
        print("Invalid input")
        exit()

    try:
        birth_month = birth_month # int(input("Enter the month you were born: "))
        if birth_month > 12 or birth_month < 1:
            raise ValueError
    except ValueError:
        print("Invalid Input")
        exit()

    return birth_year, birth_month


def gather_info():

    try:
        birth_year = int(input("Enter the year you were born (or enter to exit): "))
        if birth_year > 2021 or birth_year < 1900:
            raise ValueError
    except ValueError:
        print("Invalid input")
        exit()

    try:
        birth_month = int(input("Enter the month you were born: "))
        if birth_month > 12 or birth_month < 1:
            raise ValueError
    except ValueError:
        print("Invalid Input")
        exit()

    return birth_year, birth_month


def calc_age(year, month):
    if 1900 <= year < 1943:
        print("Your full retirement age is 65 and 8 months")
        calc_retirement(year, month, 65, 8)
    elif 1943 <= year <= 1954:
        print("Your full retirement age is 66 and 0 months")
        calc_retirement(year, month, 66, 0)
    elif year == 1955:
        print("Your full retirement age is 66 and 2 months")
        calc_retirement(year, month, 66, 2)
    elif year == 1956:
        print("Your full retirement age is 66 and 4 months")
        calc_retirement(year, month, 66, 4)
    elif year == 1957:
        print("Your full retirement age is 66 and 6 months")
        calc_retirement(year, month, 66, 6)
    elif year == 1958:
        print("Your full retirement age is 66 and 8 months")
        calc_retirement(year, month, 66, 8)
    elif year == 1959:
        print("Your full retirement age is 66 and 10 months")
        calc_retirement(year, month, 66, 10)
    elif year >= 1960:
        print("Your full retirement age is 67 and 0 months")
        calc_retirement(year, month, 67, 0)
    else:
        print("This program does not cover that year")


def calc_retirement(year, month, age_y, age_m):
    retire_month = month + age_m
    # uptick year by 1 and determine correct month if retireMonth > 12
    if retire_month > 12:
        retire_month = retire_month - 12
        age_y = age_y + 1

    month_str = ""

    if retire_month == 1:
        month_str = "January"
    elif retire_month == 2:
        month_str = "February"
    elif retire_month == 3:
        month_str = "March"
    elif retire_month == 4:
        month_str = "April"
    elif retire_month == 5:
        month_str = "May"
    elif retire_month == 6:
        month_str = "June"
    elif retire_month == 7:
        month_str = "July"
    elif retire_month == 8:
        month_str = "August"
    elif retire_month == 9:
        month_str = "September"
    elif retire_month == 10:
        month_str = "October"
    elif retire_month == 11:
        month_str = "November"
    elif retire_month == 12:
        month_str = "December"
    else:
        print("Invalid Month")

    retire_year = year + age_y

    print("This will be in", month_str, "of", retire_year)


main()

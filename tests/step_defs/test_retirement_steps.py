from pytest_bdd import scenarios, given, when, then

from fullRetirementAge import gather_info_test, calc_retirement, calc_age

scenarios('../features/retirement.feature')


@given('The user enters "{2022}" for birth year, and valid birth month')
def test_invalid_birth_year_high():
    gather_info_test(2022, 1)

#@when('')
#def

from datetime import date, timedelta


def transform_to_date(week_code: str) -> date:
    """
    :param week_code: Código do dia da semana
    :type week_code: string

    Return:
        date: Dia de referencia da semana (começando em 01/01/2022)
    """

    week_add = int(week_code.split('W')[1])
    return date(2022, 1, 1) + timedelta(weeks=week_add)


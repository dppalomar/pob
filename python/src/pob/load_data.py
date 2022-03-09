import pandas as pd
import os


cryptos_2017to2021 = {'daily': pd.read_csv(os.path.join(os.path.dirname(__file__),
                               'datasets/cryptos_2017to2021_daily.csv')),
                      'hourly': pd.read_csv(os.path.join(os.path.dirname(__file__),
                               'datasets/cryptos_2017to2021_hourly.csv'))}

SP500_2015to2020 = {'stocks': pd.read_csv(os.path.join(os.path.dirname(__file__),
                               'datasets/SP500_2015to2020_stocks.csv')),
                      'index': pd.read_csv(os.path.join(os.path.dirname(__file__),
                               'datasets/SP500_2015to2020_index.csv'))}

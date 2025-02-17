from importlib.resources import files
import pyreadr
import pandas as pd


def load_dataset(name: str) -> pd.DataFrame:
    """Load financial dataset from RDS files"""
    try:
        # Access data through explicit package reference
        package = "pob_python.data"
        resource = f"{name}.rds"
        rds_path = files(package).joinpath(resource)

        # Validate path resolution
        if not rds_path.exists():
            raise FileNotFoundError(f"Resource {resource} not found in {package}")

        # Load dataframe
        df = pyreadr.read_r(str(rds_path))[None]

        # Convert date column to pandas datetime
        df['Date'] = pd.to_datetime(
            df['Date'],
            format='%Y-%m-%d',  # Explicit format specifier
            errors='coerce'  # Handle irregular entries
        )
        df = (
            df.dropna(subset=['Date'])
            .set_index('Date', verify_integrity=True)
            .sort_index()
        )
        return df

    except Exception as e:
        raise RuntimeError(f"Failed to load dataset {name}: {str(e)}") from e


# Initialize datasets at import
SP500_stocks_2015to2020 = load_dataset("SP500_stocks_2015to2020")
SP500_index_2015to2020 = load_dataset("SP500_index_2015to2020")
cryptos_2017to2021_daily = load_dataset("cryptos_2017to2021_daily")
cryptos_2017to2021_hourly = load_dataset("cryptos_2017to2021_hourly")

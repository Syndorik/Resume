import numpy as np
from sklearn.compose import ColumnTransformer
from sklearn.impute import SimpleImputer
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import OneHotEncoder, OrdinalEncoder, StandardScaler


class PricingModelPreprocessor:
    def __init__(self):
        self.vehicle_onehot_cols = ["vh_make", "vh_model", "vh_fuel", "vh_fuel", "vh_type"]
        self.vehicle_standard_cols = [
            "vh_age",
            "vh_cyl",
            "vh_din",
            "vh_sale_begin",
            "vh_sale_end",
            "vh_speed",
            "vh_value",
            "vh_weight",
        ]
        self.policy_onehot_cols = ["pol_payd", "pol_insee_code"]
        self.policy_ordinal_cols = ["pol_coverage", "pol_pay_freq", "pol_usage"]
        self.policy_standard_cols = ["pol_bonus", "pol_duration", "pol_sit_duration"]

        self.driver_onehot = ["drv_sex1", "drv_sex2", "drv_drv2"]
        self.driver_standard = ["drv_age1", "drv_age2", "drv_age_lic1", "drv_age_lic2"]

        self.location_onehot_1 = ["regional_department_code"]
        self.location_onehot_2 = ["commune_code", "canton_code", "city_district_code"]
        self.location_standard = ["town_mean_altitude", "town_surface_area", "population"]

        self.column_transformer = ColumnTransformer(
            transformers=[
                # Vehicle
                (
                    "vehicle_onehot",
                    make_pipeline(
                        SimpleImputer(strategy="constant", fill_value="-1"), OneHotEncoder(handle_unknown="ignore")
                    ),
                    self.vehicle_onehot_cols,
                ),
                ("vehicle_standard", make_pipeline(SimpleImputer(), StandardScaler()), self.vehicle_standard_cols),
                # Policy
                (
                    "policy_onehot",
                    make_pipeline(
                        SimpleImputer(strategy="constant", fill_value="-1"), OneHotEncoder(handle_unknown="ignore")
                    ),
                    self.policy_onehot_cols,
                ),
                (
                    "policy_ordinal",
                    OrdinalEncoder(
                        [
                            ["Mini", "Median1", "Median2", "Maxi"],
                            ["Yearly", "Biannual", "Quarterly", "Monthly"],
                            ["Retired", "WorkPrivate", "Professional", "AllTrips"],
                        ]
                    ),
                    self.policy_ordinal_cols,
                ),
                ("policy_standard", make_pipeline(SimpleImputer(), StandardScaler()), self.policy_standard_cols),
                # Driver
                (
                    "driver_onehot",
                    make_pipeline(
                        SimpleImputer(strategy="constant", fill_value="-1"), OneHotEncoder(handle_unknown="ignore")
                    ),
                    self.driver_onehot,
                ),
                ("driver_standard", make_pipeline(SimpleImputer(0), StandardScaler()), self.driver_standard),
                # Location
                (
                    "location_onehot_1",
                    make_pipeline(
                        SimpleImputer(strategy="constant", fill_value="-1"), OneHotEncoder(handle_unknown="ignore")
                    ),
                    self.location_onehot_1,
                ),
                (
                    "location_onehot_2",
                    make_pipeline(
                        SimpleImputer(strategy="constant", fill_value=-1), OneHotEncoder(handle_unknown="ignore")
                    ),
                    self.location_onehot_2,
                ),
                ("location_standard", make_pipeline(SimpleImputer(), StandardScaler()), self.location_standard),
            ],
            remainder="drop",  # To ensure we don't include target variables
        )

    def fit(self, X_raw):
        self.remove_counts_less_than(
            X_raw,
            [
                "vh_make",
                "vh_model",
                "commune_code",
                "city_district_code",
                "canton_code",
                "pol_insee_code",
                "regional_department_code",
            ],
        )
        self.column_transformer.fit(X_raw)

    def transform(self, X_raw, fit=False):
        if fit:
            self.fit(X_raw)
        return self.column_transformer.transform(X_raw)

    def remove_counts_less_than(self, X, columns, less_than=100):
        if not isinstance(columns, list):
            columns = [columns]
        for column in columns:
            counts = X[column].value_counts()
            categories = counts[counts < less_than].index
            X.loc[X[column].isin(categories), column] = np.nan

    def get_col_sizes(self):
        v_start = 0
        v1 = self.column_transformer.named_transformers_["vehicle_onehot"][1].get_feature_names().shape[0]
        v2 = len(self.vehicle_standard_cols)
        p_start = v1 + v2
        p1 = self.column_transformer.named_transformers_["policy_onehot"][1].get_feature_names().shape[0]
        p2 = len(self.policy_ordinal_cols) + len(self.policy_standard_cols)
        d_start = p_start + p1 + p2
        d1 = self.column_transformer.named_transformers_["driver_onehot"][1].get_feature_names().shape[0]
        d2 = len(self.driver_standard)
        l_start = d_start + d1 + d2
        l1 = self.column_transformer.named_transformers_["location_onehot_1"][1].get_feature_names().shape[0]
        l2 = self.column_transformer.named_transformers_["location_onehot_2"][1].get_feature_names().shape[0]
        l3 = len(self.location_standard)
        end = l_start + l1 + l2 + l3

        return {
            "vehicle": range(v_start, p_start),
            "policy": range(p_start, d_start),
            "driver": range(d_start, l_start),
            "location": range(l_start, end),
        }

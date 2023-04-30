# Creates variables that holds column names or patterns 

## COLUMN NAMES AND PATTERNS FOR EXTRACTING DATA
DEMOGRAPHIC_COLS <- c(
    "AdminMode",
    "Age",
    "CurrentCountry",
    "CurrentCountryCode",
    "DM_Key",
    "ES_Key",
    "EventLocation",
    "EventAbbreviation",
    "EventName",
    "EventType",
    "FormActualKey",
    "FormLanguage",
    "Functn",
    "Gender",
    "GM_Name",
    "HighestDegreeEarned",
    "IM_Key",
    "LevelExperience",
    "NativeCountry",
    "NativeCountryCode",
    "NativeLanguage",
    "NativeLanguageCode",
    "NumEmployees",
    "NumYearsInSchool",
    "OrganizationLevel",
    "OrganizationSector",
    "OrganizationType",
    "ParentSector",
    "Race",
    "ReportPrintedDateTime",
    "Sector",
    "SerialNum",
    "Start_Date",
    "Understand"
)

COMPETENCY_COL_PATTERN <- "\\w+(S|D)\\d{2,}.*"
ITEM_COL_PATTERN <- "(?i)\\w+s1.\\d{1,}$"
RESEARCH_COL_PATTERN <- "(?i)\\w+s5.\\d{1,}$"


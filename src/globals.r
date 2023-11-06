#' @title Save Variables to lari_env Environment
#' @description
#'   Creates variables that hold column names or patterns. It doesn't return any value but loads all required variables to the environment.
#'

## column names and patterns for extracting data
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
ITEM_COL_PATTERN <- "(?i)\\w+s(1|2).\\d{1,}$"
RESEARCH_COL_PATTERN <- "(?i)\\w+s5.\\d{1,}$"

raters <- c("Self", "Direct Report", "Peer", "Boss")

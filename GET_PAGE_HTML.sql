--
-- Function "GET_PAGE_HTML"
--
CREATE OR REPLACE EDITIONABLE FUNCTION "MY_FINANCE"."GET_PAGE_HTML" RETURN CLOB
AS
    l_result clob ;
begin
    l_result := q'^<style>
/* =========================================================
   Oracle APEX Redwood Rose
   Database and GitHub Deployment Workspace
   HTML and CSS only
   ========================================================= */

:root {
    --deploy-primary: #8f1d55;
    --deploy-primary-dark: #6f1742;
    --deploy-primary-soft: #f9e9f1;

    --deploy-success: #237a57;
    --deploy-success-soft: #eaf7f1;

    --deploy-info: #2563a5;
    --deploy-info-dark: #1d4f85;
    --deploy-info-soft: #eaf3fb;

    --deploy-warning: #9a6200;
    --deploy-warning-soft: #fff5dc;

    --deploy-text: #1f2937;
    --deploy-text-secondary: #5f6773;
    --deploy-border: #dfe3e8;
    --deploy-border-strong: #cfd5dc;
    --deploy-surface: #ffffff;
    --deploy-background: #f7f8fa;

    --deploy-radius-lg: 16px;
    --deploy-radius-md: 10px;
    --deploy-radius-sm: 7px;

    --deploy-shadow:
        0 1px 2px rgba(31, 41, 55, 0.05),
        0 8px 24px rgba(31, 41, 55, 0.06);
}

/* =========================================================
   Main page container
   ========================================================= */

.deployment-workspace {
    width: 100%;
    box-sizing: border-box;
    padding: 24px;
    color: var(--deploy-text);

    background:
        radial-gradient(
            circle at top right,
            rgba(143, 29, 85, 0.06),
            transparent 34%
        ),
        var(--deploy-background);

    font-family:
        "Oracle Sans",
        -apple-system,
        BlinkMacSystemFont,
        "Segoe UI",
        Arial,
        sans-serif;
}

.deployment-workspace,
.deployment-workspace * {
    box-sizing: border-box;
}

/* =========================================================
   Page header
   ========================================================= */

.deployment-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 24px;
    margin-bottom: 22px;
}

.deployment-header__content {
    display: flex;
    align-items: center;
    gap: 14px;
    min-width: 0;
}

.deployment-header__icon {
    display: flex;
    flex: 0 0 48px;
    align-items: center;
    justify-content: center;
    width: 48px;
    height: 48px;
    color: var(--deploy-primary);
    background: var(--deploy-primary-soft);
    border: 1px solid rgba(143, 29, 85, 0.14);
    border-radius: 14px;
}

.deployment-header__icon svg {
    width: 25px;
    height: 25px;
}

.deployment-header__title {
    margin: 0;
    color: var(--deploy-text);
    font-size: 1.5rem;
    font-weight: 700;
    line-height: 1.25;
    letter-spacing: -0.02em;
}

.deployment-header__description {
    margin: 5px 0 0;
    color: var(--deploy-text-secondary);
    font-size: 0.9rem;
    line-height: 1.5;
}

.deployment-environment {
    display: inline-flex;
    flex: 0 0 auto;
    align-items: center;
    gap: 8px;
    min-height: 34px;
    padding: 6px 12px;
    color: var(--deploy-primary-dark);
    background: var(--deploy-primary-soft);
    border: 1px solid rgba(143, 29, 85, 0.16);
    border-radius: 999px;
    font-size: 0.78rem;
    font-weight: 700;
}

.deployment-environment__indicator {
    width: 8px;
    height: 8px;
    background: var(--deploy-success);
    border-radius: 50%;
    box-shadow: 0 0 0 3px rgba(35, 122, 87, 0.14);
}

/* =========================================================
   Two-column horizontal layout
   ========================================================= */

.deployment-grid {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
    gap: 20px;
    align-items: stretch;
}

.deployment-panel {
    position: relative;
    display: flex;
    min-width: 0;
    min-height: 530px;
    flex-direction: column;
    overflow: hidden;
    background: var(--deploy-surface);
    border: 1px solid var(--deploy-border);
    border-radius: var(--deploy-radius-lg);
    box-shadow: var(--deploy-shadow);
}

.deployment-panel::before {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    height: 4px;
    content: "";

    background:
        linear-gradient(
            90deg,
            var(--deploy-primary),
            #c74678
        );
}

.deployment-panel--install::before {
    background:
        linear-gradient(
            90deg,
            var(--deploy-info),
            #4d8bc4
        );
}

/* =========================================================
   Panel header
   ========================================================= */

.deployment-panel__header {
    display: flex;
    align-items: flex-start;
    gap: 14px;
    padding: 24px 24px 19px;
    border-bottom: 1px solid var(--deploy-border);
}

.deployment-panel__icon {
    display: flex;
    flex: 0 0 44px;
    align-items: center;
    justify-content: center;
    width: 44px;
    height: 44px;
    color: var(--deploy-primary);
    background: var(--deploy-primary-soft);
    border-radius: 12px;
}

.deployment-panel--install .deployment-panel__icon {
    color: var(--deploy-info);
    background: var(--deploy-info-soft);
}

.deployment-panel__icon svg {
    width: 23px;
    height: 23px;
}

.deployment-panel__heading {
    min-width: 0;
}

.deployment-panel__eyebrow {
    display: block;
    margin-bottom: 4px;
    color: var(--deploy-primary);
    font-size: 0.72rem;
    font-weight: 800;
    line-height: 1;
    letter-spacing: 0.08em;
    text-transform: uppercase;
}

.deployment-panel--install .deployment-panel__eyebrow {
    color: var(--deploy-info);
}

.deployment-panel__title {
    margin: 0;
    color: var(--deploy-text);
    font-size: 1.08rem;
    font-weight: 700;
    line-height: 1.35;
}

.deployment-panel__subtitle {
    margin: 5px 0 0;
    color: var(--deploy-text-secondary);
    font-size: 0.82rem;
    line-height: 1.45;
}

/* =========================================================
   Panel body
   ========================================================= */

.deployment-panel__body {
    display: flex;
    flex: 1;
    flex-direction: column;
    padding: 22px 24px 24px;
}

.deployment-form {
    display: flex;
    flex: 1;
    flex-direction: column;
}

.deployment-fields {
    display: grid;
    gap: 18px;
}

.deployment-field {
    min-width: 0;
}

.deployment-field-row {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
    gap: 14px;
}

/* =========================================================
   Field labels and help text
   ========================================================= */

.deployment-label {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
    margin-bottom: 7px;
    color: var(--deploy-text);
    font-size: 0.82rem;
    font-weight: 700;
}

.deployment-required {
    color: #b42318;
}

.deployment-help {
    margin: 6px 0 0;
    color: var(--deploy-text-secondary);
    font-size: 0.75rem;
    line-height: 1.45;
}

/* =========================================================
   Form controls
   ========================================================= */

.deployment-control {
    width: 100%;
    min-height: 43px;
    padding: 9px 12px;
    color: var(--deploy-text);
    background-color: #ffffff;
    border: 1px solid var(--deploy-border-strong);
    border-radius: var(--deploy-radius-sm);
    outline: none;
    font: inherit;
    font-size: 0.86rem;
    line-height: 1.4;

    transition:
        border-color 160ms ease,
        box-shadow 160ms ease,
        background-color 160ms ease;
}

select.deployment-control {
    padding-right: 38px;
    cursor: pointer;
}

textarea.deployment-control {
    min-height: 92px;
    resize: vertical;
}

.deployment-control::placeholder {
    color: #8a929e;
}

.deployment-control:hover {
    border-color: #aeb6c0;
}

.deployment-control:focus {
    border-color: var(--deploy-primary);
    box-shadow: 0 0 0 3px rgba(143, 29, 85, 0.13);
}

.deployment-panel--install .deployment-control:focus {
    border-color: var(--deploy-info);
    box-shadow: 0 0 0 3px rgba(37, 99, 165, 0.13);
}

/* =========================================================
   Repository summary
   ========================================================= */

.repository-summary {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1px;
    overflow: hidden;
    margin-top: 2px;
    background: var(--deploy-border);
    border: 1px solid var(--deploy-border);
    border-radius: var(--deploy-radius-md);
}

.repository-summary__item {
    min-width: 0;
    padding: 12px 13px;
    background: #fafbfc;
}

.repository-summary__label {
    display: block;
    margin-bottom: 4px;
    color: var(--deploy-text-secondary);
    font-size: 0.69rem;
    font-weight: 700;
    letter-spacing: 0.04em;
    text-transform: uppercase;
}

.repository-summary__value {
    display: block;
    overflow: hidden;
    color: var(--deploy-text);
    font-size: 0.8rem;
    font-weight: 600;
    text-overflow: ellipsis;
    white-space: nowrap;
}

/* =========================================================
   Warning notice
   ========================================================= */

.deployment-notice {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    margin-top: 20px;
    padding: 12px 13px;
    color: #5d4708;
    background: var(--deploy-warning-soft);
    border: 1px solid #f1d48d;
    border-radius: var(--deploy-radius-md);
    font-size: 0.77rem;
    line-height: 1.5;
}

.deployment-notice svg {
    flex: 0 0 auto;
    width: 18px;
    height: 18px;
    margin-top: 1px;
    color: var(--deploy-warning);
}

/* =========================================================
   Action area
   ========================================================= */

.deployment-actions {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    margin-top: auto;
    padding-top: 24px;
}

.deployment-action-note {
    display: flex;
    align-items: center;
    gap: 7px;
    color: var(--deploy-text-secondary);
    font-size: 0.75rem;
}

.deployment-action-note svg {
    width: 15px;
    height: 15px;
    color: var(--deploy-success);
}

/* =========================================================
   Buttons
   ========================================================= */

.deployment-button {
    display: inline-flex;
    min-height: 43px;
    align-items: center;
    justify-content: center;
    gap: 9px;
    padding: 10px 18px;
    color: #ffffff;
    background: var(--deploy-primary);
    border: 1px solid var(--deploy-primary);
    border-radius: var(--deploy-radius-sm);
    box-shadow: 0 2px 5px rgba(143, 29, 85, 0.2);
    cursor: pointer;
    font: inherit;
    font-size: 0.84rem;
    font-weight: 700;
    line-height: 1;

    transition:
        background-color 160ms ease,
        border-color 160ms ease,
        box-shadow 160ms ease,
        transform 160ms ease;
}

.deployment-button:hover {
    background: var(--deploy-primary-dark);
    border-color: var(--deploy-primary-dark);
    box-shadow: 0 4px 10px rgba(143, 29, 85, 0.25);
    transform: translateY(-1px);
}

.deployment-button:focus-visible {
    outline: 3px solid rgba(143, 29, 85, 0.22);
    outline-offset: 2px;
}

.deployment-button:active {
    transform: translateY(0);
}

.deployment-button--install {
    background: var(--deploy-info);
    border-color: var(--deploy-info);
    box-shadow: 0 2px 5px rgba(37, 99, 165, 0.2);
}

.deployment-button--install:hover {
    background: var(--deploy-info-dark);
    border-color: var(--deploy-info-dark);
    box-shadow: 0 4px 10px rgba(37, 99, 165, 0.24);
}

.deployment-button--install:focus-visible {
    outline-color: rgba(37, 99, 165, 0.22);
}

.deployment-button svg {
    width: 18px;
    height: 18px;
}

/* =========================================================
   Responsive design
   ========================================================= */

@media (max-width: 960px) {
    .deployment-grid {
        grid-template-columns: 1fr;
    }

    .deployment-panel {
        min-height: auto;
    }
}

@media (max-width: 640px) {
    .deployment-workspace {
        padding: 14px;
    }

    .deployment-header {
        align-items: flex-start;
        flex-direction: column;
    }

    .deployment-header__title {
        font-size: 1.25rem;
    }

    .deployment-panel__header,
    .deployment-panel__body {
        padding-right: 18px;
        padding-left: 18px;
    }

    .deployment-field-row {
        grid-template-columns: 1fr;
    }

    .deployment-actions {
        align-items: stretch;
        flex-direction: column;
    }

    .deployment-button {
        width: 100%;
    }

    .repository-summary {
        grid-template-columns: 1fr;
    }
}
</style>


<div class="deployment-workspace">

    <!-- =====================================================
         Page Header
         ===================================================== -->
    <header class="deployment-header">

        <div class="deployment-header__content">

            <div class="deployment-header__icon" aria-hidden="true">
                <svg
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="1.8"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                >
                    <ellipse cx="12" cy="5" rx="7.5" ry="3"></ellipse>

                    <path
                        d="M4.5 5v7c0 1.7 3.4 3 7.5 3s7.5-1.3 7.5-3V5"
                    ></path>

                    <path
                        d="M4.5 12v7c0 1.7 3.4 3 7.5 3s7.5-1.3 7.5-3v-7"
                    ></path>

                    <path d="M16 8.5 19 6l3 2.5"></path>
                    <path d="M19 6v7"></path>
                </svg>
            </div>

            <div>
                <h1 class="deployment-header__title">
                    Database Deployment Workspace
                </h1>

                <p class="deployment-header__description">
                    Manage database scripts between Oracle Database and GitHub.
                </p>
            </div>

        </div>

        <div class="deployment-environment">
            <span class="deployment-environment__indicator"></span>
            Development Environment
        </div>

    </header>


    <!-- =====================================================
         Two Horizontal Panels
         ===================================================== -->
    <main class="deployment-grid">

        <!-- =================================================
             Panel 1: Push Database Object to GitHub
             ================================================= -->
        <section
            class="deployment-panel deployment-panel--push"
            aria-labelledby="push-panel-title"
        >

            <div class="deployment-panel__header">

                <div class="deployment-panel__icon" aria-hidden="true">
                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.8"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                    >
                        <ellipse cx="8" cy="6" rx="5" ry="2.5"></ellipse>
                        <path d="M3 6v5c0 1.4 2.2 2.5 5 2.5"></path>
                        <path d="M3 11v5c0 1.4 2.2 2.5 5 2.5"></path>
                        <path d="M14 18V9"></path>
                        <path d="m10.5 12.5 3.5-3.5 3.5 3.5"></path>
                        <path d="M14 18h6"></path>
                    </svg>
                </div>

                <div class="deployment-panel__heading">

                    <span class="deployment-panel__eyebrow">
                        Database to Repository
                    </span>

                    <h2
                        id="push-panel-title"
                        class="deployment-panel__title"
                    >
                        Push Database Object to GitHub
                    </h2>

                    <p class="deployment-panel__subtitle">
                        Generate the selected object's DDL and push it to a
                        specific repository branch.
                    </p>

                </div>

            </div>


            <div class="deployment-panel__body">

                <form class="deployment-form">

                    <div class="deployment-fields">

                        <!-- Object Type -->
                        <div class="deployment-field">

                            <label
                                class="deployment-label"
                                for="P10_OBJECT_TYPE"
                            >
                                <span>
                                    Object Type
                                    <span class="deployment-required">*</span>
                                </span>
                            </label>

                            <select
                                id="P10_OBJECT_TYPE"
                                name="P10_OBJECT_TYPE"
                                class="deployment-control"
                                required
                            >
                                <option value="">
                                    Select object type
                                </option>

                                <option value="TABLE">
                                    Table
                                </option>

                                <option value="VIEW">
                                    View
                                </option>

                                <option value="PACKAGE">
                                    Package
                                </option>

                                <option value="PROCEDURE">
                                    Procedure
                                </option>

                                <option value="FUNCTION">
                                    Function
                                </option>

                                <option value="TRIGGER">
                                    Trigger
                                </option>

                                <option value="SEQUENCE">
                                    Sequence
                                </option>

                                <option value="TYPE">
                                    Type
                                </option>
                            </select>

                        </div>


                        <!-- Database Object -->
                        <div class="deployment-field">

                            <label
                                class="deployment-label"
                                for="P10_OBJECT_NAME"
                            >
                                <span>
                                    Database Object
                                    <span class="deployment-required">*</span>
                                </span>
                            </label>

                            <select
                                id="P10_OBJECT_NAME"
                                name="P10_OBJECT_NAME"
                                class="deployment-control"
                                required
                            >
                                <option value="">
                                    Select a database object
                                </option>

                                <option value="EMPLOYEES">
                                    EMPLOYEES
                                </option>

                                <option value="PKG_EMPLOYEE_API">
                                    PKG_EMPLOYEE_API
                                </option>

                                <option value="VW_EMPLOYEE_DETAILS">
                                    VW_EMPLOYEE_DETAILS
                                </option>
                            </select>

                            <p class="deployment-help">
                                The object DDL will be generated from the
                                current database schema.
                            </p>

                        </div>


                        <!-- Repository and target branch -->
                        <div class="deployment-field-row">

                            <div class="deployment-field">

                                <label
                                    class="deployment-label"
                                    for="P10_REPOSITORY"
                                >
                                    <span>
                                        Repository
                                        <span class="deployment-required">*</span>
                                    </span>
                                </label>

                                <select
                                    id="P10_REPOSITORY"
                                    name="P10_REPOSITORY"
                                    class="deployment-control"
                                    required
                                >
                                    <option value="">
                                        Select repository
                                    </option>

                                    <option value="database-source">
                                        database-source
                                    </option>

                                    <option value="application-ddl">
                                        application-ddl
                                    </option>
                                </select>

                            </div>


                            <div class="deployment-field">

                                <label
                                    class="deployment-label"
                                    for="P10_TARGET_BRANCH"
                                >
                                    <span>
                                        Target Branch
                                        <span class="deployment-required">*</span>
                                    </span>
                                </label>

                                <select
                                    id="P10_TARGET_BRANCH"
                                    name="P10_TARGET_BRANCH"
                                    class="deployment-control"
                                    required
                                >
                                    <option value="">
                                        Select target branch
                                    </option>

                                    <option value="development">
                                        development
                                    </option>

                                    <option value="uat">
                                        uat
                                    </option>

                                    <option value="main">
                                        main
                                    </option>
                                </select>

                            </div>

                        </div>


                        <!-- Commit Message -->
                        <div class="deployment-field">

                            <label
                                class="deployment-label"
                                for="P10_COMMIT_MESSAGE"
                            >
                                Commit Message
                            </label>

                            <textarea
                                id="P10_COMMIT_MESSAGE"
                                name="P10_COMMIT_MESSAGE"
                                class="deployment-control"
                                placeholder="Describe the database object changes..."
                            ></textarea>

                        </div>


                        <!-- Push operation summary -->
                        <div
                            class="repository-summary"
                            aria-label="Push summary"
                        >

                            <div class="repository-summary__item">

                                <span class="repository-summary__label">
                                    Operation
                                </span>

                                <span class="repository-summary__value">
                                    Generate and push DDL
                                </span>

                            </div>


                            <div class="repository-summary__item">

                                <span class="repository-summary__label">
                                    File Format
                                </span>

                                <span class="repository-summary__value">
                                    SQL Script
                                </span>

                            </div>

                        </div>

                    </div>


                    <!-- Push actions -->
                    <div class="deployment-actions">

                        <div class="deployment-action-note">

                            <svg
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                aria-hidden="true"
                            >
                                <circle cx="12" cy="12" r="9"></circle>
                                <path d="m8 12 2.5 2.5L16 9"></path>
                            </svg>

                            GitHub connection is available

                        </div>


                        <button
                            id="PUSH_TO_GITHUB"
                            class="deployment-button"
                            type="button"
                        >

                            <svg
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                aria-hidden="true"
                            >
                                <path d="M12 19V5"></path>
                                <path d="m6.5 10.5 5.5-5.5 5.5 5.5"></path>
                                <path d="M5 19h14"></path>
                            </svg>

                            Push to GitHub

                        </button>

                    </div>

                </form>

            </div>

        </section>


        <!-- =================================================
             Panel 2: Install Script from GitHub
             ================================================= -->
        <section
            class="deployment-panel deployment-panel--install"
            aria-labelledby="install-panel-title"
        >

            <div class="deployment-panel__header">

                <div class="deployment-panel__icon" aria-hidden="true">
                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.8"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                    >
                        <path d="M4 5.5h7l2 2H20v11H4z"></path>
                        <path d="M12 10v7"></path>
                        <path d="m8.5 13.5 3.5 3.5 3.5-3.5"></path>
                        <ellipse cx="18" cy="18.5" rx="3" ry="1.5"></ellipse>
                        <path
                            d="M15 18.5v2c0 .8 1.3 1.5 3 1.5s3-.7 3-1.5v-2"
                        ></path>
                    </svg>
                </div>

                <div class="deployment-panel__heading">

                    <span class="deployment-panel__eyebrow">
                        Repository to Database
                    </span>

                    <h2
                        id="install-panel-title"
                        class="deployment-panel__title"
                    >
                        Install Script from GitHub
                    </h2>

                    <p class="deployment-panel__subtitle">
                        Retrieve a SQL script from the selected GitHub branch
                        and install it in the current database.
                    </p>

                </div>

            </div>


            <div class="deployment-panel__body">

                <form class="deployment-form">

                    <div class="deployment-fields">

                        <!-- Repository and source branch -->
                        <div class="deployment-field-row">

                            <div class="deployment-field">

                                <label
                                    class="deployment-label"
                                    for="P10_SOURCE_REPOSITORY"
                                >
                                    <span>
                                        Repository
                                        <span class="deployment-required">*</span>
                                    </span>
                                </label>

                                <select
                                    id="P10_SOURCE_REPOSITORY"
                                    name="P10_SOURCE_REPOSITORY"
                                    class="deployment-control"
                                    required
                                >
                                    <option value="">
                                        Select repository
                                    </option>

                                    <option value="database-source">
                                        database-source
                                    </option>

                                    <option value="application-ddl">
                                        application-ddl
                                    </option>
                                </select>

                            </div>


                            <div class="deployment-field">

                                <label
                                    class="deployment-label"
                                    for="P10_SOURCE_BRANCH"
                                >
                                    <span>
                                        Source Branch
                                        <span class="deployment-required">*</span>
                                    </span>
                                </label>

                                <select
                                    id="P10_SOURCE_BRANCH"
                                    name="P10_SOURCE_BRANCH"
                                    class="deployment-control"
                                    required
                                >
                                    <option value="">
                                        Select source branch
                                    </option>

                                    <option value="development">
                                        development
                                    </option>

                                    <option value="uat">
                                        uat
                                    </option>

                                    <option value="main">
                                        main
                                    </option>
                                </select>

                            </div>

                        </div>


                        <!-- Script selection -->
                        <div class="deployment-field">

                            <label
                                class="deployment-label"
                                for="P10_SCRIPT_PATH"
                            >
                                <span>
                                    Script
                                    <span class="deployment-required">*</span>
                                </span>
                            </label>

                            <select
                                id="P10_SCRIPT_PATH"
                                name="P10_SCRIPT_PATH"
                                class="deployment-control"
                                required
                            >
                                <option value="">
                                    Select a SQL script
                                </option>

                                <option value="tables/employees.sql">
                                    tables/employees.sql
                                </option>

                                <option value="packages/pkg_employee_api.sql">
                                    packages/pkg_employee_api.sql
                                </option>

                                <option value="views/vw_employee_details.sql">
                                    views/vw_employee_details.sql
                                </option>
                            </select>

                            <p class="deployment-help">
                                The available scripts should be loaded after
                                selecting the repository and source branch.
                            </p>

                        </div>


                        <!-- Installation summary -->
                        <div
                            class="repository-summary"
                            aria-label="Installation summary"
                        >

                            <div class="repository-summary__item">

                                <span class="repository-summary__label">
                                    Operation
                                </span>

                                <span class="repository-summary__value">
                                    Retrieve and install
                                </span>

                            </div>


                            <div class="repository-summary__item">

                                <span class="repository-summary__label">
                                    Execution Target
                                </span>

                                <span class="repository-summary__value">
                                    Current Database
                                </span>

                            </div>

                        </div>


                        <!-- Installation warning -->
                        <div class="deployment-notice">

                            <svg
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                aria-hidden="true"
                            >
                                <path d="M12 3 2.5 20h19z"></path>
                                <path d="M12 9v5"></path>
                                <path d="M12 18h.01"></path>
                            </svg>

                            <span>
                                Review the selected repository, source branch,
                                and SQL script before starting the installation.
                                The script will be installed in the current
                                database session.
                            </span>

                        </div>

                    </div>


                    <!-- Installation actions -->
                    <div class="deployment-actions">

                        <div class="deployment-action-note">

                            <svg
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                aria-hidden="true"
                            >
                                <circle cx="12" cy="12" r="9"></circle>
                                <path d="m8 12 2.5 2.5L16 9"></path>
                            </svg>

                            Database connection is available

                        </div>


                        <button
                            id="INSTALL_FROM_GITHUB"
                            class="deployment-button deployment-button--install"
                            type="button"
                        >

                            <svg
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                aria-hidden="true"
                            >
                                <path d="M12 5v12"></path>
                                <path d="m7 12 5 5 5-5"></path>
                                <path d="M5 20h14"></path>
                            </svg>

                            Install in Database

                        </button>

                    </div>

                </form>

            </div>

        </section>

    </main>

</div>^';

    return l_result;
end;
/
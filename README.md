# Owner Survey

Business owner interview cards with eight core questions, contact details, notes, pickup status, search, and backup import/export.

## Hosting

Vercel serves `dist` with no framework or build command. Configuration is in `vercel.json`. Supabase JS is pinned to 2.49.8 via jsDelivr.

## Cloud storage

The app uses Supabase Auth and `public.owner_survey_cards`. Each account can select, insert, and update only its own records. Anonymous access is denied. The frontend contains only a publishable key; never put service-role or secret keys in frontend code.

The schema was applied to project `aruomwihkddwkhllqhgt`; `supabase/schema.sql` documents it. Do not run this schema file again against an already-configured project.

## Email confirmation configuration

In the Supabase dashboard, open Authentication > URL Configuration. Set the Site URL to `https://surveyandscriptapp.vercel.app` and add that URL to Redirect URLs. This lets signup confirmation links return to the deployed app. Email signups are confirmed according to the project's existing Auth settings; those settings are not disabled by this integration.

Create a survey app account, confirm its email if requested, then sign in. This is separate from the Supabase dashboard login.

## Saving and backups

Changes save to a per-account device cache immediately, then upload automatically. Wait for **All changes saved to cloud** before closing. Use **Sync now** to retry failed saves or fetch edits from another device. Editing the same card simultaneously on multiple devices uses last-write-wins behavior.

Original browser-only records are kept under their existing key. **Upload browser cards** explicitly merges them into the signed-in account; the original copy is retained. Backups can also be imported. Local-file records must be exported from that file and imported on the hosted site.

Signing out clears the displayed cards but retains the account-scoped device cache. Export backups regularly.

## Call script and question editor

Use the arrow centered on the left edge to open or close the call script. Script text saves with the signed-in account.

Use **Edit questions** on the interview card to add, remove, or rewrite questions. **Reset to default** restores the original eight questions in the editor; select **Save questions** to apply. By default, changes apply to all cards and the template for new cards. Uncheck **Apply to all existing cards too** to update only the current card and future cards.

Each card stores its own question IDs and text. Removed or rewritten questions with answers are retained under **Previous answers**. Restoring default questions can recover previously archived answers by question ID. Question counts in the All cards tab adapt to each card.

Preferences are stored in the private `owner_survey_preferences` table. The additive schema is documented in `supabase/preferences-schema.sql` and was already applied to the linked project.

## Business demographics

Each interview card includes Industry (HVAC, Plumbing, Roofing, or Other with a custom text field), Business size (Small: 1-10 staff; Medium: 11-50; Large: 51+), and Position for the respondent's role. Size ranges are survey categories, not formal industry classifications. These fields are included in cloud records and JSON backups. Older cards default to blank values. The All cards view displays the demographics and includes them in search.

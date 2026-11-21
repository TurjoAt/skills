---
name: meta-app-review-kit
description: Prepare Meta App Review submissions for a SaaS that publishes Facebook Page or Instagram professional-account content. Use when scoping permissions, recording reviewer evidence, setting up test access, or responding to a rejection.
license: MIT
metadata:
  author: NextCTL
  version: "1.0.0"
---

# Meta App Review kit

Use this workflow for Facebook Pages and Instagram API with Facebook Login. Confirm which login and API your app implements before choosing scopes. Instagram API with Instagram Login uses different permission names and does not require a linked Facebook Page. Meta changes requirements often. Verify the current dashboard tasks and developer documentation for your app, use case, and API version before every submission. [App Review](https://developers.facebook.com/docs/app-review/) · [Instagram Platform](https://developers.facebook.com/docs/instagram-platform/)

## 1. Pre-flight

- Confirm the Business app type where the dashboard exposes app types, or the equivalent business use case in the current creation flow. Confirm the owning business portfolio and complete Business Verification when required. Check separately for Tech Provider access verification and any other dashboard prerequisites.
- Check app mode and access level separately. Use Development mode and eligible app/business roles for internal testing. Standard Access is generally for eligible role users or owned assets. Request Advanced Access for the approved scope needed by external customers, and follow the dashboard's review and Live mode instructions before rollout.
- Check the app icon, category, contact fields, domain, website platform settings and exact OAuth redirect URIs. Use reachable HTTPS pages for sign-in, privacy policy and the data deletion instructions URL or callback as required. Test the deletion path in a clean browser.
- Check Data Use Checkup status and due dates. Compare declared data use with [privacy and data use](references/privacy-and-data-use.md).
- Set up a clean SaaS login, a test Page, and a linked Instagram professional account. Confirm app roles and asset tasks independently. Follow [reviewer test setup](templates/reviewer-test-setup.md).

## 2. Map permissions to implemented features

For each requested permission, record the UI action, API operation, asset, data read or written, and what the reviewer can see. Check the permissions reference and endpoint documentation for dependencies and token requirements. Remove unused scopes from the review request and login configuration.

| Permission | Consider when the feature requires |
| --- | --- |
| `pages_show_list` | Listing eligible managed Pages for the user's Page picker. |
| `pages_read_engagement` | Reading Page data or posts, or satisfying a documented dependency for the exact publishing operation. |
| `pages_manage_posts` | Creating, editing, or deleting Facebook Page posts through your product. |
| `instagram_basic` | Identifying the connected Instagram professional account or reading supported profile/media fields in the Facebook Login flow. |
| `instagram_content_publish` | Publishing supported media to that Instagram account. |
| `business_management` | Using a documented Business Management API operation or permission dependency for the implemented asset-access flow. A business-owned Page alone is insufficient justification. |
| `instagram_manage_insights` (optional) | Displaying supported metrics for the connected Instagram account or its media. |
| `pages_manage_metadata` (optional) | Managing supported Page metadata or subscribing to Page webhook events used by a shipped feature. |

Use [permission justifications](templates/permission-justifications.md) for the written submission.

## 3. Assemble and submit

1. Complete dashboard prerequisites and test each endpoint with the intended role, asset, and token type.
2. Start with the permissions needed for the smallest complete feature. Submit documented dependencies together when the reviewer needs them to reproduce the flow. Add unrelated analytics or webhook scopes when those features are ready for their own evidence.
3. Record the consent and feature flows with the [screencast checklist](templates/screencast-checklist.md). Include one timestamped route per permission and show the resulting Page post or Instagram media where applicable.
4. Enter reproducible steps and any designated test credentials through the private review form. Run the submitted steps from a fresh session before submitting. Keep the reviewed UI, test accounts, and URLs available through the decision.

## 4. After approval

Verify the granted access levels and complete any remaining release checks. Confirm Live mode when appropriate and run an authorized end-to-end check as an eligible external customer on disposable content. Verify connection, consent, publication, revocation, and deletion. Handle declined permissions, expiry, and asset-role changes in the UI. Track renewal, verification, and Data Use Checkup deadlines and review new uses before exposing them.

## Troubleshoot

Use the [rejection guide](references/rejection-reasons.md) to map each review comment to a reproducible fix. When a request works only for admins, check mode, access level, intended asset role, login configuration, granted scopes, and the actual API response before recording again.

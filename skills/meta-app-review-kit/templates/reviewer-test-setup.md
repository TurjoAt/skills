# Reviewer test setup

## 1. Create a clean test workspace

- [ ] Record app/build [ ], dashboard app mode [ ], and review URL [ ].
- [ ] Create a dedicated SaaS test login in a workspace seeded only with fictional data.
- [ ] Assign the least-privileged SaaS role that can perform the submitted workflow.
- [ ] Use the Meta account or reviewer access mechanism permitted by the current dashboard.
- [ ] Check that account's app role, business role, and asset tasks independently.
- [ ] Verify the actual login flow works with review assets and without developer browser cookies.
- [ ] Store credentials only in the authorized private review fields. Use placeholders in shared documents and recordings.

## 2. Provision Page and Instagram assets

- [ ] Prepare a designated test Facebook Page. Record its label [ ] and assigned tasks [ ].
- [ ] For the Facebook Login publishing flow, link a test Instagram professional account to the test Page. Verify the connection from the app.
- [ ] Confirm the account has the Page and Instagram access needed for each submitted operation.
- [ ] Seed one disposable Page post and one approved test image/caption for publication.
- [ ] For insights, seed content with an available metric and date range. Verify that the endpoint returns data for the intended role.
- [ ] For webhooks, identify a safe, repeatable test action and verify the app shows the expected event.
- [ ] Rehearse publication with a fresh post marker, then reset your test state for the reviewer.

## 3. Verify access outside the developer session

- [ ] Test the review URL and sign-in from a clean browser with no existing sessions.
- [ ] Identify any 2FA, device challenge, region restriction, VPN, or IP allowlist that could interrupt review.
- [ ] Preserve security requirements. Use a dashboard-supported review route if a challenge or restriction prevents access. Document any approved steps.
- [ ] Verify consent and redirects on the submitted build. Confirm access to the privacy policy and deletion instructions.
- [ ] Name asset selections and exact UI labels, and provide expected outcomes for each permission.

## Reviewer instructions to paste into the private form

```text
Build and entry point — [build], https://example.com/review
SaaS login — [see private credential fields]; role — [role]
Meta sign-in/access — [dashboard-authorized method and any expected prompts]
Test workspace — [label]; Page — [label]; linked professional account — [label]
1. Sign in and open [menu > screen].
2. Select [connect button], complete consent, and choose [test asset].
3. For [permission], click [action] and enter [disposable test input].
4. Verify [expected outcome] at [screen or destination]. Video timestamp [MM:SS].
5. Repeat steps 3–4 for [remaining permissions].
Reset/retry — [how to return to the starting state or use a new test marker].
If prompted — [approved access steps or review contact via the private form].
```

## 4. Keep the environment ready through review

- [ ] Assign [owner] to check credentials, roles, domain and certificate validity, asset access, and build uptime through the decision and any resubmission.
- [ ] Keep test data, app mode, redirects, and permissions consistent with the submitted instructions.
- [ ] If access changes, retest from a clean session and update the private instructions promptly.

[Meta App Review](https://developers.facebook.com/docs/app-review/)

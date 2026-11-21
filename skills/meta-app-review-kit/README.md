# Meta App Review kit

## What it is

A skill that walks a coding agent through preparing a Meta App Review submission for a product that publishes to Facebook Pages or Instagram professional accounts.

It is written for the Instagram API with Facebook Login. If your app uses Instagram Login, the permission names and Page-linking rules are different, and the skill tells you to confirm that first. Meta changes requirements often, so the workflow also tells you to check the current dashboard and documentation for your app, use case, and API version before every submission.

## Who it's for

Teams shipping a feature that needs to publish to a customer's Facebook Page or Instagram professional account, including teams that are scoping permissions, recording reviewer evidence, setting up test access, or responding to a rejection.

## What you get

- A pre-flight checklist covering app settings, Business Verification, privacy policy, data deletion, and test assets
- A map of common publishing permissions to shipped, reviewer-visible features
- Templates for permission justifications, screencast recording, and reviewer test setup
- Notes on privacy and data use, plus a guide to common rejection reasons and concrete fixes

The skill does not submit the review for you, and it does not change Meta's decision.

## Quick start

```sh
npx skills add nextctl/skills --skill meta-app-review-kit
```

Then ask your agent to prepare a Meta App Review submission for your Facebook Page and Instagram publishing features. Have your current app settings, the permissions you think you need, and a test Page with a linked Instagram professional account ready.

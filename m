Return-Path: <linux-rtc+bounces-6446-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDrLHXiR8GlvVAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6446-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 12:52:40 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30D482FB8
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 12:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E69F030275ED
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Apr 2026 10:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6933E3FF8A6;
	Tue, 28 Apr 2026 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gB8fmX51"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6213FF89E;
	Tue, 28 Apr 2026 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372939; cv=none; b=V2szyYv3v/iJVD+whniUXJ3bzEtsTQ58hKckqsTSx2jFxWV40q8Ed+XNpB031YVFhjpfsWbUOgUFqunUahROzrfYmpP3FL03/BQ1KEwPUw0okBlOKQo6V3bLj8NgkO5o91up35t9bJD8jY4OPqYec+yrFPyAbDJYzynswz3n0S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372939; c=relaxed/simple;
	bh=kPur6jWe6BvdHYe0RM6/hM1TWbrq+uMmPOxcVVn7tU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HizMNN8eFDt63VRZQiHTvHu2/PepbXL81MTlSVXnte4hEIZXHe+cLMqp/Jg2xp2TCp1vkWrBT32Vowm1nurs5Pr8IoEMre/3tEzYN1aSlrUTp7h6cDgBE6PvQHK4tSAlSNNYEFCzQeLchqyzp3fao0Wva3s5V4IW0EdvqiUuihk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gB8fmX51; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6877DC2BCC7;
	Tue, 28 Apr 2026 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372938;
	bh=kPur6jWe6BvdHYe0RM6/hM1TWbrq+uMmPOxcVVn7tU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gB8fmX51C8i5Ld1o9Znvh0MfxonevAAxXjt1pNUB3xl/GGspzEhc1z27L/POXfn+9
	 2ARwlrv4Zf1lYOiWMji1RyKduiTD6nH+KsX5HWc55WPmFDZpsHlCo9bmLtkfCymH7I
	 KpbzuSq/WLe0rc8rcFziU6kooIi6rjgCyGNkOtcaL+C3Zi9ZKUVUW/Btht+XXMmD0G
	 u9/MC9xyz17RWZuaiNQ2TWBo1cxy+5jdlsVeKMakvIdQvdkMoYY3mX+TNutn3k/zH/
	 Blnc4AhsFvci2EAiJKYVdigaD9leMIF422NdfVI63e5mKDpPzJwAB892eKwOGmvEHW
	 VGzk6a+toOF5g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	a.zummo@towertech.it,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.6] dt-bindings: rtc: microcrystal,rv3028: Allow to specify vdd-supply
Date: Tue, 28 Apr 2026 06:40:43 -0400
Message-ID: <20260428104133.2858589-32-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428104133.2858589-1-sashal@kernel.org>
References: <20260428104133.2858589-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1E30D482FB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-6446-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:email]

From: Frieder Schrempf <frieder.schrempf@kontron.de>

[ Upstream commit 10663044bee592ba049a2aa37f4431fbdf93b739 ]

In case the VDD supply voltage regulator of the RTC needs to be
specified explicitly, allow to set vdd-supply.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://patch.msgid.link/20260309085749.25747-2-frieder@fris.de
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Decision Summary
Backport this **with the companion DTS fix**. By itself it is a schema-
only change, but the mailing-list history verifies it was added because
the runtime DTS fix for Kontron i.MX8MP OSM RTC boot hangs was dropped
due to `dtb_check` warning: `'vdd-supply' is not allowed`. This patch is
a 2-line DT binding addition for existing hardware, reviewed by a DT
maintainer, and has essentially no runtime regression risk.

## Phase Walkthrough
1.1 Record: Subsystem `dt-bindings: rtc: microcrystal,rv3028`; action
verb `Allow`; intent is to permit `vdd-supply` in the RV3028 RTC
binding.

1.2 Record: Tags found: `Signed-off-by: Frieder Schrempf`, `Reviewed-by:
Krzysztof Kozlowski`, `Link:
https://patch.msgid.link/20260309085749.25747-2-frieder@fris.de`,
`Signed-off-by: Alexandre Belloni`. No `Fixes`, `Reported-by`, `Tested-
by`, or `Cc: stable`.

1.3 Record: Commit body says only that explicit VDD regulator
specification should be allowed. The series and v2 discussion verify the
concrete issue: the companion DTS fix adds `vdd-supply` so fw_devlink
orders PMIC before RTC, avoiding sporadic boot hangs.

1.4 Record: Hidden bug-fix context exists, but not in this patch alone.
This patch fixes a DT schema gap that blocked a real DTS boot-hang fix.

2.1 Record: One file changed,
`Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml`; 2
lines added; no functions; single-file schema change.

2.2 Record: Before, `unevaluatedProperties: false` rejected `vdd-
supply`. After, `vdd-supply: true` permits the regulator phandle.

2.3 Record: Bug category is DT schema/build-validation fix and
prerequisite for hardware dependency expression. Not memory safety,
locking, or runtime driver logic.

2.4 Record: Fix is obviously correct and minimal. Regression risk is
very low because it only relaxes schema validation for one standard
supply property.

3.1 Record: Blame shows the binding file was introduced by
`c690048ed59b5` in `v6.3-rc1`; `#clock-cells` was added by
`4015580e983da` in `v6.12-rc1`.

3.2 Record: Candidate has no `Fixes:` tag. Companion DTS patch fixes
`946ab10e3f40f`, introduced in `v6.13-rc1`.

3.3 Record: Recent binding history only shows the file creation and
`#clock-cells` addition. The patch is standalone, but its stable value
is tied to the companion DTS fix.

3.4 Record: Author has multiple Kontron DTS fixes in local history; not
the RTC maintainer, but the patch was reviewed by Krzysztof Kozlowski
and applied by Alexandre Belloni.

3.5 Record: No code dependencies. For meaningful runtime benefit,
backport with `arm64: dts: imx8mp-kontron: Fix boot order for PMIC and
RTC`.

4.1 Record: `b4 dig -c 10663044bee5` found the original v3 patch at the
supplied lore/msgid URL. `b4 dig -a` found v1 and v3 series history; v3
added the missing binding patch.

4.2 Record: `b4 dig -w` showed relevant DT/RTC maintainers and lists
were included.

4.3 Record: v2 discussion verified Frank Li dropped the DTS fix because
it caused `dtb_check` warning: `'vdd-supply' is not allowed`; Frieder
replied that v3 adds the binding patch.

4.4 Record: Series context is 2 patches in v3: this binding patch and
the DTS boot-order fix. Binding was applied by Alexandre Belloni; DTS
fix later applied by Frank Li.

4.5 Record: I found no stable-specific discussion or explicit stable
nomination.

5.1 Record: No functions modified.

5.2 Record: No callers. Semantic impact is DT schema validation.

5.3 Record: Verified runtime relevance through OF supplier parsing:
`drivers/of/property.c` has `DEFINE_SUFFIX_PROP(regulators, "-supply",
NULL)` and includes `parse_regulators` in supplier bindings.

5.4 Record: Companion DTS path is reachable during device probing on
Kontron i.MX8MP OSM. PMIC driver enables the I2C level translator when
`nxp,i2c-lt-enable` is present; RTC node sits on the same I2C bus.

5.5 Record: Similar `vdd-supply: true` properties exist in many
bindings, including another RTC binding, `amlogic,meson6-rtc.yaml`.

6.1 Record: Binding exists from `v6.3+`; Kontron OSM DTS exists from
`v6.13+`. `v6.1` lacks the binding file.

6.2 Record: `git apply --check` succeeded on existing `v6.6` and `v6.12`
worktrees and current `v7.0.1`; `v6.1` fails because the file does not
exist. A separate v6.19 temporary worktree attempt ran out of space
before testing, so direct v6.19 apply was not verified.

6.3 Record: No related stable fix already found in local history.

7.1 Record: Subsystem is DT binding documentation for RTC hardware;
criticality is peripheral, but it supports a board boot-hang fix.

7.2 Record: Subsystem/file is low churn: only binding creation and
`#clock-cells` addition before this patch.

8.1 Record: Affected population is users/builders of RV3028 DTs,
especially Kontron i.MX8MP OSM users when paired with the DTS fix.

8.2 Record: Trigger for the companion bug is boot/probe ordering where
RTC is accessed before PMIC enables the I2C level shifter. Trigger for
this patch alone is DT schema validation with `vdd-supply`.

8.3 Record: Candidate alone fixes a build/validation warning. Companion
failure mode is sporadic boot hang, which is critical for affected
hardware.

8.4 Record: Benefit is high when paired with the companion DTS fix, low
if isolated. Risk is very low: two schema lines, no runtime code.

9.1 Record: For backporting: tiny, reviewed, applies cleanly to relevant
trees, enables a verified hardware boot-hang fix, standard DT supply
property. Against: schema-only and no standalone runtime fix.

9.2 Record: Stable rules: obviously correct yes; real user bug
indirectly yes via companion DTS fix; important issue yes when paired,
boot hang; small yes; no runtime API/new driver yes; applies to
v6.6/v6.12/current, not v6.1.

9.3 Record: Exception category applies: DT binding addition for existing
hardware / build-validation support.

9.4 Record: Decision is YES, but it should be treated as a
prerequisite/companion to the DTS boot-order fix, not as a standalone
runtime fix.

## Verification
- Phase 1: Parsed supplied commit message and local b4 mbox; confirmed
  tags and absence of `Fixes`/stable tags.
- Phase 2: Read diff and current binding file; confirmed only `vdd-
  supply: true` is added.
- Phase 3: Used `git blame`, `git describe --contains`, and file
  history; confirmed binding introduction in `v6.3-rc1`, `#clock-cells`
  in `v6.12-rc1`, board DTS in `v6.13-rc1`.
- Phase 4: Used `b4 am`, `b4 mbox`, `b4 diff`, `b4 dig -a`, and `b4 dig
  -w`; verified v2 rejection due dtb_check warning and v3 addition of
  this binding patch.
- Phase 5: Searched/read OF supplier parsing and PCA9450 code; verified
  `*-supply` creates supplier links and PMIC `nxp,i2c-lt-enable` enables
  the I2C level translator.
- Phase 6: Checked stable tags/worktrees; apply check passes on v6.6,
  v6.12, and current tree; v6.1 lacks the file.
- Phase 7/8: Verified affected paths in Kontron DTS and binding; no
  runtime code touched.
- Unverified: Direct apply check on v6.19 due temporary worktree
  checkout failure, though v6.19 file contents were inspected and match
  the expected context.

**YES**

 Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
index cda8ad7c12037..2ea3b40419530 100644
--- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
+++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
@@ -32,6 +32,8 @@ properties:
       - 9000
       - 15000
 
+  vdd-supply: true
+
 required:
   - compatible
   - reg
-- 
2.53.0



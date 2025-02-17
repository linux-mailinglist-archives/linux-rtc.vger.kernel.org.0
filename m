Return-Path: <linux-rtc+bounces-3216-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D82EAA38332
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 13:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD5CE1884D71
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 12:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E0021B190;
	Mon, 17 Feb 2025 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sh6F76jQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C06218842;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796104; cv=none; b=MdtWt8lVSrLbmMm5LZK4rRPimUAk4BaI5sVPn1NCTOs+NQZmziYIr31C3D/FZb9Z9/aG71fMYyJroHgNCTE+vXno6zX5D9k6qxF+xf/49yy6wM0uRRaoWzo12w9PIVVry0NHUeor48DfX1gXrbVkWe8LMDatchnzbnz1acRU+aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796104; c=relaxed/simple;
	bh=PTSy1ip0l95HNNQQE+rcttEDB0KFrDuEV+630qcL2IM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HllivKs3RILMTCPI7X5Yusz0cgoahYHBVjsN2KaOlMOgbeBGA06TboQbel35i22A4Q1PGeSO5Z+kquyW/bwvC9QgYmEligKxYK4Ge+IwL0hwfVmtsUq8ifbK3d6BBi24ymWqpT7n9lKbCjmAHtieENHODidw3F2YFpc5GyfWM3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sh6F76jQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 339C3C4CED1;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739796104;
	bh=PTSy1ip0l95HNNQQE+rcttEDB0KFrDuEV+630qcL2IM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Sh6F76jQz7E1gO+yNlIQ6DDxuf9whY05qkY8fjCPWO99FgrecMh6KarVSka6B12wH
	 +GwAWRa5NycHMmHv6b5spvRBGtT8lZKi9udOaoIfOyUDILIjAx4DaOdVWGtAYpGK8R
	 BUOZmT2Ho0P3cvvTS3gYuS016ENmSmYg4cGDS9gwrK7XcryJGRTZFSYbd9c161BTS8
	 h2ZUkAIkjIR9E7tjMGL5lOhqDkgELJ9zu5w5ry8VqsZ6CCHVPJ0KEs+uIvPsH8I6Nt
	 DY6uxXbE3cUgn9QGv0J88tzpti6r/z7KH+LRgRNt1m2yA56kI+qCuN72bdFDcAlCK0
	 PinA5vLFGvihQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E95C021A9;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Subject: [PATCH RESEND v5 0/2] Add support for MAX31331 RTC
Date: Mon, 17 Feb 2025 18:17:15 +0530
Message-Id: <20250217-add_support_max31331_fix_8-v1-0-16ebcfc02336@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANMvs2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nz3cSUlPji0oKC/KKS+NzECmNDY2PD+LTMingL3UTLxDQTc4MU0+R
 EYyWgAQVFqUAJsOHRSkGuwa5+LgplpkqxtbUAZvihj3cAAAA=
X-Change-ID: 20250217-add_support_max31331_fix_8-a9af470d5ca3
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 =?utf-8?q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739796453; l=1888;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=PTSy1ip0l95HNNQQE+rcttEDB0KFrDuEV+630qcL2IM=;
 b=GEPLWHzuMBYTO6EresIlfpo7HAopxkDf6L5smseqo1eSfTDrJKoO9S/ltULxyNfxkr6IJzyks
 x2FXYLOP0zYDemNc9ckp+qoqoj65TD4aTngiFvOU/ZoI1tVIusTxSaY
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

This patch series introduces support for the Maxim MAX31331 RTC.
It includes:

1. Device Tree bindings documentation for MAX31331.
2. The driver implementation for the MAX31331 RTC.

---
Resend v5:
- [PATCH RESEND v5 2/2]: Added id as a member of struct chip_desc in v4 [Nuno Sa], the patch requires a review. 
- Rebase v6.14-rc3                                    
- Link to v5: https://lore.kernel.org/r/20250131-add_support_max31331_fix_7-v1-0-d29d5de3d562@analog.com

Changes in v5:
- Removed the commit description stating max31331 and max31335 are compatible.
- Rebase v6.13
- Link to v4: https://lore.kernel.org/all/20250119-add_support_max31331_fix_5-v1-0-73f7be59f022@analog.com/
---
Changes in v4:
- Reverted the I2C address change for MAX31335 RTC (0x69) and removed it from the property register;
  will include it in a separate fix.
- Added id as a member of struct chip_desc [Nuno Sa]
- Rebase on v6.13-rc7
- Link to v3: https://lore.kernel.org/all/20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com/
---
Changes in v3:
- Added missing spaces in driver code
- Removed binding for checking address
- Rebase on v6.13-rc6
- Link to v2: https://lore.kernel.org/all/20250103-add_support_max31331_fix-v1-0-8ff3c7a81734@analog.com/
---

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>

---
PavithraUdayakumar-adi (2):
      dt-bindings: rtc: max31335: Add max31331 support
      rtc: max31335: Add driver support for max31331

 .../devicetree/bindings/rtc/adi,max31335.yaml      |   4 +-
 drivers/rtc/rtc-max31335.c                         | 165 +++++++++++++++------
 2 files changed, 125 insertions(+), 44 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250217-add_support_max31331_fix_8-a9af470d5ca3

Best regards,
-- 
PavithraUdayakumar-adi <pavithra.u@analog.com>




Return-Path: <linux-rtc+bounces-1783-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9943B965A77
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 10:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 009CEB23116
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 08:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD8516DC21;
	Fri, 30 Aug 2024 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBpYtFLO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F81616726E;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007005; cv=none; b=lZfeCbg8HuiFAtxk5SyldPmrVJ1S6wX6Ed3sTmnFltwCCSKkkURhQYkJAU7dzFWCIXwXkBi6xB4MqWEKWwHJKKTdJD76xwTvAUE7hSuBjs0uL1r8hs6/NmXhcCXP9KYLKQU9ycz1+9+Gj3CQ8K7iMLhH5O70pXDx44QhG8Nb8fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007005; c=relaxed/simple;
	bh=rJyYG8x4HwXbnbnZuaSHxe8M9ayrEbzJjZvJ9a22QKk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sg97uh0B70RWc/bhKe3X2DCjHbxbCyMvudNOMdXqlRTEsXLSm/DEpigzHOi57BvcZ4bxgp1fBbr8rAnGvtmMommTrTjKuT0yXQQt+blte0+ifTynZhP3rD0dVJsdMX5agaAWUcAxJ5ts3142bJOLFT9wqqJdCz7mFHetwc9tTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBpYtFLO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95F05C4CEC4;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725007004;
	bh=rJyYG8x4HwXbnbnZuaSHxe8M9ayrEbzJjZvJ9a22QKk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CBpYtFLOHup2miwNHdSeQcRWqntedYCXAOaVx70Elra2RKVzeuNtd1xYTsoR4MpGs
	 LCwq7pRd/QjLrYV3ybuoKYBOIHjn7N2amqmjqhVhbLFi3ZfYiKDL2dn7/vFN5c2tHE
	 lM+Fx5c2NfpI21PrrulUOW4dfjwdqVDsvMfKd/vfvE961chqXXECqzyOGt/WqSrQwm
	 OUl2p//w1N/5xKFzG/FZK6dGOUw9E1TwdlFLZ3UqUv1kcQTYIAynQG0BlPdMiAMQE2
	 K3bOeW0m7FPkz6mm+UWGX8jCxsgvu+tnqgdThpC1AF3jFAJimOCbamxuaqRBIemx3i
	 rgFB5xvRgR4Gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866E7C83F0B;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Subject: [PATCH v7 0/3] Add support for the DFRobot SD2405AL I2C RTC
 Module.
Date: Fri, 30 Aug 2024 10:36:38 +0200
Message-Id: <20240830-rtc-sd2405al-v7-0-2f7102621b1d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJaE0WYC/3XPzWpDIRCG4VsJrmvR0dFjV72P0sX4lwhJTtFwa
 Ann3muyqQhdfsLzMt5ZS7Wkxt4Od1bTVlpZr33YlwMLJ7oeEy+xbwYCtDDC8noLvMU+kM6chNN
 WWRusiqyTr5py+X7mPj77PpV2W+vPs77Jx+s/oU1yyVGhszJZWox5P16onF/DemGP0AYDlm7C0
 LFyPhE4H4FwxmrAICasOjYY0XshKaOYsR6xnrDuGDz4YNFlt+QZ4x9eYJkwcsFdUnnJhImMn7E
 Z8fxn07HOPifoVxHZEe/7/gvVAk6G2QEAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 =?utf-8?q?Cs=C3=B3k=C3=A1s_Bence?= <csokas.bence@prolan.hu>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725007003; l=2108;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=rJyYG8x4HwXbnbnZuaSHxe8M9ayrEbzJjZvJ9a22QKk=;
 b=525FC78kRnPXjhZWL8drpjIfoqNadR4Cf3V4Ssrmy/bjLZ93lwqRhUvSaBa20AAd+gWUUWfap
 TnqK2kEbdlmB12i+lMlcHpMVSD18qhANAGOxWNhy0JlGon2UPmLlDqk
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

This patch series adds a driver and the documentation for the SD2405AL I2C RTC.

Signed-off-by: Tóth János <gomba007@gmail.com>
---
Changes in v7:
- Split the documentation patch.
- Add tags.
- Link to v6: https://lore.kernel.org/r/20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com

Changes in v6:
- Add missing To-s and Cc-s.
- Rebased onto v6.11-rc5
- Link to v5: https://lore.kernel.org/r/20240828-rtc-sd2405al-v5-0-9e3f8fa5ea6b@gmail.com

Changes in v5:
- Rework based on Alexandre Belloni's suggestions.
- Drop explicit initialization of struct i2c_device_id::driver_data.
- Add documentation.
- Link to v4: https://lore.kernel.org/r/20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com

Changes in v4:
- Implement more comprehensive data validation.
- Inline some temporary variables.
- Link to v3: https://lore.kernel.org/r/20240620-rtc-sd2405al-v3-1-65d5bb01af50@gmail.com

Changes in v3:
- #define-s of registers are reworked.
- Minor revisions based on the reviewer's suggestions.
- Link to v2: https://lore.kernel.org/r/20240619-rtc-sd2405al-v2-1-39bea29bd2a5@gmail.com

Changes in v2:
- Refactored based on reviewer's suggestions.
- I couldn't get the I2C IRQ to work on Raspberry Pi 4, so alarm is
  skipped.
- Link to v1: https://lore.kernel.org/r/20240607-rtc-sd2405al-v1-1-535971e7a866@gmail.com

---
Tóth János (3):
      drivers: rtc: Add driver for SD2405AL.
      dt-bindings: rtc: Add support for SD2405AL.
      dt-bindings: vendor-prefixes: Add DFRobot.

 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   6 +
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-sd2405al.c                         | 227 +++++++++++++++++++++
 6 files changed, 248 insertions(+)
---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240607-rtc-sd2405al-a0947377c73d

Best regards,
-- 
Tóth János <gomba007@gmail.com>




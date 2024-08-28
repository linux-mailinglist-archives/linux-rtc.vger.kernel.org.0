Return-Path: <linux-rtc+bounces-1751-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D820996223F
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 10:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CBE41F24A74
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 08:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA8B15B99E;
	Wed, 28 Aug 2024 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjUTzqRh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445E15B119;
	Wed, 28 Aug 2024 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724833403; cv=none; b=fLUt+585udkOYNXftMyNG3snU86ml/O/MtW0ciP8wNbl1SLPo8WnGQHUJj8W5uOPnym0Faw74/rvoJbaCMZhhPF8kXe00B1RSMPCBI5/lgp071jQ3tAx+U6/DMLBpuG+/y02f4FT5VK+o8X9/s+8SzTItrbxIncQlWuzkPeeR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724833403; c=relaxed/simple;
	bh=YOUO7QM/mNFv4GCdn4obTvUaMSnLjQC1ZvasM2TWqgY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uwqwQDNh5MNGfP8GdisT6b3m/c0qDaqZI2VTQJzs2Qyjq7qEXyPlp+nk7ELBHiTJzBCQ2EwXJc2pJ4rhN6/Ta25TWsO+HuaR6e2MOPAeqNgOdt2Yv9H/bgD8H9CNDr3yROE/t0v0EXweyVdhzkndoFpkMH6q+MViRP5wvV2WNhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjUTzqRh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61EFCC4AF67;
	Wed, 28 Aug 2024 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724833403;
	bh=YOUO7QM/mNFv4GCdn4obTvUaMSnLjQC1ZvasM2TWqgY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FjUTzqRhpQdka66X1I341qTwepKG4REsrhv7twZcek0T/DI4W0GUsPBz5qS68Cmjg
	 d5I4stYHMkaeT7Xo4K9/a1mdxswBUqgADrWV9fL3foEpfw23HqsJatbyAJOaxc1NIw
	 OYxoR3EVJ23cI2FkrOPnWnfOkW5Yws8Wb5c/Vfzz4HB9cPIcT+sKp2i/gqNN4ysXkJ
	 owlbbUe+BxoOguPDOvrRpyNjdXNSn/5qsF/lmtwhg3k/vAnCMZfJB/L+XzjHoraVJj
	 q+NYXCoh9XdShZPN3S6up8hPz5xHWAA8QJIr3OZ2w2+D+stcWxGzoGEDSabfOA0Fv6
	 DEuN1G7e1dXMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD17C54748;
	Wed, 28 Aug 2024 08:23:23 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] Add support for the DFRobot SD2405AL I2C RTC
 Module.
Date: Wed, 28 Aug 2024 10:22:53 +0200
Message-Id: <20240828-rtc-sd2405al-v5-0-9e3f8fa5ea6b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF3ezmYC/3XMSwrCMBSF4a1IxkaSm9zGOHIf4iCvtgG1kpSil
 O7dtKMScPgf+M5MckgxZHI5zCSFKeY4vErg8UBcb15doNGXJsBAsoYpmkZHsy+B5kEN01IJpZw
 SnhTyTqGNn+3udi/dxzwO6bu9T3xd/xxNnHKKArXiQZlz01y7p4mPkxueZD2aYIe5rjAULLQNB
 rT1YLDGYoeBVVgU3KBHaxk3LbIayz2WFZYFgwXrFOpWn9s9XpblBzh3HTxfAQAA
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 csokas.bence@prolan.hu, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724833402; l=1737;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=YOUO7QM/mNFv4GCdn4obTvUaMSnLjQC1ZvasM2TWqgY=;
 b=wJaZc3Hdr/W8uvJV1RFhkf1rN1QdEsmIgtL/RD2TYNpPiih2C9lEqle1AtjpI+XmpY2OmtMvD
 MD4vyvcusd/CVsUBkoSgf4jkZ3SC5YVI7lIUhDQyYTQf7x+aBA7ss99
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

This patch series adds a driver and the documentation for the SD2405AL I2C RTC.

Signed-off-by: Tóth János <gomba007@gmail.com>
---
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
Tóth János (2):
      drivers: rtc: Add driver for SD2405AL.
      dt-bindings: rtc: Add support for SD2405AL.

 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   6 +
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-sd2405al.c                         | 227 +++++++++++++++++++++
 6 files changed, 248 insertions(+)
---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240607-rtc-sd2405al-a0947377c73d

Best regards,
-- 
Tóth János <gomba007@gmail.com>




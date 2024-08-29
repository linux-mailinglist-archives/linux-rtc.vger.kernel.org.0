Return-Path: <linux-rtc+bounces-1767-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E3964305
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 13:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 698D41F21D57
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 11:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEC5191F91;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Orc+pkkG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C427618EFC0;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931118; cv=none; b=mURe1N4xEvm76nPrIRqARFOVmBFbMAC23rg83T8k2gyjxp2tSZdu8NOd7Ld7uD0m6nUVIDciqDs/sUMShCuDwa9sOPincw7QynUaHWhkWpRsZiBF5I0gtPig++bfvgKmhMmDJsOvVLIseLToVRYuRyPjgS3TSjTi7D2WpIDzhAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931118; c=relaxed/simple;
	bh=uYxpjHp9Ljf845Tzrl395BhPRS0C3P+4ZbcnfLa0518=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hpTjdBVYNY2OSSL82V/BaCi5KE2cCT23G1nvL/wZptZMMRgBr3ZTmIMekYtlauTx8sMOYVZPdxtgRaU6NetnSOavmen7L0sp4i4oDsrs9iMPwkrAtpvXx6yUkET6X6Ul4K0eza3jlb1sRfcs/0RZdq3RFLjYunRrJIIdIIRyaaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Orc+pkkG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 488D7C4CEC7;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724931118;
	bh=uYxpjHp9Ljf845Tzrl395BhPRS0C3P+4ZbcnfLa0518=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Orc+pkkGEjQVwBspcloJbSE3I6asjeuT9/p80tBbMmEJwDdJHtC7++im0h5dK6kPa
	 hb/fyCGrX7ifBUIjM1zMtLqDk/nEcleppxxQ0qzhVa+ehjWqqJgouRHOPTgu7SuSQF
	 0oMV1WDA+0UZwPW/R27koBajKUZ9noO3Uz5uyJ/2Qvaaj8STaa/m65EQQEIOp3ORJI
	 ljfW/GmkHe35plUxW66GdFJuuMc1bi9lmFVTXOIZNaa0lovJaCKdvVGOEAGVRVn6Mw
	 6ay/eO/lhZDCxIkpuF2ldKVZUdAgW/agNhcnjXtPm7PsazhpblpW0jqBtVxP5VvXfJ
	 egiMSOMZp5CNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D95CC7EE33;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Subject: [PATCH v6 0/2] Add support for the DFRobot SD2405AL I2C RTC
 Module.
Date: Thu, 29 Aug 2024 13:31:43 +0200
Message-Id: <20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB9c0GYC/3XMy2pDIRSF4VcJjmvRrdtLR32P0sH2lghJTtFwa
 Ann3Wsy6UHo8F/wrTvrudXc2dvhzlpea6/LdYR5ObB4ousx85pGMxCghRGWt1vkPY1AOnMSXlt
 lbbQqsUG+Wi71+3n38Tn6VPttaT/P91U+1n+OVsklR4XeymzJGfN+vFA9v8blwh5HK+yw9BOGg
 ZUPmcCHBIQzVjsMYsJqYIMJQxCSCooZ6z3WE9YDQ4AQLfriXZkx/mEHbsLIBfdZFVcIM5mwx9u
 2/QLvNL/xnAEAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 csokas.bence@prolan.hu, devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724931117; l=2200;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=uYxpjHp9Ljf845Tzrl395BhPRS0C3P+4ZbcnfLa0518=;
 b=+6ciJKwZqbyFv342MwIvlx2S8zq7YDYGcrHQwIIiGxQu6/LipLy0u+BPGryhDAXy1iHaN/h4Y
 nGppAMpYNUgAfpfSdMZ5d4igjME1VmgFu55V0FKDqyWnGUXBQSIrTXr
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

This patch series adds a driver and the documentation for the SD2405AL I2C RTC.

To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: csokas.bence@prolan.hu
Cc: devicetree@vger.kernel.org
Signed-off-by: Tóth János <gomba007@gmail.com>

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
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240607-rtc-sd2405al-a0947377c73d

Best regards,
-- 
Tóth János <gomba007@gmail.com>




Return-Path: <linux-rtc+bounces-2411-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8289B890B
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 03:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2183428302D
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 02:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A0913AA31;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJsTUGGd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866DD126BF9;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730426819; cv=none; b=oVI2xBMDUzCwAzfQvW/LxvTTw/JjpOIsgHkhQ5KIPDakhMGadTY5ebiWdO8LLwSiVAcfBgvCzlx1Q6cGTWA60AZLCq9Yji4yfiNtGe5qp4o8kIXewEtiDLACGqQESbRSD7rvc3twZ8h5iqHDkVK1HlhQ9OaCr/WJOfc+sJQhnRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730426819; c=relaxed/simple;
	bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MJqfRykfPnBg37w5v83s96DEyMuyGkusvEOcl+ejKam/vB6gmCRC8TXJn+kHaZ2QPoYDCchY0eMo7m7XISvqesTADlzAKo2cCYs8H8JSPVxY5UgEiZEACbxuzMSVxEGBdnTiUjVnxf5NjKvkWSe3Uo2EJIikyUY0B3zcb5bC8bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJsTUGGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B9A7C4CEC3;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730426819;
	bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uJsTUGGdvGAFC/ue1WVQ4iFaOP8LD/iC9zBiDnAebPj2s7DQngOzI+E1Lfj4CePUL
	 WI3AM3m7u5aL2liENGaCjlCDR0BmYoY8Is/mbSx09xf0PJU5TgVu+KLqYFbxtx0wsr
	 EGhsTEC31Hz6pldqSszc9IsmBO4+CJCxeSoCC9YJ4fip96vnWHw018w3X423mZrE9T
	 WME4NAtz+c5smY8xmknveYHW5E+oWJdbhxN4iRAfUKmtIeJeXPdv+x1WEGPYewkdtS
	 FUUjQvwqxUIaV0WT3GGQioK24lGmUv5OPUWTe+e1NxpuQa5XeFvVjGUwcDaWhI/MV+
	 DPDVeGr8OWkLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EC2E67496;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RESEND v4 0/3] support for amlogic rtc
Date: Fri, 01 Nov 2024 10:06:46 +0800
Message-Id: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730426817; l=1589;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=g8Fx5TTJzV1MuTCeRPULLGaYpS2ORG7ZcWbYMH2W/Ds=;
 b=L6jDG5I4ppkE3/ogU72kAKSdhg5iKkHL41Adh5bjA13FwGiJHkGApvFLyAI1c0QSHcSAC3jyG
 9nLMw4aoC9yA7LyDm5A4LO/vPzO/bt3+O4KOC8nDVwyRaPKvcPsoS2c
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Keep the same order as as in properties.
- Link to v3: https://lore.kernel.org/r/20240910-rtc-v3-0-1fa077a69a20@amlogic.com

Changes in v3:
- Perfect the binding description and rename binding.
- Using dev_err_probe function correctly, and modify commit message.
- Change placement about MAINTAINERS.
- Link to v2: https://lore.kernel.org/r/20240903-rtc-v2-0-05da5755b8d9@amlogic.com

Changes in v2:
- Modify bindings clock name and perfect the example.
- Fix some bug in driver, and use dev_err_probe instead of dev_err in probe process.
- Use RTC API to handle calibration.
- Remove unused func and rename driver file name.
- Link to v1: https://lore.kernel.org/r/20240823-rtc-v1-0-6f70381da283@amlogic.com

---
Yiting Deng (3):
      dt-bindings: rtc: Add Amlogic A4 and A5 RTC
      rtc: support for the Amlogic on-chip RTC
      MAINTAINERS: Add an entry for Amlogic RTC driver

 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    |  63 +++
 MAINTAINERS                                        |   8 +
 drivers/rtc/Kconfig                                |  12 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-amlogic-a4.c                       | 473 +++++++++++++++++++++
 5 files changed, 557 insertions(+)
---
base-commit: 658b3fec5fc0ef3c016c4a7eedac1a5f3b8c0151
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>




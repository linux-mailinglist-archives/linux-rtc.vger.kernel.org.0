Return-Path: <linux-rtc+bounces-2525-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B17B9C4D2E
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 04:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45227B28B7B
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 03:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DAC208961;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwMYJLrd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D792076DF;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731381018; cv=none; b=qL4capkiG04x03fGdknw5rVGD3OYsi3KB10WuDVXiFNqpMo1FmMB6mzzM3FU9ARqpX4bKQa6JegJZ+Th/I9SgFRpF/83mQXzO3ATzMPQlAKvLxuNd1sR4u8R9Yb5yOKpoLLkFdckfGKrz8xyGV1Xaj0wFBeIeWDthAjpAI2hcN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731381018; c=relaxed/simple;
	bh=8+WX5Wakdt4EUxqtzq8N3biWqhl54KfXtJQv1VX3/4Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LC7JYWjXfghZvc6/3PUgithKlnUE7sLj+e3Ordhty8ncMGmDQzRK/W76/8yKItOljt0RLj8uV2D4y5//w+hI+sn6YHoEaNsi/Aq0NTTMNpxCzQRlKznDTnnDrQcb+a56UIAgy8kDMp4dOb1Y92gpDulxFe7LeEuZ0m2xHuGmUUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwMYJLrd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05DC6C4CED7;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731381018;
	bh=8+WX5Wakdt4EUxqtzq8N3biWqhl54KfXtJQv1VX3/4Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pwMYJLrd4Akzm1D9Ut5bVqBJD77ebtSaHLDxTZsRIdVkfIxm2VsZPZuA0udYIDCiE
	 ktSMWojSj7AHdJgHm6Buc+xHu+o6Dh3kFNxStRn9jXAfcGLTAMLHaOn+5as9+kIWLS
	 BBub7veW4AqBCGWyM5xVjVJDO7hITRZC9IVV8ZCeekAqn9HAZygHeSrXvJjw61GhNb
	 3CPhuxp/8Uu6E7uap6gH46pnu4gf0T2RyOdADV2EZXhleQ+gv9FtE72XLAsKveuSbb
	 YUF8dcAjXzSiyAY8b8VoSNiM6BtnQvA5WlnFmfZ1WRu4NK5bO6oxT8rONHeuTnIymb
	 yzkZbaHIgBfLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E723ED41D48;
	Tue, 12 Nov 2024 03:10:17 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v6 0/3] support for amlogic rtc
Date: Tue, 12 Nov 2024 11:10:13 +0800
Message-Id: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbHMmcC/2XQTY7CMAwF4KugrCcj20mahBX3GLFwkxQiDRSlq
 BqEevdJAfGjLp/l78nyVQyp5DSI9eoqShrzkPtjDc3XSoQ9H3dJ5lizICANjpQs5yCRbIgOPTE
 qUTdPJXX579bys615n4dzXy630hHn6acfUYJsOgvKYWRyasOH336Xw3foD2JuGOmlPDwUVQUms
 rHGtC76pVJvCuGuVFXYMVjLjWeCpdJvih5KV+WRk+lanVQ0S2WeChHcXZn5QvTa1gdZ69pPNU3
 TP2F2bv9wAQAA
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731381015; l=1965;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=8+WX5Wakdt4EUxqtzq8N3biWqhl54KfXtJQv1VX3/4Y=;
 b=TANdTkttCYRYPNirhoyhhJut9zf+qam2b1+ZjxF92JQSH8rIvnasgBpPHoyIZ/AF/oGS8QHw2
 i8JZX2q3orfCBqLQ8lP46a687tVDlH0RIl7c0nLfNOycuwips6tZZvm
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v6:
- Solve compilation problems and dropped disable rtc action in remove funcion.
- Link to v5: https://lore.kernel.org/r/20241108-rtc-v5-0-0194727c778b@amlogic.com

Changes in v5:
- Some formatting adjustments and minor fixes were made based on Christophe's suggestions.
- Link to v4: https://lore.kernel.org/r/20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com

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
 drivers/rtc/rtc-amlogic-a4.c                       | 474 +++++++++++++++++++++
 5 files changed, 558 insertions(+)
---
base-commit: 8a2c49e0fd92e6760636bcfbf11e11d9ddd61cf9
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>




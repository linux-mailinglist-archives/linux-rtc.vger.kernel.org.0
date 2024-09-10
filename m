Return-Path: <linux-rtc+bounces-1915-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718929732A4
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 12:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 385ADB222D5
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 10:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBDA192B71;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNiEokPB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934BC18B46D;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963260; cv=none; b=L9cC1gLHmUm3rqpDPFovw7X0d0ntuGIxpkX+Yfu69Vv43Z1sjbZTKDo6TElWlaugPcDm5riM28aLo/1ikuFI8Qss4wOwQxDNmVE1fpR7m5B8ERnSaoEFmaIraVya5F2KtewD+S2jmMPrYdtfXaFX07AwK3Jb4fwzR+ehNVpczhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963260; c=relaxed/simple;
	bh=Sobyjbsg00DCrwSWH1kDJBeyO+Pp/IjZIWpKWS5D8QU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QxjFP7c8z8nYubsuftV8ZrpYN44Jq+nIxE/HaG6fZ+BsCBmsgCSym0o1m1WjGXy8Hti7v9wSw2iCPUuJQscWi8xXGWKCy++zv5CXFRh9POXHTrewxYtUKysNWxI7a3d81tMsufLoLukCi2/92a8Dc49upqau/deMXkZtsUH/OyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNiEokPB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5501BC4CEC6;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725963260;
	bh=Sobyjbsg00DCrwSWH1kDJBeyO+Pp/IjZIWpKWS5D8QU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gNiEokPB1GfCvgsP+dtdrI9AXIAplYElUkaGPq2xyt3p9qhu9ieGAMXJNX+2lsCiz
	 E0Jrm66SzIGR2NkoRW4PBBsGDqcC4Xz1Kx/blfdwxV0hcrjakdsOM+IAmBHsmWMAdj
	 q7YVdcQhHvYwpIjPUPKPsofK/7KIo0cYkH7TvJ68siydasVs4VXhMZtTCPj0i1UYDh
	 YGRJ1CP2lfVQ+u5Pw0I7dK0i/51tUIgiS1GpfuF+CKAZKPifiHbr2EwUm+naYbvn0f
	 s0ZnpUITFdaWcWl6ZqaSyyBBK9V7a2hVF8ctQ0lsGi+0pigb8Ff8gL1RuaYdN9Fu2g
	 ziZ9AdPQesXYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EF1EB64DE;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] support for amlogic rtc
Date: Tue, 10 Sep 2024 18:14:17 +0800
Message-Id: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkb4GYC/1WMwQrCMBAFf6Xs2UiyMTb15H+Ih5ik7YJtJClBK
 f130yJIj/N4MzMkH8knuFQzRJ8pURgLyEMFtjdj5xm5woAcT1yjZHGyTGBtnRYNGiGhPF/Rt/T
 eKrd74Z7SFOJni2axrns/C8bZua251MIZ1PJqhmfoyB5tGGAtZPxbDf9ZWCyunFG1Ug/tmr21L
 MsXGCJDoc4AAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725963258; l=1443;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Sobyjbsg00DCrwSWH1kDJBeyO+Pp/IjZIWpKWS5D8QU=;
 b=ILLG7jZLh8LNWnmrhMqwMAvdN+HP2yahKKY/veJHkXQAAOKdiZJlBOS5SJMlyxBL9twv2+Ndj
 dqTItQ3WhvgBrs2gKuB/VQnMdNCVPBiNXVGkEJrqfJ3bd65biYS47hh
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
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




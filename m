Return-Path: <linux-rtc+bounces-1710-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FEC95C914
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 11:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D8C928422B
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 09:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE74B14B095;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7gLxvXO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90C114A0AD;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404787; cv=none; b=sSMBSqAKvcf9edNyP38EnfiJeCTWfFeKLupGbKC3GAhrQlk4RXh7BKj2RLNrH1hSTxn7FbLYwLCGWM+LnoTKf4m365ituw2fIM6dPxQeSW3sDeAPZ/kW41Ck2QZ6xSyM28jSnofVLPEy14P30f7B6YKgoruSMeZ8iedc3OJKN4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404787; c=relaxed/simple;
	bh=KhN+NQf/vdSEEkKAVXu1CtJtcHLdjhi4HZJpa/pUdy4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZRkZQiTcpuKREKWZD18lhN2aMb9CL+5m+x7rwGskN4Zm1U/TEmSN/eo3C85kkAwbPOs//WPnW0Cp0BPn1cbF1k0YGxcrT2FF1WTGKavSRqv1FgQMBiK6xDRSPivvJWirH0pccG1lE8T65+Xb0uwaHOXLj9mR46tzkZYbNf6J6a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7gLxvXO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48572C32786;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724404787;
	bh=KhN+NQf/vdSEEkKAVXu1CtJtcHLdjhi4HZJpa/pUdy4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=J7gLxvXOn4aeIF7NFISf1/JDSUeB1BUVaekOwiLso82LgXmHjOQjxUDp3986i+AiQ
	 iJoCWGm/BRexqJB75wJ6r+H/8tAHuuI7Cx0l1JlPO5RVXXJ0nuvtmrVOmejndXV0A5
	 o/e3K08o1JQJUfLGMqTXfQlnm8RxHMNKYXJ2+qL/e1aXy7IHric+DNRiQKPN0zx8tq
	 TbyY2PfE1oH8zUv+yTLHyxp7R+kHDlpzk3zr2+jtTk4uuoNECQMYHwFA1CSC/grqBE
	 S0J6RuZ5M5JwtCBjo6QFwmN5aw0PCEeN+r/4zKGHkLvnEyw+RYcO8UBHwwRAIkFOEv
	 JJDcONpnQBdWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9B3C531DC;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] support for amlogic rtc
Date: Fri, 23 Aug 2024 17:19:43 +0800
Message-Id: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9UyGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyNj3aKSZF1DI/PkFAtDS6NEQ2MloMqCotS0zAqwKdGxtbUAA60T+FU
 AAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724404784; l=839;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=KhN+NQf/vdSEEkKAVXu1CtJtcHLdjhi4HZJpa/pUdy4=;
 b=HsWgzJib2xTeA8gPpNPJiGUQhNPcfsMJfbZcceA8byJwSKYLP9/PfVVJ32Xkd/3txvcwOEw6o
 2DM3LDAMKS+Dt84agCJgAMYxbroDNzqH9v7mHjfL6C3XJeTD0HiZATj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add rtc driver and bindigns for the amlogic A113L2 and A113X2 SoCs

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Yiting Deng (3):
      dt-bindings: rtc: Add Amlogic A311L2 and A113X2 rtc
      rtc: support for the Amlogic on-chip RTC
      MAINTAINERS: Add an entry for Amlogic RTC driver

 .../bindings/rtc/amlogic,amlogic-rtc.yaml          |  66 +++
 MAINTAINERS                                        |   8 +
 drivers/rtc/Kconfig                                |  12 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-amlogic.c                          | 589 +++++++++++++++++++++
 5 files changed, 676 insertions(+)
---
base-commit: dff71e5c6076314f3eefe700abd6af834c57bd64
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>




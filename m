Return-Path: <linux-rtc+bounces-2570-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45E9D0A52
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 08:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5D341F246A7
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 07:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8A6198A11;
	Mon, 18 Nov 2024 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HL+7WMop"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB46195F22
	for <linux-rtc@vger.kernel.org>; Mon, 18 Nov 2024 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731915002; cv=none; b=s9+/iRTk7wKK+O4RPC+eBkohcHeQW7tbTLcoX+TKRKD1cRqqdVAecX4feAOqJQT/1ZGf5HE6vQHdNIZWfjk5e0RBueK1BkAENJsx1m1iswsEg9lG/mI6ZEW5Krshm5hRL0ic8+9dYlqdhH8jfZKDjXWXlHTjUTjUudfFITqyhKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731915002; c=relaxed/simple;
	bh=td6+l7WkUjNWGThmCIB/LPlCvWZT0+Ux4/fA3F+b0hk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P6jhQeoghRvoIPIj/Leyu4tNO4f/xvKk6YyfGMUFaXnDKNJXVhFm0uy+wvyda8Wloq6qYv6FluJPST1+zO7pEfGB3thK+8f4EHdafigkgDH7/WRw/1u+nhd+DmU6WsBQIrY5vr4uNpiEmVEi2aySCRrMjS4Kb3ttKCsPJHghaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HL+7WMop; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zIZipZXZzeXFxw5y+kIUydqWUv7lTVPzDgbO2oK3gn4=; b=HL+7WM
	opor2SYxeVA4JHlYVuMdXpQwfKmpXx66XE9fzBshiF7pdTI7uzGfcZOCMj14xc5d
	EJ25syDHUIg/rz0jua9qduEoJtilO0VUVE3UTSrzMSv+3jkUnHKFMM8wuaMMdeIc
	yPo/nXDLAi2MOjNNCw+LbiVljHiblxy4VJG4bUdGIdkvLHhFSaVZ/RH3yuspw3G5
	sETeD4Cbw0frHGY9f/U6OpZGOVPaP3umDHc3CXaep/Z2IXCsefCAWg7WRS735T+s
	DPoQiSJZ0nagChQx0dVA2ObWZI6ZF9fEnn8Uif+bB7hC0b1tYjlKNvIdxXU6eKJb
	AkhHEuEkszEnbnfw==
Received: (qmail 112572 invoked from network); 18 Nov 2024 08:29:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:43 +0100
X-UD-Smtp-Session: l3s3148p1@BLpV4SonsIYujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 13/15] rtc: brcmstb-waketimer: don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:29:12 +0100
Message-Id: <20241118072917.3853-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header clearly states that it does not want to be included directly,
only via 'device.h'. 'platform_device.h' works equally well. Remove the
direct inclusion.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-brcmstb-waketimer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
index 1a65a4e0dc00..6c7701b24ba5 100644
--- a/drivers/rtc/rtc-brcmstb-waketimer.c
+++ b/drivers/rtc/rtc-brcmstb-waketimer.c
@@ -17,7 +17,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
-#include <linux/pm_wakeup.h>
 #include <linux/reboot.h>
 #include <linux/rtc.h>
 #include <linux/stat.h>
-- 
2.39.2



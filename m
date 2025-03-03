Return-Path: <linux-rtc+bounces-3374-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3976A4CE5F
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 23:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEA15173A9F
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 22:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BE9235C1D;
	Mon,  3 Mar 2025 22:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aF2dFqLn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A31F130D;
	Mon,  3 Mar 2025 22:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041369; cv=none; b=baSS1kO48ltPU1cu6GPaNyiJxvW/HKx3CXugfVA/5bwu69Fy72ZuvBYXAN2hXD33uMvxvtrwUO7rcYICx5k3q0orE6JJjRVrrifNdYMln2DcxVFJJ1xQapoge+6/KpzX6p1uWlJoxJv4CDEWlYqVnj9KVe79X2RWQoV9isT7KVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041369; c=relaxed/simple;
	bh=nFTaqe6PvTR+aznTnllNlYAtIRChZ3vvI8RY64RwD3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NU1ceUVv72G5KtWJoaLSXmRucadTd4HE/imQkwDnU+Y8I6ynliIgufBr8+D5goK4i/4JuplN8sge8VhP9PXRSQzHsxrYddxiv9D8cmxOfZPCNGUVQH6oguqEiQS/vV1yLvbMQdTO69M5yVuPmA9GG/oDM+dvgfM0mW9P7y3C/D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aF2dFqLn; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5E624327D;
	Mon,  3 Mar 2025 22:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741041365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OznV1AH2kDLGET0ZQwbYbQJ6tEuJ2MVmRJkow5k5TvQ=;
	b=aF2dFqLnfwZ9hpjtMgoZhykMcIfOhHJTerNItJtWcNcud7Xq2ekIrKKYkGP0/8SIoIF87A
	kmg+xVCB+J8MmZC66zBgCph6xr7FhrmwrR7AGd9kcnvnQWXldbkiJAomWUJIIt0nxhw3fn
	JwhkLXj44W/vfIOR4QtpkRrIvNb7DMU/N+JMGQuF+LnbOWvm1jAHPNdxkskuwcj90HsFv6
	Ck3xwT0cGe2xV/5u1VIrRqfH6aO5tqCAa7J+XSHCVRCSfVITsus1pXrBB3lHB7LcUO2R8y
	3QC/VMOHAsSymIaz/DqsuVef/RRD/Jk4vqGRCRuUOqxc62IRtV8JUOhZHwQYxQ==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: pm8xxx: fix possible race condition
Date: Mon,  3 Mar 2025 23:35:57 +0100
Message-ID: <20250303223600.1135142-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303223600.1135142-1-alexandre.belloni@bootlin.com>
References: <20250303223600.1135142-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -85
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepgeevhfefteejieehkeeigeegtdefffekfeejgeeujeeiudfgieejheegieeuieehnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

probe must not fail after devm_rtc_register_device is successful because
the character device will be seen by userspace and may be opened right
away. Call it last to avoid opening the race window.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pm8xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 852d80188bd0..3b9709214a08 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -519,11 +519,11 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	if (rc < 0)
 		return rc;
 
-	rc = devm_rtc_register_device(rtc_dd->rtc);
+	rc = devm_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
 	if (rc)
 		return rc;
 
-	return devm_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
+	return devm_rtc_register_device(rtc_dd->rtc);
 }
 
 static struct platform_driver pm8xxx_rtc_driver = {
-- 
2.48.1



Return-Path: <linux-rtc+bounces-4102-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B8AB967D
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 09:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA1FA01A9A
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 07:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0704227EBD;
	Fri, 16 May 2025 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="bpvYxcmy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D322756A;
	Fri, 16 May 2025 07:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380248; cv=none; b=eYMov683pBd/LbzKM/I/8VFwGj/xvxg5ARGvlO6dlzBGJCtu9YmluxXoz/GsoXwGLN/2R2LwNMfUFWDvwKqjwkbORzecAgBfahYufYDC8NnhjHVXMPOoHerxk3RqrUu5LUmSnxuPD8GHnwWT9Qqy/iKULqW53R39Gqqv28mD86o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380248; c=relaxed/simple;
	bh=2LUSg7Zdz1NxxCnzMbGgag78qSG7v6rups6Hg9AB3eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rCL+y1kIqPwC+GD1rVR7wEfljinBSxB6LMibB2SX2bpUudFRjUY3pY/GQaC6boJrldsUn6rx/XkDypj4SsPhJprmpSR92oHTiSCaZ4eqL4yeDYPODiwhN01La5lAHoyRMENlh0yZxRv6W5ForYackCGOCKkPY4HJL4XXIRm4HPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=bpvYxcmy; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380235; x=1747639435;
	bh=NoyVE6dpJCpwp1H9KqJqcvA2x5V44zAwPbJ/sKD6YuU=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=bpvYxcmyKBKyZtEzTff+rBq5lrNHbd8ut+AbdGyrEOTFWNPX6wt6kZhg0dYJ7xF+O
	 O4AJnstf6qgXfhbKJ/xhzqsuaK6tqzETplLwPwFZmMbKCQKyyKnm7+zCGxAzuN5o1a
	 qAcliW8UgZVUKWvo+dWgmUUzB+QUb012o16oov5Hxl5wswCVG1rEcd+NtYrdmQ2t0x
	 hcfIOkCKGO1fya1RXOt0Z2EGkGqhIdBsZzIZKHdoVHr94wnI5ZO+9TjcKw4K7GpzAK
	 eXqNHO2ynDkRdhLOwnXohBqFY7JIUjqAUtEzulKoa4zmYSAAQjX86lx3uYfnD+8juk
	 KP1h7Evv0coCg==
X-Pm-Submission-Id: 4ZzJV26PJ3z4wx9c
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:37 +0200
Subject: [PATCH v2 3/5] rtc: cpcap: Fix initial enable_irq/disable_irq
 balance
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-3-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=822;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=2LUSg7Zdz1NxxCnzMbGgag78qSG7v6rups6Hg9AB3eA=;
 b=llEZBEeeVmLuXVENteg1uyQgrCJd8ICMLUoRycqcWl+NviTZd6eJf03YYUk90h3fGrGZoj/s8
 0sYqYaQZH9FCNmbB6X6oqC6ECktj4JoVtm8QUj0ljcpW2Y+Vy4Q0e9b
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Interrupts are automatically enabled when requested, so we need to
initialize alarm_enabled accordingly to avoid causing an unbalanced enable
warning.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-cpcap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index 568a89e79c11424967d4af239d252a80a073a341..682f85abfa0e9627c8410220c9cebad7371d360b 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -268,6 +268,7 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 		return err;
 
 	rtc->alarm_irq = platform_get_irq(pdev, 0);
+	rtc->alarm_enabled = true;
 	err = devm_request_threaded_irq(dev, rtc->alarm_irq, NULL,
 					cpcap_rtc_alarm_irq,
 					IRQF_TRIGGER_NONE | IRQF_ONESHOT,

-- 
2.49.0



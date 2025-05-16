Return-Path: <linux-rtc+bounces-4104-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25054AB9683
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 09:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4664A06C5E
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 07:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2F322C328;
	Fri, 16 May 2025 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="XRq1syeT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406322A1E4;
	Fri, 16 May 2025 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380251; cv=none; b=ftXnW88h57qpvRr97t4PzWRwZ4wgb4ecxYygMjlQHxssAUSbYnpcO+VQ+QrdGpPkPN4/ryU6UXrTYRHuWCfG8L24NpduQqs9P8ilUm9E2JIrextAuYtpaWa5IZWa5+uAwbVkvMhwtoT6p7FUTvqrl8SCz++tBvm0GhEKGRTGQHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380251; c=relaxed/simple;
	bh=GJXYiYgi48NE9t/P+NOWlO+DdVXReF8iINAhKcqVKAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCf2XMVlMONll8CWI0SMRyjLihYSwnkhhAN46+304xINwAY4migny3yuPHSpyOoAIy1lwyxDiN+1L4aBwMSiJMPEeX6c2gMKaDVJiJNdZ/KvNVZwWuQTHtwZRLcWfGKeSPX8TbL4nqKRN5yT9uOTUsp23gp4f/L+5YTDe80XWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=XRq1syeT; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380234; x=1747639434;
	bh=+IrraWLimy1x05XmWcpgWWj7AES2HxIEsMNAIBePizs=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=XRq1syeTu67fuoUJrxO1i2+rs/1jCnRtTQvmELbFfP55EYql41aBvJIdIxSuy+65d
	 BQaSENptZ1yCLW3xDCaMUqAjJErj0In7vU/onUJmoCL8dFp17Az1hMEjYGdCXX9uXo
	 4/5R8/SsaGrf9CxFLnCDJMSkol7etXB4j51TvnbxmCflacEjfXZzy65Sl7TgbUxYu6
	 1/JtE7TQFEFW2u8Dap/9lRdkx8OI6VkguTi8B4U50lSyEaxEn3YuG+yW/OXWHiO4uz
	 GOI35lEeZkAlHN4eH5UN44vlW0JbJzZzByiuilihjrxdJLXPsfiupYrD1inb4S/ISZ
	 /Oi7KBmht4Z5g==
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:36 +0200
Subject: [PATCH v2 2/5] rtc: isl12022: Fix initial enable_irq/disable_irq
 balance
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-2-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=849;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=GJXYiYgi48NE9t/P+NOWlO+DdVXReF8iINAhKcqVKAU=;
 b=RfXHJO4jORMcU5oC2njC9qPb5Px1CjeD/ifxPX15ITeWH9dgg65MKJWVkpcBXSnr4DX29gGvF
 TP8iMCZ3st/AMwRngwLRxCJ6zhM7SpGnnFuHluG/uj+X4KifZ1E4OAY
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Interrupts are automatically enabled when requested, so we need to
initialize irq_enabled accordingly to avoid causing an unbalanced enable
warning.

Fixes: c62d658e5253 ("rtc: isl12022: Add alarm support")
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-isl12022.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 9b44839a7402c9ab7da634d95152c2520eb8552e..5fc52dc6421305e957a0c3a169009c3f6a6c7320 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -413,6 +413,7 @@ static int isl12022_setup_irq(struct device *dev, int irq)
 	if (ret)
 		return ret;
 
+	isl12022->irq_enabled = true;
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					isl12022_rtc_interrupt,
 					IRQF_SHARED | IRQF_ONESHOT,

-- 
2.49.0



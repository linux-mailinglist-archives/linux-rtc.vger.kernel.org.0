Return-Path: <linux-rtc+bounces-4106-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C2AAB9687
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 09:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D1011B61DBA
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 07:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D4922D7A7;
	Fri, 16 May 2025 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="JS4mAT4P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD022CBE8
	for <linux-rtc@vger.kernel.org>; Fri, 16 May 2025 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380254; cv=none; b=ZFItxSk8tNv12LHlpP4uqCE59MZwSEcccF8T1tUbcbtGKtKLDOSE3OR9iN4UnFbda8vz4wDAYjl2gnBaquvZEY76UYoD36HQxCAx+s+pLIC+bwbP4zQBWVCzZmKnw4mLmUFb7U2eu5nTYnkPJtlLZbrJjTDxpktVDhQgwtsHWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380254; c=relaxed/simple;
	bh=U/FxXzWBUPkyWbts6DT9nfymDyjSzhYDi8F/JF5C1p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QtnQOtJDauptUIwiSMgK+9k2Jge5BYv6LnGxv2oLgg3rtHZ3msvFtBKOFJX0P+7yqNWmaqab6AX+wS/On9LxZEuOclRa/BHOjTby8Nd6L9pRZvFOv6Rp25MqsziwdrGkCH/pyRoGWoisH0c5ZZe8M2O00Fqb0fln6n9OlFlLdhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=JS4mAT4P; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380242; x=1747639442;
	bh=VhSWaEsAxjdDofu9C1BTEf8HD8mJOrdR0IjKvjQ68iM=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=JS4mAT4PkG/JB4f7BROfMAPAVOZZcR9sLaP0YhAAIMEeaR7fpxZtD83rSJDzuwyq8
	 kYjuOTmCeLS9UAe8GTrtGcPN912TDyPWb2pnof4DFRsrxVeaPhQoAua++dMF4+wFxK
	 aRU+IS8+rjnWKX2WV+T/u2UZleEDIS7haT8KwpHet3BIoDFbXDH5jnsjv0sQ+jUcfn
	 mHheidtx0jVn7+EckzZMJGABp4W8KYacWtYDff/m1BBTO22rOMYvmirXUxTBWrosJB
	 LbPpOsnoLMpayuQal28WgFXHydKyfDoEypTDarYTx5fIeLCfkJKH2LXlgCiJWKE042
	 ZNzWy2opv7taw==
X-Pm-Submission-Id: 4ZzJV419b7z452
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:38 +0200
Subject: [PATCH v2 4/5] rtc: tps6586x: Fix initial enable_irq/disable_irq
 balance
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-4-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=791;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=U/FxXzWBUPkyWbts6DT9nfymDyjSzhYDi8F/JF5C1p0=;
 b=RFB+FyPxB1Zn/jZXYG4SbZpVHAX5IN6jkJA2WhR6fZzTG9PyivmIpCHHP/N0uSkd9eVH7SjjN
 QS+BgAHLdlDD6mDODg7OhH5mGnPJZ5LATO5QuIiBMZG2ijXOWWPou/D
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Interrupts are automatically enabled when requested, so we need to
initialize irq_en accordingly to avoid causing an unbalanced enable
warning.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-tps6586x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index 54c8429b16bfcc692b1f4d5404f0c42f720e93b4..76ecf7b798f0de22aa89a552a263b473ab3065ef 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -258,6 +258,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 
 	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
 
+	rtc->irq_en = true;
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				tps6586x_rtc_irq,
 				IRQF_ONESHOT,

-- 
2.49.0



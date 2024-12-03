Return-Path: <linux-rtc+bounces-2655-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8E9E19B1
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 11:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCAAC162B29
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 10:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE9B1E2846;
	Tue,  3 Dec 2024 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="SMxnv0KZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6871E2618;
	Tue,  3 Dec 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222758; cv=none; b=uUHkU2YbZyjOfrdhdmsktNl3QRg5ukxe+ETImdoJjG9Yn1pP0jlsAEUcYFvyoLvdDOMnEhV/BSEjIe5wZE3YWFfO8hJNk6h7huG1SXF905wa+tPSeXR+mZoyNn2DPOIvXCSX5ZGclSrnEH19uMnGjc8gq8bbiAzTLz1GxSy6QYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222758; c=relaxed/simple;
	bh=aLsSYnYzd0GPXM1Me/YHB+us7IQCUlk6jk1u8U6Lfns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMZPWox1hEbpctRFAm2MS18K+H39x4D846lhrHL1eVow7XaBwBzPemp0iz8zx6tM4iAX2pE4Qm/veFQl4CQ7T6pYsFnGKlxPSD4Or7C1Xar0FvLNc0hUQCVDVLdibIr5pHpBwv3/NBU8cE7+roA/bDN4LuNSBL5/HCiK04PUrZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=SMxnv0KZ; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2vJ5gzpYa+APGJDBpuV2gyqdCOt2zO7G8uCRrZjW9y0=; b=SMxnv0KZn0jLSnJChxqT2LPcu2
	+wnN8N+LoFav+6urlxBrWNkaTklnvJ7hvApd2rCIbsWT21LNHIWq57KeMsRno6e7D+UYw7Q+mJJwT
	cjl0hYjG+FoLqUGvde1PUteQE/esQU0SDJvuTu/C6g9XvQ3iCXeM2s0fo0rnot5zQctpRZ+NtyZ8Z
	fARD3fHMsQS/SxDZhgRDZddLznjDNIHCtO8VsmeeLeEi4Ipwi/2hzPimnUMSBPPdwT2KBgSCNs17E
	9sm8VEmTOFyOZhgTe5x73s3s8r95SHHuzCG4AQ20XLIjAG6NpWED//3b2axW98K44RBCLm2DCVb+G
	FNcSoolg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPh-0001Ov-Ro; Tue, 03 Dec 2024 11:45:53 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPh-000L9W-0p;
	Tue, 03 Dec 2024 11:45:53 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:32 +0100
Subject: [PATCH 2/6] rtc: isl12022: Fix initial enable_irq/disable_irq
 balance
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-2-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=849;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=aLsSYnYzd0GPXM1Me/YHB+us7IQCUlk6jk1u8U6Lfns=;
 b=uWTWtCFJ+1XCx6axiciAWY6NQo5kJc0CFu2XxJjYzRM1XOX9JP+ysUOosmQa4MZgpTO7AdLqP
 /u3wffJpPH5DOdWaMPymcZHBnZFpCiff9tEbSgtJNcokq4fsFxkACtU
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)

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
2.47.1



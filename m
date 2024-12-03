Return-Path: <linux-rtc+bounces-2658-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 102119E19B3
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 11:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ACD028775C
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 10:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD5B1E285C;
	Tue,  3 Dec 2024 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="M7uJAsU5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A30B1E2613;
	Tue,  3 Dec 2024 10:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222758; cv=none; b=hlnMO6+paT46yWoeivwHwULXNs217qEeeDs0lNzQNojEOYHm0PbXAxXz5/U7JNyP8G/F/L66hLv6cfbqsZ+8lRMcXkot1Bcl9GU/PlS/4EZEnLgEt74oH1TLEBvfOjf1kc0lmVr2LQaYjd+iOc+MZOS1LwazjszvpjPhXjpAkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222758; c=relaxed/simple;
	bh=TUFCOTwIdhBII4MetoSWEIKjJ6AZodGxnrFm8Wl+ZIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSqBPlHw0V1LzqWqMxJxsRRpfCKEQENwYnR9DgsYnHIhk5BwWl2K/NmhPn2U9vkmpFgBz5WOq4UiSYJrv+slwweD6Le4JESIn7Af75b8jbQSMVc+isGPqVkuexvXxczOio4vzKqt9XXU17s0ipC6W1cEzEAzg6CG5luTs0vs/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=M7uJAsU5; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WApADZKBlq3j3lJdD1KVN3i3EQ3JBwzraehjqPZ59qw=; b=M7uJAsU5fDKbVFglFHGswVCFpu
	wdR3a3HcWQqbcEMsMf8YL9OaxtnrpqFjaAvwk3evdMxSHv0hasZrd5GyKOZ+CDE8l2lGOKFosrlF/
	Wovc0si+FafxjafqCPnndFUKYlaooV5XsW4/wLAsAs0V4aQC53HU6OjcZGDZ/DEVZhziYlEm6Eyzj
	6Vr/5mBxcZ9bdoD3Y73QxVcryc0HQj5eaEuGSAQu9yd/7aXNqMQxUshLLJkbuUeZYRQYgD35D/rRd
	s/ixaA6bZXTEN91e4benfAdBS4MMya5kD28D9UHe4vPTNUVPfUFUHM+aM99GizDi7Ymp+yOTIA9EK
	wXanh/oA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPj-0001Pf-7j; Tue, 03 Dec 2024 11:45:55 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPi-000LEU-1u;
	Tue, 03 Dec 2024 11:45:54 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:35 +0100
Subject: [PATCH 5/6] rtc: tps6586x: Fix initial enable_irq/disable_irq
 balance
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-5-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=791;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=TUFCOTwIdhBII4MetoSWEIKjJ6AZodGxnrFm8Wl+ZIE=;
 b=MNCoBNJy0N6XD8lT7Ymd2mtjlDVYqgW2/cSEAWw4WeUko3mDRKhp3nl0v9qHQY14CengPCy5y
 QO0U8hfZ9JyChM0ylxJ15HJXORpgUlbuYq9nTomK+9QFxHKoIq/OGs9
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)

Interrupts are automatically enabled when requested, so we need to
initialize irq_en accordingly to avoid causing an unbalanced enable
warning.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-tps6586x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index e796729fc817c1bd99f4c70b714a346fc1a795d2..c8ccb4779b50b2c5909e6a64748f52b61e78dac5 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -258,6 +258,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 
 	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
 
+	rtc->irq_en = true;
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				tps6586x_rtc_irq,
 				IRQF_ONESHOT,

-- 
2.47.1



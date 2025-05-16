Return-Path: <linux-rtc+bounces-4105-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21387AB9685
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 09:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBD81A06EA9
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 07:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F9F22CBF8;
	Fri, 16 May 2025 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="Mzrrnk3C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28F0227E99;
	Fri, 16 May 2025 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380252; cv=none; b=kbPJ+kwhU2/WkMOMIq4PTSyLfdnZz3398RJU0eGWKilgWZnZDabv31P91ur7geIlqVtK2JdDDO5fGfKT3AsQoAufiHrtUdkcgFlMWC4EfCcdjtqFekl22HDun9Cbdzlt63zlreGlKcXE23qOQP7QkmzZxBUWpQO2mxx/A8HJrzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380252; c=relaxed/simple;
	bh=IeqH+mmAEu357ujDYHkqkLZyj0ZjtwVZFNzsXZ5Ilns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uy0FXk7ZRLD/l3aGDxQrTrSIa49A4ZdRHsim1+/4Icy1m/h93kL+pqRmgl0PxAxgY9p7fI8F8qcSyxJRylM8GpMpTsmdboMUXvS7KDpZO1hPCqE/AKff+ywq8w2YcLNHrOfizJUad5l9bWGv5bjCoxKS9ShEq/mWgg3Pja2+MdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=Mzrrnk3C; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380245; x=1747639445;
	bh=wnEY2KdUknJWBsQjqh8ETTXj2cz9VJWvKOExBU/gttc=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Mzrrnk3CfWkzkzECgDBXxTZq0Kq03I4a0SUltZAyau3yoa/chOCyofVyO3COMUkvU
	 17Lvyh2T1uzVrzZ55dyDjbK9eHXFST5dhCMcb8/erneuGVoFizGpuNg/VuuAm4oN5r
	 fuPZyySckBn3Ic6V/7Jw1NNdIue135iUtDmA7js97DWUm/DukJxG1rbjGc+pttdtZD
	 J45lpwM4xo15OC5y6HBf6SIfAsLjnnsbhLllM+c36sbv8eYtBmMv7/rcx5+CclhxWf
	 QocciOkWxCs1HNNMA7fB/hX4xoZkJofoR3osKAEUYsNGDld8wiRgSjY9AJ8qFVBIRY
	 C+wQ4whxloZKw==
X-Pm-Submission-Id: 4ZzJVC4zTqzLb
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:39 +0200
Subject: [PATCH v2 5/5] rtc: interface: Ensure alarm irq is enabled when
 UIE is enabled
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-5-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=1227;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=IeqH+mmAEu357ujDYHkqkLZyj0ZjtwVZFNzsXZ5Ilns=;
 b=RrTb8qtv5dYP05zMzXkLxU5u27c2yybG4ipBNvmUZXn+c1CVziXdEP6YOWOHBaVduk77HJF5b
 tScJU+FR9GvBU7Q4gyMOGVGlCzJmIJBV+4kwczh2gYN86zycGwLGvF8
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

When setting a normal alarm, user-space is responsible for using
RTC_AIE_ON/RTC_AIE_OFF to control if alarm irq should be enabled.

But when RTC_UIE_ON is used, interrupts must be enabled so that the
requested irq events are generated.
When RTC_UIE_OFF is used, alarm irq is disabled if there are no other
alarms queued, so this commit brings symmetry to that.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Cc: stable@vger.kernel.org
---
 drivers/rtc/interface.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index e365e8fd166db31f8b44fac9fb923d36881b1394..39db12f267cc627febb78e67400aaf8fc3301b0c 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -617,6 +617,10 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 		rtc->uie_rtctimer.node.expires = ktime_add(now, onesec);
 		rtc->uie_rtctimer.period = ktime_set(1, 0);
 		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
+		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
+			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
+		if (err)
+			goto out;
 	} else {
 		rtc_timer_remove(rtc, &rtc->uie_rtctimer);
 	}

-- 
2.49.0



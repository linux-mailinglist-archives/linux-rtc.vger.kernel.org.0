Return-Path: <linux-rtc+bounces-2659-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470C9E19B6
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 11:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF163287D1A
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 10:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEB51E32D8;
	Tue,  3 Dec 2024 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="nTrt4M3C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD38E1E282D;
	Tue,  3 Dec 2024 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222759; cv=none; b=AgnB3F6tR49YAW5P0g0tuuQLgubXm+YVLb/njrbxGrrPo0N4783sVd7yAm1dcuYM/Vuo6weVwNvNjbgwcOMY8+gQmehxzd9kmL/Z4G8pyWF1588wyj+DFsTrrJiX59ofNXOf9A7xvzmeiqzK8pIM/0/2ZqUMzuFKE8evfbvGIeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222759; c=relaxed/simple;
	bh=9Dt96s2Bcm1MRb0U9H3U4fTwQJyZ4SwoQ7T4izq5lpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKAnvFYWcSIVCpR/I0gq25pgkwLCmslgRitYSe3UR4r9gfv5gEVDXWAVVgwe+gZkqi+Vv3k7+6wbjX5cfaG8c868QRTDXb6XAsDSVSYBybhgNORtBEF4Pgd6dCvlrhAuylmE2YYKg4XMrpwwg/wddGL0kR31lXExi5lF2baz1zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=nTrt4M3C; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=q4sUFc93gmjBPZgy68yfM8oI42T2WlPXmr5pgphYQSI=; b=nTrt4M3CasJxXw6OBstUtotAwB
	1WpkLzMA5oiU3Ba86Sa2CIFx8lJwxpKMWvAhVTsNWCxypFy4crjYZgHxUfIjloq0PSFz9Z6mLCja8
	oq1Ce0VtkITV8dQ7PqrelwFvQHDwT+b1Ka3jhM/rn1oR5Lpws+Lo9izXljgMkZSYsre8Bx389bRnP
	m1saEEoL2bDUQ9moGPwOIR5M3wyGvAH8jduBhN+/ibCY1f5PAQSQbspSClgVADFxNO5RNubN7YcRG
	d8EkB38Vd+VTVd8H6GhekIHctrFkou6mPGf/KuaA5iKodR8RAy5PIHKzlCqZFJhYeKjFp9d/MmEEP
	8YY/dTaw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPj-0001Pu-Nv; Tue, 03 Dec 2024 11:45:55 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPj-000LGA-0D;
	Tue, 03 Dec 2024 11:45:55 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:36 +0100
Subject: [PATCH 6/6] rtc: interface: Ensure alarm irq is enabled when UIE
 is enabled
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-6-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=1219;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=9Dt96s2Bcm1MRb0U9H3U4fTwQJyZ4SwoQ7T4izq5lpw=;
 b=r3Dyu5602AIrHx2dWjtPnTDJcvMVNYZzvLiEShal74iF5XFHfuxtkFwXBxg/GB5IcrPZAcp/Y
 sUdFz60GGCoARdQ0Yvo2lFgP3OoUSFmijOQzgDAwUvHBkSD7c4NrMhn
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)

When setting a normal alarm, user-space is responsible for using
RTC_AIE_ON/RTC_AIE_OFF to control if alarm irq should be enabled.

But when RTC_UIE_ON is used, interrupts must be so that the requested
irq events are generated.
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
2.47.1



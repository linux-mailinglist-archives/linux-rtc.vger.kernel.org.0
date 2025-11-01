Return-Path: <linux-rtc+bounces-5234-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 091E8C274C8
	for <lists+linux-rtc@lfdr.de>; Sat, 01 Nov 2025 01:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44F6F4F2A2D
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Nov 2025 00:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B55241103;
	Sat,  1 Nov 2025 00:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rYNbK0i1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A05B2376FC;
	Sat,  1 Nov 2025 00:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957922; cv=none; b=fK/qCOpsM0iHkff5UgCnbv4pkMB/Jf914M9t+xiILQnZzgdCpPJ07sd7KKX0zsSG3pOSE0DntFeNrSy1m++pW5/MnII1EQ2Wyyn7bqaScR9o0mt5H1BEZJw2M1Sh81KhjjgNM8BL5RMAwz44M3qfVJNi2kog72PtQH50lsMBCpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957922; c=relaxed/simple;
	bh=xnoN+bZ7BzR8Qts48YavtXOfkoBwhFeOsUT1FTtebOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QN+AZFrW1PvYIJ35XA/rrWhT9/GwG/HefmMAtZTAcfBGnRVQ+CbjmwGnlQnuOlT+xVkAOsyfgkfA8GJ0aH9xhEMOdHhQto65LoMWERQFcrQvR7A/3zlbGFjgCzCYQ4I6GPeA2Aqa/PcLpitvdx7jwNjtb1U4XL7fjjEkPhhHofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rYNbK0i1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ADA4C1A17C5;
	Sat,  1 Nov 2025 00:45:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85F686070B;
	Sat,  1 Nov 2025 00:45:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 940AD1181ABB0;
	Sat,  1 Nov 2025 01:45:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WqPUvAWPFRuEPa0v7vatFRnWyFkHeKpRcwMEpG002Cc=;
	b=rYNbK0i14AFE5mma5sHvOClLxJ1EWM/ZOAxkfMReGoRjxYUNkCrNDnltfxELOHRB6X+zci
	5CM28++tyuJFG5TtyzDB03VWEvGWkJRgUw5GoJqDxx87cPnUCKOHNfX0cHhiFmxqCfag/X
	ulqKTMEElXgDGVaO4XeBnIHNHdPiJoWoKT4n4dWsDUVPjFhjMgjbFqPUk4p/VdLonbTDzw
	p/hTVBrl3A880XnsoLIYKTCcAmWJvIhOWgKi1PK+oKlZ/gBg3MmNg+b1u/W2rtcMO2LNes
	aF6aQOS3DsFgzwx2eHL2N9qHKHnHlCAuUjWVD07g1SSwfHWTgo3VYgv8AtDyCw==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:11 +0100
Subject: [PATCH 09/11] rtc: rx8010: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-9-c9a274fd6883@bootlin.com>
References: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
In-Reply-To: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
To: Joshua Kinard <linux@kumba.dev>, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

max_user_freq has not been related to the hardware RTC since commit
6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events"). Stop
setting it from individual driver to avoid confusing new contributors.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8010.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 2b6198d1cf81..171240e50f48 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -412,7 +412,6 @@ static int rx8010_probe(struct i2c_client *client)
 	}
 
 	rx8010->rtc->ops = &rx8010_rtc_ops;
-	rx8010->rtc->max_user_freq = 1;
 	rx8010->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rx8010->rtc->range_max = RTC_TIMESTAMP_END_2099;
 

-- 
2.51.1



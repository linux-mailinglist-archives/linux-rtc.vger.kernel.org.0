Return-Path: <linux-rtc+bounces-5629-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B4CEBAE0
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Dec 2025 10:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85B8C3009F85
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Dec 2025 09:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD972E1C7C;
	Wed, 31 Dec 2025 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="4LVMaG+k"
X-Original-To: linux-rtc@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15276274B2A;
	Wed, 31 Dec 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767172984; cv=none; b=GWaxYlfGEFveDGc0w53PTbZDgca3w7nswlGPlysJH3u4kYLOe4qmx9f8D/yaRkW7VASsLECfKyS1J2Ez41JXDgxFhRAMlzqAW2EnVovnRRO9Fkg6IUoFwLclPj1/1RAQTK4V0CubsWbvHIy8G7uelIqyZnrsAwR6KhZLPYXQgPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767172984; c=relaxed/simple;
	bh=5QnxqWrv00MtSv5/wr02+yogFFU59K0p75d5GhPSL+Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OESfwPOvWzNWrmHLbkFnSG6Ewynr9eYvF9oC3cw8tf6wKKE5PuynxO5uy2oGLHL4FlDKycibqBFgh+KwztHYdreaHnX0G9UVYdAh67mxoHo3UuercQyi09b6FWAj6GIenUGY597mozVwNA9OYtTstLv+dAnyZbSRh9SU4ZwZsV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=4LVMaG+k; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hiTM3zEV7BISsarA8lD5G2KPqkgzk9zdo8M19wPaiuU=;
	b=4LVMaG+k7JoT1UJT+/BA//r+Q6fRlqqSxENhNhlrHFIFyUoWNNO4+g0p4nyiY2GrltFsTk4G3
	DGvOgv9QkrKYElAsJ/DNhUEJ+Dwdy+qd1Yv4LavEqGaqmRWGr6k7quYy98B34vnDBfi6/GrZuXf
	pa+Eq01sc+l5cwft6C6SBIA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dh4Cy0Mg6zcZyD;
	Wed, 31 Dec 2025 17:19:42 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 18D5A40608;
	Wed, 31 Dec 2025 17:23:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 31 Dec
 2025 17:23:00 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] rtc: interface: Fix softlockup in rtc_timer_do_work()
Date: Wed, 31 Dec 2025 17:23:21 +0800
Message-ID: <20251231092321.3787542-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)

On kvm qemu with cmos rtc and mc146818 chip, when the read time jump to
a future time after set the uie timer expire with a current RTC time,
rtc_timer_do_work() will loop for a while util softlockup because
the expiration of the uie timer was way before the current
RTC time and a new timer will be enqueued until the current rtc time
is reached, as below:

Fix it by voluntarily yield the CPU in the loop in rtc_timer_do_work().

RTC_UIE_ON:
	read now: 2019:04:08:12:32:27, add timer0 (expire: 2019:04:08:12:32:28)
		 ^^^^^^^^^^^^^^^^^^^^
...
rtc_timer_do_work() iterate the list in a loop:
	read now: 2033:12:02:07:27:15
		  ^^^^^^^^^^^^^^^^^^^
	handle timer0, add timer1 to the list (expire: 2019:04:08:12:32:29)
	handle timer1, add timer2 to the list (expire: 2019:04:08:12:32:30)
	handle timer2, add timer3: 2019:04:08:12:32:31
	...
	-> softlockup

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/rtc/interface.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index b8b298efd9a9..9ded10e82f4b 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -964,6 +964,7 @@ void rtc_timer_do_work(struct work_struct *work)
 			timer->enabled = 1;
 			timerqueue_add(&rtc->timerqueue, &timer->node);
 			trace_rtc_timer_enqueue(timer);
+			cond_resched();
 		}
 	}
 
-- 
2.34.1



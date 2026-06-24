Return-Path: <linux-rtc+bounces-6735-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6j3AHSXOO2rFdQgAu9opvQ
	(envelope-from <linux-rtc+bounces-6735-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 14:31:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7176BE234
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 14:31:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=marvell.com header.s=pfpt0220 header.b=K9hQCzai;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6735-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6735-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=marvell.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49E9D30041ED
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 12:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A96214A9B;
	Wed, 24 Jun 2026 12:31:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BFC17A31E;
	Wed, 24 Jun 2026 12:31:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304290; cv=none; b=tjO4qq06ZTd8hCq2FC8UBbUW/oDE9FSfmVyffDjUXgFoqpxvU/g1pKAqYdAaTSmAZCUgGmEEZc2/UGtlbHJ9l5TLjSKqGVD9PcEkXaSA/rs3OgVHUNY6YW+2Cb3AGVEuH06p7ZiULf4LmplmQEJr0XHbwJ9pRQmYcf15dIi/+e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304290; c=relaxed/simple;
	bh=KY8hDwcKT4YCVJ5PRGgVPlGwnEREr+n/VaWGiPQp1Dc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X7BLMZs7a5K0VA+6MhHwAlzqWqcAKXanrOBOMQnejajXp3vPTPw755dA9SFkLzMJuMIWp97FxLJcm+XzU3JOaAzpxgysmBqGRewwNID8/zZ8Cd25qynYyTg/AzTKtymrHZgD/0D4RGkMR0yOdzROkzCTHg8lCeMWiy0kqjMaXKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com; spf=none smtp.helo=mx0b-0016f401.pphosted.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=K9hQCzai; arc=none smtp.client-ip=67.231.148.174
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OASnrK3629578;
	Wed, 24 Jun 2026 05:31:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=CJPvIR1N46t3QCMZ2bcH/+p
	RY4G6XBOB1A+9wLr6wuo=; b=K9hQCzaiXSNx6vnYTuz7nqYge54IfOjH+7eCq0T
	BmRXVHqeiXthgUFlmJrklSy90vmafXdvrgS9z5QrtVDPWFNj/yXNhjEMsMcdacgq
	ewTHikTqph+zzmzDdMBhBon2B0mwDxHyeCVhuF+z2GZC7iCM0Rd3W6qqNl8dIdcm
	mhLdWlp5ODI4wBIPgE+AyT+AgU+QDWc5KI+fA2pVklhybYgMCybIrVal5/GPKP5K
	36bOG49/t2ZsVLyX5qzpdUs1/dodx7CGc9ADm/aWrVOxp3OPc21kj5WE6u79/ppd
	CyRaSz2D+182EV7FzWqVOz7qOnBSS133YLCoPCtq9jW9Tcw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4eyqqhvg7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 05:31:12 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 24 Jun 2026 05:31:12 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Wed, 24 Jun 2026 05:31:12 -0700
Received: from c1illp-saixps-016.eng.marvell.com (c1illp-saixps-016.eng.marvell.com [10.205.40.247])
	by maili.marvell.com (Postfix) with ESMTP id 3C9583F7080;
	Wed, 24 Jun 2026 05:31:11 -0700 (PDT)
From: Elad Nachman <enachman@marvell.com>
To: <alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>
Subject: [PATCH] drivers: rtc: handle OTF clock changes
Date: Wed, 24 Jun 2026 15:31:03 +0300
Message-ID: <20260624123103.3523728-1-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a3bce10 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=EAYMVhzMl8SCOHhVQcBL:22 a=M5GUcnROAAAA:8 a=BoscpHFsfFJPeGnBXUMA:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: UBzJvdAm0jqW1r4VVVRVvTNTkxK5sMrU
X-Proofpoint-ORIG-GUID: UBzJvdAm0jqW1r4VVVRVvTNTkxK5sMrU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEwMyBTYWx0ZWRfX3Zh+ihz/KGht
 l0Wi7KMs6JasPHJJu+lc00Xj+1Qf3okaav2Bb/EGCWU3zH2yQgSs2WjGLp/kfS5v5Hf7+JF4lfx
 Sih2TXhL4FDKQW/43u3+Le6MLPiQs9A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEwMyBTYWx0ZWRfX9R199IOz5gfr
 sAzhg5pV88XV50fqRuNvB59OXCovZhj/j3dHDa0YoK6Sg5lxpWll5YRLwsyO98eljDGhl2x/mJ3
 vztqka658ADiwpoiJoJjvS2elrRz+MirndUcxV0q5yhExnl3coqjMgZxNwo1dntHXX59yOcPeSz
 faZKOrgvXFkjkZW0Day4JXMbhyRukKbm4dZDdoZ8rAfN6+JuIJleNik0rgbisLZi9dsT/rUCqNf
 SqwUwGVreSWxPhecSKfgvXmdk5/seomvar0I/zEt6MDwpdpYTornKBb4HQsLfOaG9WfJ/yvKoAm
 iNi3/F6Nb/Dp2HF31Uq+juG1Y7OBW5E5JuZ6on67g9haSn2zzyQFsuY8lhE8w/kVZP0idJ8nIoX
 kF2NhocBnmXc/ETFEqpoXizHIk7iog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[marvell.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[marvell.com:s=pfpt0220];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6735-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:enachman@marvell.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[enachman@marvell.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enachman@marvell.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,marvell.com:dkim,marvell.com:email,marvell.com:mid,marvell.com:from_mime];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[marvell.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D7176BE234

From: Elad Nachman <enachman@marvell.com>

When processing expired RTC events and rearming them, use now
instead of expiry to prevent endless loops.
Issue seen with Armada 385 SOC.

Fixes commit 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events")
Signed-off-by: Elad Nachman <enachman@marvell.com>
---
 drivers/rtc/interface.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 96626f8068f9..c32ef95a07d4 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -126,6 +126,7 @@ EXPORT_SYMBOL_GPL(rtc_read_time);
 int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 {
 	int err, uie;
+	struct rtc_time new_tm;
 
 	err = rtc_valid_tm(tm);
 	if (err != 0)
@@ -159,6 +160,17 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 	else
 		err = -EINVAL;
 
+	if (rtc && rtc->ops && rtc->ops->read_time) {
+		if (!rtc->ops->read_time(rtc->dev.parent, &new_tm)) {
+			pr_debug("new rtc time secs %d mins %d hours %d mday %d mon %d year %d way %d yday %d dst %d\n",
+					new_tm.tm_sec, new_tm.tm_min,
+					new_tm.tm_hour, new_tm.tm_mday,
+					new_tm.tm_mon, new_tm.tm_year,
+					new_tm.tm_wday, new_tm.tm_yday,
+					new_tm.tm_isdst);
+		}
+	}
+
 	pm_stay_awake(rtc->dev.parent);
 	mutex_unlock(&rtc->ops_lock);
 	/* A timer might have just expired */
@@ -999,7 +1011,7 @@ void rtc_timer_do_work(struct work_struct *work)
 		trace_rtc_timer_fired(timer);
 		/* Re-add/fwd periodic timers */
 		if (ktime_to_ns(timer->period)) {
-			timer->node.expires = ktime_add(timer->node.expires,
+			timer->node.expires = ktime_add(now,
 							timer->period);
 			timer->enabled = 1;
 			timerqueue_add(&rtc->timerqueue, &timer->node);
-- 
2.25.1



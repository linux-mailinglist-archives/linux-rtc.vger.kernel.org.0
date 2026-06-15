Return-Path: <linux-rtc+bounces-6662-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2b6eM9AfMGpiOQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6662-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:52:48 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4CA687EAB
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:52:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MgDiRWRi;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6662-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6662-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09B44312F589
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36D0408002;
	Mon, 15 Jun 2026 15:48:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A074071D0
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538509; cv=none; b=k3kw4sT+cHJgzSzJp0tLn67zgFBMbiyRiPTMEcui8rkvldIGhJrVys5UfD9PNYfwLuosy3H4159CLZNBrZM7reXf2VEmhfBDIQ/MdnC1+vE/xXKUfd4t9SWrOzCdYgQ4Qa9bP7vP0Z326UtD4jEC0EFu9LrCmpm3Ge33NbOGu0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538509; c=relaxed/simple;
	bh=3VaIy9lYxPseySDhvgtPJEdtxb7eyDUqidR6PRSBZYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGOTo1Vpo13Q/aWnf2O8mgo3q8nmjXNemVp1GCrZGkACe4Fjs8wOcsrKUyJBKY5xjZtdd6sPHQ3/xSWOOPLrh+IWp92AiMKO1MQ3kkJkU5T9bbW7o78uM5AWGJzZfjCWZwbkgTdCYJ+AMnMqYqF4SS5fZY55Tc7XFGH5SNm7y7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgDiRWRi; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eeea039ebso1978876f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538506; x=1782143306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9HWytDa9V2PZ0L29istICZrF1ai/UsBjTqPqnYxQeA=;
        b=MgDiRWRi1oDaK6TYLJY2M8uTd7BJ6NLg2IYN/Zx/EbgI4RiG/7fO5fAuUTmHOUMkFC
         NlOcucG9LfBXa7MIGz0X96/88VoCFHSbRc0dr8qsPP4jNCFpBn0d2IQlvz/2alU2Qj7l
         vswSTh7Qd1l7tzjpcXwwAV90GVfW07+TxIuoPtyrEq20rMuQF/CY20stp/LBwZLx1WCU
         SCAoZrqXuPQLYQktOPFWFbQwjz7jQjphJpwG4c1G8JYx2c7FWhGCUNkFCxnnUmm93HoR
         feundSfJFhKUlVdOTG+IC7Rsb9xFhzA+NFC7R30ANtSb/Tv/myCFfzfhgDjTNq0T2b77
         EP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538506; x=1782143306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U9HWytDa9V2PZ0L29istICZrF1ai/UsBjTqPqnYxQeA=;
        b=CsYhYaAOZCU24GCJGWh5iKGZUBiWBf4TyYXGZdGEuXaAzL4kX6z28hT5LsPcHzgql8
         YAw8d3iX34H1xK9iQ7quEgddg5Vde7XkY1Lm/tyBSTe31zr5qaSfOqLBiuMhsph3uAF3
         NbA9STjoAEfJBtaQ9cjYCr+qt5e6a+bEguqGgWVe9O/+6BSjykYzA+8Z5lcBJ2U7WIgD
         0ahc3m6FjXejL0oBtLiFPpRwiBkwMIe4xL6ZpUGI1bQmoY9c4P1a6XPf6a5T/pAgiv4P
         xOX7wNuIQ8R3lerBHHxM2Hwpq0Ia2bjf/P8nouCUsK8Aoet3yiZHuc0Ke+JFRBz3hp9e
         sUyA==
X-Gm-Message-State: AOJu0YzzLcpKTROnoyCV4euaJWlPKv3Pjfoh55bB3DRHfSJrmMGxDFFW
	iL9V5/rQmx5TeGXn1FBQH9qizCFeaFyJtf3ZN/eDKtCQt02YnrcoEhlf
X-Gm-Gg: Acq92OFiMu2BvPc4i/0Z60rMsuCkPo4pqpqZvEtMp0Nc7UYQ66y59XxCyyYJpMSV/aR
	QxAgfOrstb0yeEZ+lZG1Rqgnx7Ff1yPN7KW5Tzf44s5aKh1Htgvp31R+gjDSvAnmAw2cBBUlH2W
	5ilmsrtdGa6JIRotzeeavK1vG0B8B1tuGghsBebz4JJ1IEbcD49F8PVOgX5l+xGZWl4QZ3BYfsQ
	LT5qeECLL9CXxbqnSrKhYZzmYvK3xzuAupds81vZNXOnEnmGsjqpiENeja9bTltWu4Bd9u7wBjt
	XW9T77HvSWVPAk7yL4bZrhPNqWKsQMjOLBf5zE6KO3fuGC2xAIk8xtaBl+sdw/oP3FVyN+qsgHb
	t3Xjo5FexRCw4XZF3kyNVHelsiyiKzUtLVNJSCaC7hYBL6IV/JRPGYu6nvvID2YkZlhB1mjk2Au
	tqO+DYlsXF5IFpIxT6HSPykSYGyhCtXAVzlysw/B9/Q3l2/A28HX+S0wybVjLlsW5NuRJPcrbwN
	/WKUjxb92n9AsrkhqVsia3R9FaYP1AJGwvB
X-Received: by 2002:a05:6000:18a4:b0:45e:f68d:e791 with SMTP id ffacd0b85a97d-46074a38ce1mr15429804f8f.0.1781538506394;
        Mon, 15 Jun 2026 08:48:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on 32-bit systems
Date: Mon, 15 Jun 2026 16:48:00 +0100
Message-ID: <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6662-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D4CA687EAB

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

alarm and farest were declared as unsigned long, but
rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
unsigned long is 32 bits, the assignment silently truncates the upper
32 bits of the timestamp.

Fix by declaring alarm and farest as time64_t and replacing
time_after() with a direct signed comparison, which is correct for
time64_t values that will never realistically overflow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index fe21fa624288..06339adae71f 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
 #include <linux/spinlock.h>
+#include <linux/time64.h>
 
 #define RZN1_RTC_CTL0 0x00
 #define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
@@ -265,8 +266,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
-	unsigned long alarm, farest;
 	unsigned int days_ahead, wday;
+	time64_t alarm, farest;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -276,7 +277,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* We cannot set alarms more than one week ahead */
 	farest = rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
 	alarm = rtc_tm_to_time64(tm);
-	if (time_after(alarm, farest))
+	if (alarm > farest)
 		return -ERANGE;
 
 	/* Convert alarm day into week day */
-- 
2.54.0



Return-Path: <linux-rtc+bounces-6970-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id shKJNNjtVGqXhQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6970-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jul 2026 15:53:28 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D71B674BEAD
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jul 2026 15:53:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thingy.jp header.s=google header.b=bD9fOSUb;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6970-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6970-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07F783010D0A
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jul 2026 13:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B5242B321;
	Mon, 13 Jul 2026 13:39:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0457A4189C7
	for <linux-rtc@vger.kernel.org>; Mon, 13 Jul 2026 13:39:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949969; cv=none; b=NWUPQb8Xh1CRO7oiftxfuqKIsoK3vjKdaOvJfb3/C6m9ZY1U76IqvCL8hUrEjtf7KDQ4LgXBg4teKKnGcS2SGHkCah4LglmlixHhtKQZISJP10V/PLhLCuUTBIQzIWIRX6Lca6TyiQLtLXzils526NdbQB/7F1fP0+IpRfWB7YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949969; c=relaxed/simple;
	bh=6VfC3Bd3u4s81nbbmnLTfCZkpdzpQKlQNIrAtglTmrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JlwLRc27Lr5S5k8+EIWJKCdDxHDkS6chQWZpAiK05MZqOq3DZBv49DAuzqelsnV1um1PP0pUh7AlKVQIxv+/w720lD0D6f4fXW/EnfJYZCiu3Xlv62JHvHTI8H+Mjg6G3PPuJdKimFqDZlifVBS4gFjgA3rGbalJ58mU8C9FFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=bD9fOSUb; arc=none smtp.client-ip=209.85.210.171
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8453427d3f4so2644244b3a.3
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jul 2026 06:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783949966; x=1784554766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAWIsDu7vxZvkzxf1pzr7gM19TosbWAhVAzlL/5zYJA=;
        b=bD9fOSUbSCjTHwRpMZNlmuVlKr2Vi9BvkK6KOGOF8LcxadiZ6kYjVCMv2omgL5IlLE
         Mzyw7sZ+3CBPAUXHAElFThlcqJ/2FafUVvVSVKQ2gQygot47KffuHhrCUjKXgISJqmYJ
         3roGxBhCzBotqSk7A+KsGW6RFqcOgICIhONTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783949966; x=1784554766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAWIsDu7vxZvkzxf1pzr7gM19TosbWAhVAzlL/5zYJA=;
        b=cgeJjWFVywtZp9nSuKxHSrs0nUZar7EMPGJso9I5OH1k1HPOJhVKhIcYJGuGpV0/Bg
         sZG5EcvSORfGDWkbZGEILabDUyrb81fn1JXpdpMs7y76iABQB9gzRmI7NruykTUSxUxt
         Sx6GIPFR/mpmgRrKbXH75qcqQLGE8A1YDsC+upnh40OzktZQ4YixBf0HiJV3xBpqzrI1
         I7VMLGM8lCKvXg6DhtIUNPMMseU3gB1hT4IJ1602stRoRme9jj9SXz8w0bfHodm1qGZD
         6AhUdPrQ6ZhSrg3pxCtBLhgkpBh0DRmCMObA+RSrbEFyiBfCa57Nia7Sp9xHokJwjvWq
         I2Bw==
X-Gm-Message-State: AOJu0YzkmsxN1GyHGhONZJvbgI97uHqdW7eHuyIpi2ml2/LBiSvJWhl1
	LgUWkQB1veTWEngBtqqsLYkbMvJhFY2u5OIWNosft0zqD7WSUXTx2RA049gyb1L8cwY=
X-Gm-Gg: AfdE7cmNReULJOxwiSdBqeeyuBRQZVVj7imYxz4OIYYz4umD/bqQVL9f3MY9a7m+fWS
	Q980Pq3WlGloMUy0J3NW/rFUreKlT9zv0/Y1f30mJQVV3rob8xGcaSot9MXFCbHJwhUnF5MTDgW
	478QLwe+jeBHsk3E7FmrPwmiy8nhjxdaR4npCwTLOl2BrwnrXzovw/nQ/lAsegWkbt8ePr4pHvn
	rsT6N0dxNvzJaehhpLoX0SWNkUMtJwqLd57BjNGArBA4tzeryRx2x9rHbIfakjFU7VEuXPnqYSx
	wOFIUy7LtHleH+A+5Q0m2XillH4uaqjTS6GnumWU0WTzFTYvrGd9s8dx+/3FTo3W7asDCZLNDvr
	hf9XsxrLvpsws2/XDYiSvDvcJJkMaXrWYEf8wsVgBrOKJzKnkD/RKSMfi3IyWNyTm/uZHrb3cJp
	aKkMklh4Ug+U0Xd1TVu+GB3O+78QQWwcYGLyht
X-Received: by 2002:a05:6a00:a04:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-8488961c15fmr8351143b3a.23.1783949966166;
        Mon, 13 Jul 2026 06:39:26 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84856d5d661sm6734790b3a.35.2026.07.13.06.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:39:25 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] rtc: msc313: Select by default on MSTARV7
Date: Mon, 13 Jul 2026 22:39:19 +0900
Message-ID: <20260713133919.1356748-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[thingy.jp:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6970-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@0x0f.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@thingy.jp,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[thingy.jp];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[thingy.jp:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@thingy.jp,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0x0f.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D71B674BEAD

From: Daniel Palmer <daniel@0x0f.com>

All of the ARCH_MSTARV7 chips have this RTC so it's more likely
ARCH_MSTARV7 wants it than doesn't.

At the same time fix up the indent on the depends on line that looks
like it got converted from a tab to spaces at some point.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/rtc/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 01def8231873..de7f86cd8e6e 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2106,7 +2106,8 @@ config RTC_DRV_MACSMC
 
 config RTC_DRV_MSC313
 	tristate "MStar MSC313 RTC"
-        depends on ARCH_MSTARV7 || COMPILE_TEST
+	depends on ARCH_MSTARV7 || COMPILE_TEST
+	default ARCH_MSTARV7
 	help
 	  If you say yes here you get support for the Mstar MSC313e On-Chip
 	  Real Time Clock.
-- 
2.53.0



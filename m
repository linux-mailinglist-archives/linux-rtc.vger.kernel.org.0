Return-Path: <linux-rtc+bounces-6251-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mh6GJrqw2lvugQAu9opvQ
	(envelope-from <linux-rtc+bounces-6251-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:00:58 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34B3264D9
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AD403086925
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 13:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D911F3DCD9E;
	Wed, 25 Mar 2026 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="j5QaGxjM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D731238166;
	Wed, 25 Mar 2026 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446903; cv=none; b=SPlL2PgBsBQ1I3uFIxnoiibRNYFQ0LpIYOYCIp1JSVp4+30yl+v3QMkJD1WVdkhFc/HmNfh7/q/bzN4TKWWFREukd8CM8KxL/igqFIMAoMML2j2miF2dBviEvBCqjBZzUO8o2Lr8Fj+U0BKhvPSoIkcbpa1Y241qGNE4dBZzdHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446903; c=relaxed/simple;
	bh=pi32dSd8TSx+SNWSMpom2JT7gL0RFRI7pQDQIaLDrq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g51e5BLAY5Zxf/xo0JYUtWKJPrMrczhrAsWNHiGXGzkc52XHVkGoAAKiDhlBJAykqWe1PWfRL4WflP/1TMPxu+ZwIv7A6phk2BNqEk23Db7ptn0Y/eIk/0bMfo2CzAPBr+0YZcvyGIw3QLmvMtCO0mTmrjzrjp5TXjGN4VqejGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=j5QaGxjM; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cde0:9600:8d27:ae39:1dce:2212])
	by srv01.abscue.de (Postfix) with ESMTPSA id 723A71C264D;
	Wed, 25 Mar 2026 14:54:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1774446895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHqLGlaDozhvgx5NZzsru55VUPorc1eitoMtmO4DGA0=;
	b=j5QaGxjMbarizNKHJzox7nHghzgQitSFGmmXHww5GAQk5KCe6PLq1Br5PJDwNs/nY6Re3C
	3SWjG99OKfLDpNxmwl/NgUS0imMukDjuvqDw2qiVkP8os1yX6e8Kf37Y57uJjfCLAkJkio
	9q6yuDHRsM6X+yoyWiINjYVGvTwWcbtXsCVhLqO22o1L9I/dY5HyNlCM4oEaU4nL5wAEG8
	nCtkbfmkJXVYHrJh5v5iyxIxkBsf5tJOanbbRYiV/v9cEXnqCSvy54edX3UgGZ40hihUaj
	G/4JkYrHSlZyfmyPU1DBIn0b8nVXxxUDifA+nkMBvW6CLZFDnZL2Aa8vltdoHw==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Wed, 25 Mar 2026 14:53:46 +0100
Subject: [PATCH v2 4/5] power: reset: sc27xx: Add platform_device_id table
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-sc27xx-mfd-cells-v2-4-d0ebb60aa4a7@abscue.de>
References: <20260325-sc27xx-mfd-cells-v2-0-d0ebb60aa4a7@abscue.de>
In-Reply-To: <20260325-sc27xx-mfd-cells-v2-0-d0ebb60aa4a7@abscue.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[abscue.de:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[abscue.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com];
	RSPAMD_URIBL_FAIL(0.00)[collabora.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-6251-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[otto.pflueger@abscue.de,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[abscue.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RSPAMD_EMAILBL_FAIL(0.00)[sebastian.reichel.collabora.com:query timed out];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,abscue.de:dkim,abscue.de:email,abscue.de:mid]
X-Rspamd-Queue-Id: 3E34B3264D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make the poweroff driver for SC27xx-series PMICs probe automatically.
Since the device representing the poweroff functionality of the SC27xx
PMIC is not supposed to have a dedicated device tree node without any
corresponding DT resources [1], an of_device_id table cannot be used
here. Instead, use a platform_device_id table to match the poweroff
sub-device instantiated by the parent MFD driver.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>

[1]: https://lore.kernel.org/all/20251002025344.GA2958334-robh@kernel.org/

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/power/reset/sc27xx-poweroff.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/power/reset/sc27xx-poweroff.c b/drivers/power/reset/sc27xx-poweroff.c
index 393bd1c33b73..6376706bf561 100644
--- a/drivers/power/reset/sc27xx-poweroff.c
+++ b/drivers/power/reset/sc27xx-poweroff.c
@@ -6,6 +6,7 @@
 
 #include <linux/cpu.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -70,11 +71,18 @@ static int sc27xx_poweroff_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id sc27xx_poweroff_id_table[] = {
+	{ "sc2731-poweroff" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, sc27xx_poweroff_id_table);
+
 static struct platform_driver sc27xx_poweroff_driver = {
 	.probe = sc27xx_poweroff_probe,
 	.driver = {
 		.name = "sc27xx-poweroff",
 	},
+	.id_table = sc27xx_poweroff_id_table,
 };
 module_platform_driver(sc27xx_poweroff_driver);
 

-- 
2.51.0



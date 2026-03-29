Return-Path: <linux-rtc+bounces-6265-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCCHMNLUyGmDrQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6265-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 09:29:22 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6BC351193
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 09:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50F893022616
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 07:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93BF2DB7A0;
	Sun, 29 Mar 2026 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="kFkdA6kY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730602D73AD;
	Sun, 29 Mar 2026 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774769282; cv=none; b=EIwE1A5uQPzjE/wOXzTRwPnqyTyZ7sGkUJfFxMmmDuGmlU63WgZQt4Gi+/TafbL9Tk0Q5KkdDBGQ5Rj2yjjpvmsywa3caqUjbeGqclLztpJHdISVzoSRc75dHlzS+vvQNmO/BSylTQ911aJrpJ5IcQFGpnUtuWBgg6MiWTLowGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774769282; c=relaxed/simple;
	bh=pi32dSd8TSx+SNWSMpom2JT7gL0RFRI7pQDQIaLDrq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EL/B1WWXtrOZ60zSmYLsWeILsTLwxkGjbkVIwcDP1kgqDjqZVyAEO/cyXQUWLbSq8U76NAo4k43Oh0x/SsPtLZ4D3fo9J9XGTYV3r4v6cWlkR2TdWQiKsYcjpIrvEkRSe+q9NSg5DytHwxGqBVAGuFWY61JB/ByJNcvw2CzU0kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=kFkdA6kY; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Received: from fluffy-mammal.metal.fwg-cag.de (87-94-78-46.co.dnainternet.fi [87.94.78.46])
	by srv01.abscue.de (Postfix) with ESMTPSA id CFE561C243A;
	Sun, 29 Mar 2026 09:27:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1774769274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHqLGlaDozhvgx5NZzsru55VUPorc1eitoMtmO4DGA0=;
	b=kFkdA6kYd/QrIaoKLsTyJNmA2Q0Mz5EwPAxVol41mpbcwJhv275luDN+Ks0cowUWPG84YS
	yujaMxjyI4oi4ychknGaNUk169VnS7PzteBORUnRCaEwSH0x26xKsqONxK464zt1j5NG1e
	nBM/W7f4YY7gP/4m5hZnVttxpbdOQS65xoa3Yy2x2oxosHwWH2+Erw//4xEC3y54zakv34
	BFdWvcNYiJQRZEvusS+td7NLuPPdCwrtgDJQFCbPhf1hGE9h7M35rWmlMwq+A+62QNG4mp
	d77Es7TlGYtG5kwqo0JYOUSAwu5ftKejl05uEmagbgBshp95YixcfZGWufiRKA==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sun, 29 Mar 2026 09:27:48 +0200
Subject: [PATCH v3 4/5] power: reset: sc27xx: Add platform_device_id table
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260329-sc27xx-mfd-cells-v3-4-9158dee41f74@abscue.de>
References: <20260329-sc27xx-mfd-cells-v3-0-9158dee41f74@abscue.de>
In-Reply-To: <20260329-sc27xx-mfd-cells-v3-0-9158dee41f74@abscue.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com];
	TAGGED_FROM(0.00)[bounces-6265-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[abscue.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,abscue.de:dkim,abscue.de:email,abscue.de:mid,collabora.com:email]
X-Rspamd-Queue-Id: 2A6BC351193
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



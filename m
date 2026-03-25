Return-Path: <linux-rtc+bounces-6254-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBZSNDrrw2kAvAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6254-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:03:38 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A7B3265B5
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA54E301C15E
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 13:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937BA3DEAC5;
	Wed, 25 Mar 2026 13:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="FRoR1cQ9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211B73DDDC0;
	Wed, 25 Mar 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446906; cv=none; b=sJTKx5Smliw/C/yL5Hb6bQ79eDjsoztY7+QYdBaBicGUTu8V/DFBH0kWFVl4AyYkN8W7yryc++2P9J93+DYtP4AMemUiJgZWOh+IzgQAZRIe/KmYxRSG0Erb0rMDE1iXCyzOPOBTtmU/K9nGjJCAN2sY122qpGNllB4dCIYRT2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446906; c=relaxed/simple;
	bh=iDKvaeDvnMyZNEDCO+iH5La4SPaeOS8gVVZsISM+/78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jOmPqG4msEieK545DXm0a1oEcgqs/jXifen73JJ2m9TzoZLow/OP7nIzcrpdA/VZtyRlAm+R5RYWcJDBoo3FuQPzlKaSs7LRRtnYCXazzUBNxlPS7Evy5Gh3ZZ+THAggS56i7OywBL7ON8dBTyMCdr8ronyGjVLtJFA2vSjDBls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=FRoR1cQ9; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cde0:9600:8d27:ae39:1dce:2212])
	by srv01.abscue.de (Postfix) with ESMTPSA id 93D7E1C3A8B;
	Wed, 25 Mar 2026 14:54:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1774446895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Vvz9BBCdCjmAKX3x6b5LHDmFkQb7BZeGItD0dshHTs=;
	b=FRoR1cQ9xfDn68CQwKYxV7tH5hnWgj9zu9G9i7k3rUs4SZ3Drfe7AXK2vPw0Gt/2ed38YG
	9dYIYc66WmjmbxWQCmVAYxH6wEKxcRKBgJsOIaDtOdaXxmYdYAg5tXNnyY+JONWDZgR00/
	00Yprj+4KWWRkPdW32sxcrbAbtYOZKi/UJWofvW1XY7r23vERCPEWHxigic5mIPbJVQd72
	zdCb9+aBGOsy27L+MUifumctiYAFXWTzh9AhFwSa2BQDBt82NyVVIzTEbHCcaii7B1dyjV
	bNZ0EFRxRazNrxFrWote6ckkZmkkxnNnrohBgrDMdR3X7n5VWkP7wYEowsSdfw==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Wed, 25 Mar 2026 14:53:47 +0100
Subject: [PATCH v2 5/5] regulator: sc2731: Add platform_device_id table
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-sc27xx-mfd-cells-v2-5-d0ebb60aa4a7@abscue.de>
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
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
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
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com];
	TAGGED_FROM(0.00)[bounces-6254-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[abscue.de:dkim,abscue.de:email,abscue.de:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,config.dev:url]
X-Rspamd-Queue-Id: 93A7B3265B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make the regulator driver for the SC2731 PMIC probe automatically. Using
a platform_device_id table instead of DT compatible matching avoids the
need for a separate compatible property in the "regulators" node, which
simplifies the DT bindings and makes the parent MFD device responsible
for selecting the correct regulator driver for the PMIC.

However, this means that the regulator device is not automatically
associated with the "regulators" node. Tell the regulator core to
perform device tree lookups using the parent MFD device instead of
the regulator sub-device and set the .regulators_node member in all
regulator definitions so that the "regulators" sub-node is used.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/regulator/sc2731-regulator.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/sc2731-regulator.c b/drivers/regulator/sc2731-regulator.c
index 5447e1a47d15..93c8156c5110 100644
--- a/drivers/regulator/sc2731-regulator.c
+++ b/drivers/regulator/sc2731-regulator.c
@@ -131,6 +131,7 @@ static const struct regulator_ops sc2731_regu_linear_ops = {
 			  vstep, vmin, vmax) {			\
 	.name			= #_id,				\
 	.of_match		= of_match_ptr(#_id),		\
+	.regulators_node	= of_match_ptr("regulators"),	\
 	.ops			= &sc2731_regu_linear_ops,	\
 	.type			= REGULATOR_VOLTAGE,		\
 	.id			= SC2731_##_id,			\
@@ -226,7 +227,7 @@ static int sc2731_regulator_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	config.dev = &pdev->dev;
+	config.dev = pdev->dev.parent;
 	config.regmap = regmap;
 
 	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
@@ -242,12 +243,19 @@ static int sc2731_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id sc2731_regulator_id_table[] = {
+	{ "sc2731-regulator" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, sc2731_regulator_id_table);
+
 static struct platform_driver sc2731_regulator_driver = {
 	.driver = {
 		.name = "sc27xx-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = sc2731_regulator_probe,
+	.id_table = sc2731_regulator_id_table,
 };
 
 module_platform_driver(sc2731_regulator_driver);

-- 
2.51.0



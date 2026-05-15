Return-Path: <linux-rtc+bounces-6509-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPbrEtP4BmpUpwIAu9opvQ
	(envelope-from <linux-rtc+bounces-6509-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 12:43:31 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB054D90B
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 12:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 624EE3011783
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 10:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3556344D68A;
	Fri, 15 May 2026 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="SYMfKQZX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1144CAEC;
	Fri, 15 May 2026 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841652; cv=none; b=oXqtw8UXFytmt9XKyQzF73CUtEXUzpN6/bW6cwaCacENZFDpLkpJ2U49B8qOX1xXAtuoqAQyYwkBg7O3nmDpyhetUzp4lT0WRch5/24G4LRZ/bUPkV4rw5KbP7dwTr/yad3GY1mpBaX3POuBdhJyktntmqB3S1ppKtrcwQ/OWqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841652; c=relaxed/simple;
	bh=SEkUWKgRpe6vdksyqBr5521jAeA/CZj1U2dwz0Gcgqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkQoR6yd9xxUu9zBoR5qrfQcrglcQoz1BnDd6e1KvDAxzUTgur8cLY2AQjj6IrBkZfRZMMEZo566/16LzIn/sXoWQ8k5MBIuF4H5EgtY1TShSRpJqNRTp9oavtHoD0N7X0AIY5M6H0AnCU4AeCaUQHAPi/+UP8Ni+PPyvMKRkyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=SYMfKQZX; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 75E5327239;
	Fri, 15 May 2026 12:40:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQTkfR2q6G7R; Fri, 15 May 2026 12:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778841648; bh=SEkUWKgRpe6vdksyqBr5521jAeA/CZj1U2dwz0Gcgqw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SYMfKQZX2lBwZXIWXiu4AL/M2iN8wYXOjoKgk4ImIQgWkvg4NNN5zKHRtBpRpWwsF
	 e1SgCdujkbYXW+aWzsfIkufup7nL0iKOvI/7dPwHZzmAf8fD7Qei7zgTf3Ryya6LQG
	 t/+3ddob1nk2swCZClilq+7Ue/smUS8vzEcjFucI+f5yRne6A4YYoYD2GHPGYo/aJ4
	 sv5cHHSgiS7Ct7RbKE1NPo5uDMdl3duWvtsETq6A5j513hG19pIc3gvLzJNLC3h1gS
	 WkOlK/OFxggEHxFcJAnFunn+5LEGIHzPTE2U70Hh23L9b9/ZAGYjBajgqQgk6cZuWZ
	 556J8JnpftQJg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 15 May 2026 16:09:02 +0530
Subject: [PATCH v6 06/11] mfd: sec: resolve PMIC revision in S2MU005
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-s2mu005-pmic-v6-6-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
In-Reply-To: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Rspamd-Queue-Id: E1CB054D90B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6509-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

In devices other than S2MPG1X, the revision can be retrieved from the
first register of the PMIC regmap. In S2MU005 however, the location is
in offset 0x73. Introduce a switch-case block to allow selecting the
REG_ID register.

S2MU005 also has a field mask for the revision. Apply it using
FIELD_GET() and get the extracted value.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/mfd/sec-common.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index afc9e691bb67c..fe92bc4a3dd26 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -16,6 +16,7 @@
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
+#include <linux/mfd/samsung/s2mu005.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm.h>
@@ -119,20 +120,25 @@ static const struct mfd_cell s2mu005_devs[] = {
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
 {
-	unsigned int val;
+	unsigned int reg, mask, val;
 
-	/* For s2mpg1x, the revision is in a different regmap */
 	switch (sec_pmic->device_type) {
 	case S2MPG10:
 	case S2MPG11:
+		/* For s2mpg1x, the revision is in a different regmap */
 		return;
-	default:
+	case S2MU005:
+		reg = S2MU005_REG_ID;
+		mask = S2MU005_ID_MASK;
 		break;
+	default:
+		/* For other device types, REG_ID is always the first register. */
+		reg = S2MPS11_REG_ID;
+		mask = ~0;
 	}
 
-	/* For each device type, the REG_ID is always the first register */
-	if (!regmap_read(sec_pmic->regmap_pmic, S2MPS11_REG_ID, &val))
-		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
+	if (!regmap_read(sec_pmic->regmap_pmic, reg, &val))
+		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", field_get(mask, val));
 }
 
 static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)

-- 
2.53.0



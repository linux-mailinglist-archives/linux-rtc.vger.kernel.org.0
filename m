Return-Path: <linux-rtc+bounces-6324-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGJQMzvg3WkYkgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6324-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:35:39 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E53F60EF
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E8FD30628F8
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 06:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084A536E466;
	Tue, 14 Apr 2026 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dkvQJKY7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5636E48E;
	Tue, 14 Apr 2026 06:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148448; cv=none; b=tp/NY/9ihrGmaG1B9zYw9eWKIbHVD5yGVvcHyoPQ2XYby/Ys4JsGGvWxYLcPQ4PwTSYtPMDjnkLg9irYMqbzjCLs1Veg+y8XXuVSN5k+iMTxF8z/GJeE89N22b+Y0dZJy2eiq2qPcL0XrLod79LoqguG6lVODCJztpd+tuutGrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148448; c=relaxed/simple;
	bh=3JY42Vf1SNv8/FMxe2JJ5LDxHnc0a3Q8zyvF8JRl1PQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GliXtcqyou2QpD/nqk9h8ADElaTEEu2az7uhIMzC1PALNfRR1T4thveXLX0xmEVhqVaJn3oIqk1qg+P+VN94OsDMjYvKzNrjn6F/v9XJz9RRm4LaSMnMe4B7cdQg7jRMAx5BXNO0BFuwxUMcTEfc5t4IcRgTE3AJyBItRlOdmz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dkvQJKY7; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BE78A2650D;
	Tue, 14 Apr 2026 08:34:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4442GowqPVb; Tue, 14 Apr 2026 08:34:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776148445; bh=3JY42Vf1SNv8/FMxe2JJ5LDxHnc0a3Q8zyvF8JRl1PQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dkvQJKY73jg51Po2BWhu7OZ2JT3E1HmnSWDmRJgNwwgJOzlOUOavBxMrGI/O5OJBX
	 fdXgPE7HYT8QNidW9kUbe0Q81pzuPNVsyvcyRJlm5twqtlr384gmWME67n0gAbA9nm
	 Xk/7AqBo0t9POyRrMtisXeWdkBe+ysya/f3zRZTEtxiVM5UmbGzBqe2KJE7krcO5V7
	 3f9jNYpuWSZq6AGUlG2H/mjRSbCH/F6LGhR3Cu+HouLnixSjZ4oVkJUGJOij06H1Us
	 uGc4yiSryI9Cmb1HlbR5jaSU9RDTCHxMZ/SUmXh2UDIB1FAM4zkAaYpGjw883p4Lqk
	 Ak9jDrONy0cmw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 14 Apr 2026 12:03:00 +0530
Subject: [PATCH v4 08/13] mfd: sec: resolve PMIC revision in S2MU005
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-s2mu005-pmic-v4-8-7fe7480577e6@disroot.org>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
In-Reply-To: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6324-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[disroot.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:email,disroot.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4C1E53F60EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In devices other than S2MPG1X, the revision can be retrieved from the
first register of the PMIC regmap. In S2MU005 however, the location is
in offset 0x73. Introduce a switch-case block to allow selecting the
REG_ID register.

S2MU005 also has a field mask for the revision. Apply it using
FIELD_GET() and get the extracted value.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/mfd/sec-common.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 883e6d0aa3f06..43215605191e4 100644
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
@@ -119,20 +120,27 @@ static const struct mfd_cell s2mu005_devs[] = {
 
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
+	if (!regmap_read(sec_pmic->regmap_pmic, reg, &val)) {
+		val = FIELD_GET(S2MU005_ID_MASK, val);
 		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
+	}
 }
 
 static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)

-- 
2.53.0



Return-Path: <linux-rtc+bounces-6261-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INX8MITUyGl6rQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6261-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 09:28:04 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D223510DF
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 09:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 185D93019FC0
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 07:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5D72D46CE;
	Sun, 29 Mar 2026 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="T/W55Azw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566292C3266;
	Sun, 29 Mar 2026 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774769281; cv=none; b=en29i0WZ1VU1UtOEKv8/X9SZ1NZOvGHO96MDRxfC0FVEtfM+JYKUX9nmCef6quRtCNvtNmHcseBa5a+unzBkA2spi4dP9rEcUhHd2l6w42rESea3rbptCebT1b3ztN7rQwb1ulUPXGYN58R3leUzcPtHAZfyiw3wm9D2ckltceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774769281; c=relaxed/simple;
	bh=zOiHRiD7dxKBfhbPbB4OMZm22V5rmCiucuIOzalEXSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhAYlGcXxK2EspfigWojyIAQfXktnTaPISFV+qCkSqCgJNsNBTZarh8z9cLrJ6z5OTo8A0nC2no4pWe2FSPFn/CSvuJmOmywM7HqyqtAnioIx28KXNCc+vIXDqPXXrI7auYoJCbWEzSwaw1X1Sa4Ryzo8ojo255t832KLWUTqqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=T/W55Azw; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Received: from fluffy-mammal.metal.fwg-cag.de (87-94-78-46.co.dnainternet.fi [87.94.78.46])
	by srv01.abscue.de (Postfix) with ESMTPSA id 0280C1C0070;
	Sun, 29 Mar 2026 09:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1774769270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDZ5Sh45takfz5M+ly8guwVTBtTFzIYC7hXhR2y5yk4=;
	b=T/W55AzwjDaWFsg4AheP3A8Y1oqh39ldc4aPcnmWaqzaB6OfJEc+6qPPQytHeUxHPdGMMb
	XKdqKncrarZMXTAeM5wCX2AmpkiBMrnSX1H9BGOi9pSUdwES5FTvWJiiUxFKF6QiROP4nI
	xLLXs/m8hHpQWR6YvdVJCX6KwwieVmlTFCbs+zHsv1vZSkr/RaBb9JSovYQfPDU55zUwhu
	oqhM9hBuekmQ3+flAtePNzpxFyFMbcx2oGyhMsaBzRtuG1+7O2HlW+GymgvbDU+9YUENcu
	52ys0xFLBN4e+KyGVB0DBPaMm56MEwOBFsBG22vGO1HQ4zSXobFiWlMQZ7FO3A==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sun, 29 Mar 2026 09:27:45 +0200
Subject: [PATCH v3 1/5] dt-bindings: rtc: sc2731: Add compatible for SC2730
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260329-sc27xx-mfd-cells-v3-1-9158dee41f74@abscue.de>
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
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[abscue.de:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com];
	TAGGED_FROM(0.00)[bounces-6261-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,abscue.de:dkim,abscue.de:email,abscue.de:mid]
X-Rspamd-Queue-Id: 34D223510DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RTC block found in the SC2730 PMIC is compatible with the one found
in the SC2731 PMIC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml b/Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml
index 5756f617df36..1deae2f4f09d 100644
--- a/Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml
@@ -13,7 +13,12 @@ maintainers:
 
 properties:
   compatible:
-    const: sprd,sc2731-rtc
+    oneOf:
+      - items:
+          - enum:
+              - sprd,sc2730-rtc
+          - const: sprd,sc2731-rtc
+      - const: sprd,sc2731-rtc
 
   reg:
     maxItems: 1

-- 
2.51.0



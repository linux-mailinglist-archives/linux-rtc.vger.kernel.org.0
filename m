Return-Path: <linux-rtc+bounces-6249-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKiTL0/rw2kAvAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6249-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:03:59 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7863265DB
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFBED30AD2CE
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 13:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C8A3DC4AF;
	Wed, 25 Mar 2026 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="fquBHHCz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C2E3D333A;
	Wed, 25 Mar 2026 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446903; cv=none; b=CKodrxgJAKTp92zYEKeOCYeuXv/YlijuDtr7incZ7HKnpT6eIJCiDBQArvAf6d31PRbyRMPuMZH7b6kvdl+QfnpLMu+4cpp4hLoLJv3/f5VFPq4A0pRhYdMX9qrUB9cWWiqMNMri/8lAruJmcirLFToAwTcuk0/qCtdo0Ed1vXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446903; c=relaxed/simple;
	bh=zOiHRiD7dxKBfhbPbB4OMZm22V5rmCiucuIOzalEXSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQrWE/xlM1nJgMHzqXH9FMMyKfpGvqrzqQPLNoECT2xpZ7pSCBh6NfZ81FqLW16gN+b/pUmXsnA6VNKvDL/CnVm/Ve+IB9HaQsOcQ5cOU7YJEZcV0hMWVtGctxsElIAdL8VspgTURJoERlJE090RBpdhtYFCqMYj3sG0zLvulj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=fquBHHCz; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cde0:9600:8d27:ae39:1dce:2212])
	by srv01.abscue.de (Postfix) with ESMTPSA id AE0491C006F;
	Wed, 25 Mar 2026 14:54:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1774446893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDZ5Sh45takfz5M+ly8guwVTBtTFzIYC7hXhR2y5yk4=;
	b=fquBHHCzMBq4Q3M0HbwDIjI3Q71S+GRI93VLNHcNmV0QeO7+/Cifjxod3Gi1IGoH3EI9Ws
	d3ggCEgPGiv/y96pVM/8BHTdbC6YC1TVandAtyml56JXuIn8MDItEk5JjR+/ohvxTeSuJc
	gG2WBdU460oDuzV2FXjDeYylftBTqEM7z8VgbniFjS5t6+lZCy2ys8oqjsd8AMHltjx5Jc
	WO8DaBtisKMMHmm1JoXJ6/6CdUpC9LSwOVKNHLk+4aro7k2hNvXN8ei3jhYbgyjjmsRWGY
	BhXG+mzfoy1X/Kee5gDjpkIMobuljbxt3tC1iwIGQtULVCtmGd9jw8/fN/h2YQ==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Wed, 25 Mar 2026 14:53:43 +0100
Subject: [PATCH v2 1/5] dt-bindings: rtc: sc2731: Add compatible for SC2730
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-sc27xx-mfd-cells-v2-1-d0ebb60aa4a7@abscue.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com];
	TAGGED_FROM(0.00)[bounces-6249-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[abscue.de:dkim,abscue.de:email,abscue.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F7863265DB
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



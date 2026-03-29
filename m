Return-Path: <linux-rtc+bounces-6262-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 51eaF4XUyGmDrQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6262-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 09:28:05 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D54443510E8
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 09:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7120B30193B1
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 07:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237132D595B;
	Sun, 29 Mar 2026 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="sj3k0fiQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D472D1931;
	Sun, 29 Mar 2026 07:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774769281; cv=none; b=Wy59H4ODAaMDOQTEfLVn5lUSd2Fs1WtLgCM95Yv0bCVqXtjYiSKSwHl8mpS7NkBlXpcIqy80Z9mIqR5fw0izDtixPXAN/GxLCOSt9xBwxIQCHrL0pzm9C/cT1mqI208OSU4a3iWDVkyc+AbANI7JO/mC+rt/2Awase0cGr8epxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774769281; c=relaxed/simple;
	bh=MHHt2ANc8Qe7TWRx8Im5NLPa2izmN2X0SM9HOq6qFMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJLLbptoa6SGhhV2JnnXAM68TxvWFjMSnzqxe7BhJqMvEb/IAhipRWgg0yWgj/cvAt9WO8Zptl42mIAoE2sOnpZjZjSHqSIkFh3u9tiFZSYL/2x6qqFD415wR4mkpZO/cwMxvTOSapNohKxWtNGuyHeyXqx+9nFsqB67zx1n5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=sj3k0fiQ; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Received: from fluffy-mammal.metal.fwg-cag.de (87-94-78-46.co.dnainternet.fi [87.94.78.46])
	by srv01.abscue.de (Postfix) with ESMTPSA id 03F7F1C00A8;
	Sun, 29 Mar 2026 09:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1774769271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHiWGAaKNrxwaOndt6yaXs1hWGrtAVLI4xI13GIu7Wg=;
	b=sj3k0fiQrlxLhoa9WyulimP1S2Wv+PcY7F1ySFZMuo/eKQAR3+gq3wPLkGMT9LuPlPrN15
	DfWhMp6sE81oBV+A0I94v+Mj2xd83ANKOk+XhZzVnmth0bk5IcjJk1lY1szPvjztO2aYx8
	JmAhfVBqaJirwAfGaftcDb050F6esPN8rh99abuHGSNw9Sqi+jK2bB2pjYxiTIRtgt+5V7
	iZsoZwgvrcxNkqE+eF989AuN2c/9015Wfa0DYXK7y8u0WiOVyxvGyaVnplVgMDlYASCZ86
	G/VI290iNf515zCaPlMMdCuBeOOHM68499fsRQqbkflgdHs1g4uu4a54IcvMSg==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sun, 29 Mar 2026 09:27:46 +0200
Subject: [PATCH v3 2/5] regulator: dt-bindings: sc2731: Deprecate
 compatible property
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260329-sc27xx-mfd-cells-v3-2-9158dee41f74@abscue.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com];
	TAGGED_FROM(0.00)[bounces-6262-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,abscue.de:dkim,abscue.de:email,abscue.de:mid]
X-Rspamd-Queue-Id: D54443510E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The node containing the regulators is always a child of the main PMIC
node, which already has a compatible property identifying the type of
PMIC. This makes the compatible in the child node redundant. Mark it
as deprecated and remove it from the required property list and the
examples.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml                | 2 --
 .../devicetree/bindings/regulator/sprd,sc2731-regulator.yaml          | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml b/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
index b023e1ef8d3c..12b3258daef5 100644
--- a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
+++ b/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
@@ -222,8 +222,6 @@ examples:
         };
 
         regulators {
-          compatible = "sprd,sc2731-regulator";
-
           BUCK_CPU0 {
             regulator-name = "vddarm0";
             regulator-min-microvolt = <400000>;
diff --git a/Documentation/devicetree/bindings/regulator/sprd,sc2731-regulator.yaml b/Documentation/devicetree/bindings/regulator/sprd,sc2731-regulator.yaml
index 9bd752bab68e..7af20a4781b7 100644
--- a/Documentation/devicetree/bindings/regulator/sprd,sc2731-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/sprd,sc2731-regulator.yaml
@@ -26,6 +26,7 @@ description: |
 
 properties:
   compatible:
+    deprecated: true
     const: sprd,sc2731-regulator
 
 patternProperties:
@@ -39,8 +40,5 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-required:
-  - compatible
-
 additionalProperties: false
 ...

-- 
2.51.0



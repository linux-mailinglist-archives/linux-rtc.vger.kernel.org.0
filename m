Return-Path: <linux-rtc+bounces-6098-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP/CAx8Op2k0cwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6098-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 03 Mar 2026 17:36:47 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1410E1F3E6D
	for <lists+linux-rtc@lfdr.de>; Tue, 03 Mar 2026 17:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CED83002B63
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Mar 2026 16:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AB34F7967;
	Tue,  3 Mar 2026 16:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsZ1EfoI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1333B8BBB;
	Tue,  3 Mar 2026 16:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555801; cv=none; b=sQTNwKTeSxlwpG5ZHVJQf9ljtlRS5AhMiPcRswwbKSnbpYeYGcUkHqez4AuoaSCkTIVLAPUXPBsWWkmgq6SH8g2l3eATC+6mWRHzYjF+QWYS2QM+1/vH8oWfjMwR7psnJBSBkk4uJgjMP+Yq9zOyrJD+Yx0i5+q0z36OSJOXxF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555801; c=relaxed/simple;
	bh=uD6omZr1h+M85AyNsvith9EEDY3VgTHJwYjSZmYkbKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mFdmPnjy6MWpe9805vnbqNFuh4kptW5ug3PWTl/QZdndLYqRcBciX3uRTSMwVrqxEFr0DSQXHCLJT9gW/vnwos5Nwm6r87P7gMAwLvOjSCTDDfH0IlU5lt8ChHWHCbl5akDSIlbBeQ0ZfAj7DWHC+RkS57nidtzOADPRoUzeL9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsZ1EfoI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71ABDC116C6;
	Tue,  3 Mar 2026 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555801;
	bh=uD6omZr1h+M85AyNsvith9EEDY3VgTHJwYjSZmYkbKA=;
	h=From:To:Cc:Subject:Date:From;
	b=WsZ1EfoI0U4bKrMohfTRxLaRsL9cDrC6ePXYDREHa2TL+Y4iDcLVYuiQDQCTS1Aod
	 8rn2E0AxC1C3g6JVIQO2RdLzyzaqhXdOB4bHcaADZSFEEznkealJfi1O3NLNW6aeKB
	 vTvBCIMjU+VDIoJUNR2uadIfRuWV4oo6Ha/RkAs5Y/OGrWQ4uL1/tbpK8IqDJeTyQw
	 yE2qXngI7ZAkKq2yzyFqlLqYBywyVKGwhaQYlunE0BTCwj8SMUKA4AoYs4mcxG6wYm
	 BhKJ0dqseAuA7v+mNeop1A0nDZr/H8ZkIqrB9/hAh1rJiz3hNtQRiJOLBs+tSl1oSY
	 NVHcupFfCJWKA==
From: Conor Dooley <conor@kernel.org>
To: linux-rtc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: rtc: mpfs-rtc: permit resets
Date: Tue,  3 Mar 2026 16:36:33 +0000
Message-ID: <20260303-flounder-slate-dd69766990ce@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=e166A+UXGP7o2QUcxSOgrsTJn1vdzLDqriTWTWIaLkc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnL+YTWL/5h7LPWifHi36fzN4ntmsi0qORE97YjMkfV9 9ZV599Y3VHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJzN3JyHBHIjPr+n49SZ4P 3+ULdvUYOvhseXxvoUVLfntG7xzBsmsMfyVEut5rJx91EzlSIi9yyoatcKvLV14n5Yvbrrc8Fl1 nwgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1410E1F3E6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6098-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

The RTC on mpfs and pic64gx has a reset pin, but until now this has been
undocumented because platform firmware takes the RTC out of reset on
first-party boards (or those using modified versions of the vendor
firmware), but not all boards may take this approach. Permit providing a
reset in devicetree for Linux, or other devicetree-consuming software,
to use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: linux-rtc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
index a3e60d9f83993..e26e92b1af03f 100644
--- a/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
@@ -47,6 +47,9 @@ properties:
       - const: rtc
       - const: rtcref
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.51.0



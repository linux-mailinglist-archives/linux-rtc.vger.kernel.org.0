Return-Path: <linux-rtc+bounces-6487-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLPaNO73/ml30gAAu9opvQ
	(envelope-from <linux-rtc+bounces-6487-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 09 May 2026 11:01:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9A4FEDD4
	for <lists+linux-rtc@lfdr.de>; Sat, 09 May 2026 11:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C9703011A56
	for <lists+linux-rtc@lfdr.de>; Sat,  9 May 2026 09:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B9338F24B;
	Sat,  9 May 2026 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exiQ1VmW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298C382F13
	for <linux-rtc@vger.kernel.org>; Sat,  9 May 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778317291; cv=none; b=nh7y+d683XLR8RmVw2FcPLf8kVnscC2bG11OWhlZB/A6ctyr0keaOT6P9UaeVnCllRis01DeetphsbeEpYe3sOClr6CM8S1lGO6dH5/hDj0ToChphvrhQcjtWbXpMGghP9ciMHiRQJmCIArn/iiHTAqFqs4jgSyfda12fHV9bY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778317291; c=relaxed/simple;
	bh=Pd+PixTClmq9iDjE0tJeEHz/5/XszPl+RTnZIH5Zz3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DwXTWYw9U58JhWZ9D+kcRMw3BoRtUjwzTeq3loBilrv3AB3dQHP7b0rTXsH1/gqu1EIEMb2Y4RDPD511YitDbWmuaZhnEn2ktLC6duriQhwJH9gA6ozLbMLIPZcbYzi5YB6iMiijnPO1wjeg+g8ocKFMRzpgdU2Gi5ZMJ9y3gCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exiQ1VmW; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so838460a91.1
        for <linux-rtc@vger.kernel.org>; Sat, 09 May 2026 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778317290; x=1778922090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5vfP1p0UyOrzp9I9vPGFNM8zPArC9vYWCv2720j8ng=;
        b=exiQ1VmWoM4WA01mYva7D42yO/ANN589Labolo7NOGXNIgRgQv6+xM8tV+YG1s2cAd
         o7CmFvq+rNmaw7Y11uyTV5EmP6das2QWFWukc97GlJcQp9tM3XHUlXWuwus+lmsioM76
         F9Zb56BRXSA/FgpFrm6HwXHmdQb1RbkB3pk8IyelHaBv2knOTLo7LjmSoTMRO/SYJe/b
         ij/WoNPQ8L+0DVXxDBReQnhUWcCV5fWya0VtQWVSGT3hQhtKFhh5TyOlW606aRBBIYOS
         dQwkNZULMhfTOwcHvINHKkuhdaAmDuaysBuZ8fe8Wf476czTSK8TIp3Pit9FPMKF03qe
         +h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778317290; x=1778922090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5vfP1p0UyOrzp9I9vPGFNM8zPArC9vYWCv2720j8ng=;
        b=oeVq/JavWU5JIq9l5EE5oGCUmvacUv9FCJW9YYz1nbo4+upEacMaqKf3LAbnFGCV9K
         LYlFfNNVBLDKKV7wNVCTRjbLo7+XQCIOl9ZpwvpUp2i5YjhhJ62PO6QYKRW0ccilG8H3
         XXY3jj4kLpirwy5dDEm6INqaRbcKqP048ftvOWV+WyCBGp+C3FjIZyJiX8oawpPn6qjk
         FVH8ftRsPxE+qAgz8nBPMofmOG335giwCf3Mi4DfdkMh8nc1+uBng2yZ79eshBq30b94
         T4fNrpZ8/UDsqN/didL211hvAL8V74EiusRM1AtJzkCVjm4WN/zuBSU9Se/Eii75Mjec
         Yspw==
X-Forwarded-Encrypted: i=1; AFNElJ+nevp1/pd8WrDSN+9q9eKRwRau1+mJi+8UZJrLnC+L05Wly8uu1Az3gfarsbjqq9l9f3eINxZOJRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01MzkHCEf4cireuo+x7SnJHcpFFh9+f74Iaa4hasjxMi9Nx6n
	h2bnWSGK41u47X4P/YGHGBOlrRI26XCATvnM+i18xC248ET8pd2ZpyoN
X-Gm-Gg: Acq92OE+3KXPEGLNvEwPhfcIJ49ERi9mwfiZzSFiCmoE69Z83HWlB4pOdepV9sTXiq6
	5NHOn7Iba5YKshjOuhMFadburvFfNo4PKVoq6LgFWD40Aew04AlAL6R7SkX3wJCLJD7oLZ+Mb1x
	GQB/ZrvU87WgPZb7SKNT5dTs/LqpzBy9IfrtgMHhqHy+xuB/Raarvn8o1uSjA8J5D6q+ZW3M4Qw
	Gt3iLq1jS0DtnM1pnn3Uay8rKE06LwPd4hnFKJ9uUD6bPJGGVoYmMsCWloxjlCGI4+SDCsLFAto
	AfX4PSTd0E9qz0SXh3sjhcyIptJ2K90iUKQPL5BOC/wvRJlY4ernrXKgtWLuvVZfual84CJgwPs
	CMXJ+6a+RLW6wfVc48/IIMHnp8TX6l7le/5Z4rtzyabS8oHt+Kmxlc0qKqWjkeL8iY1f7VdBWHN
	bVZMQuRanHMjRRijCloZNCnubdpGIWmTr8GdA4HOjho821p4FU
X-Received: by 2002:a17:90b:2ccd:b0:366:4782:1376 with SMTP id 98e67ed59e1d1-367d49bd409mr2028354a91.21.1778317289891;
        Sat, 09 May 2026 02:01:29 -0700 (PDT)
Received: from ultimate.. ([58.84.61.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625ef70sm1577080a91.1.2026.05.09.02.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:01:29 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Sat,  9 May 2026 14:30:51 +0530
Message-ID: <20260509090051.77603-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4EB9A4FEDD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6487-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.974];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.32:email,0.0.0.3:email]
X-Rspamd-Action: no action

Convert the Epson RX6110 Real Time Clock devicetree binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v1:
- Reuse common SPI peripheral properties
- Drop redundant SPI-specific comment
- Remove unused labels from examples

Link to v1:https://lore.kernel.org/all/20260504183728.27412-1-challauday369@gmail.com/
---
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 23 +++++++------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
index 32d15a014f91..b51d39ef75e4 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -14,6 +14,9 @@ description: |
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
 
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
 properties:
   compatible:
     const: epson,rx6110
@@ -21,24 +24,14 @@ properties:
   reg:
     maxItems: 1
 
-  # SPI-specific properties
-  spi-cs-high:
-    type: boolean
-    description: RX6110 needs chipselect high
-
-  spi-cpha:
-    type: boolean
-    description: RX6110 works with SPI shifted clock phase
-
-  spi-cpol:
-    type: boolean
-    description: RX6110 works with SPI inverse clock polarity
+  spi-cpha: true
+  spi-cpol: true
 
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   # I2C mode
@@ -47,7 +40,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      rtc1: rtc@32 {
+      rtc@32 {
         compatible = "epson,rx6110";
         reg = <0x32>;
       };
@@ -59,7 +52,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      rtc2: rtc@3 {
+      rtc@3 {
         compatible = "epson,rx6110";
         reg = <3>;
         spi-cs-high;
-- 
2.43.0



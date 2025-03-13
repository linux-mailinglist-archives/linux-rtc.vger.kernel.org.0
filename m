Return-Path: <linux-rtc+bounces-3475-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0FBA5F0C4
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 11:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B13B417CD94
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 10:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11378266185;
	Thu, 13 Mar 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R6qy0O+u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E148265CA5
	for <linux-rtc@vger.kernel.org>; Thu, 13 Mar 2025 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861558; cv=none; b=IG+V11sA+DGJKyeHnHNx7o6puCWOXbatCPeMmErY1grK+QxHESkrAjxm46Hz6NXoYuwyYF39l3fWSCJvaf1HH5mu0HoooUwaYyu5fQhi0Oi9idz4svDDvprKyBSG57FZHs+M/ZWoGEEPuW+J7H3ebMYuXebKoWnwllmc3Qh8yEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861558; c=relaxed/simple;
	bh=aOBoAFa158+DZ1Y5CGXzLn7a/TYw0ppYHvQVmxseWu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bh87fKkdwI9OqUqkh9RVRuIcM+yTCuEajEX2ml72fdwxLkAP1eRAXiMbaT8lYlcyEUl5YOQVwinwc18Oo2B7FRU4cNsrQh9vmNCxm0lGhMDbrKYckPsKUWaD/XsxuVeVSzp8skLCfQpkYfZ6eLiNWVaW9xfczMOf6t+6yx7Mi68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R6qy0O+u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=B3SQQdBAAJ4+ATqU6AH2JyhthbipzujBbX1XSPtF+rI=; b=R6qy0O
	+uiiwfBzG/gzpTp7nOXiZlf1ENJS0NPwBAatGc/q6Ijpczt/fE0BDzFWJggFICdm
	/SZZlHAGndYrlL48W7RY7UW+NFwhoQFAEZnZywr1qpcoTyrY4hnssoXIVYNvO3/i
	S2lR4p826S2Cuc92TrkKnU+bLXOfToXheNAe92YpbcQvjZTNPVjMU/HoxQo4rYQM
	ZUl0F7GI2K1+LE9nQ+Z2Ebiez9dUNRIJp7TKucCCvYndj+jnW/k99BEZvOdW1kkX
	kH/GASXjaWE3ra8snGp1ARLPc2JmH/17Ftbq4Qs2io7wvarLlm2Nq9VXVxSnntyS
	AHI3KxLpBc3PNSEQ==
Received: (qmail 1574692 invoked from network); 13 Mar 2025 11:25:52 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2025 11:25:52 +0100
X-UD-Smtp-Session: l3s3148p1@ytkPvzYwJr0gAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 1/4] dt-bindings: rtc: rzn1: add optional second clock
Date: Thu, 13 Mar 2025 11:25:42 +0100
Message-ID: <20250313102546.27335-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313102546.27335-1-wsa+renesas@sang-engineering.com>
References: <20250313102546.27335-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The external crystal can be a second clock input. It is needed for the
SCMP counting method which allows using crystals different than 32768Hz.
It is also needed for an upcoming SoC which only supports the SCMP
method.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../devicetree/bindings/rtc/renesas,rzn1-rtc.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
index f6e0c613af67..f6fdcc7090b6 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -33,10 +33,14 @@ properties:
       - const: pps
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    const: hclk
+    minItems: 1
+    items:
+      - const: hclk
+      - const: xtal
 
   power-domains:
     maxItems: 1
-- 
2.47.2



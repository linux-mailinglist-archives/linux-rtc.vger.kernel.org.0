Return-Path: <linux-rtc+bounces-1585-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3557193C1B3
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 14:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666321C21D7F
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 12:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1380919A2B3;
	Thu, 25 Jul 2024 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jetjWR6R"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DCF199397;
	Thu, 25 Jul 2024 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721909840; cv=none; b=AtI4BpLir8/j2UkDYKkYcYcYZnlZCtxf0CcO27yawE9jFtCcCr6qbmcrIZNIjt3lkqq+bKmwURop/93EkLmkf/OTN5SuuL9YyIh8fvlHMV5EunqhiiaDtxzmEVgK3YIU14q9xeMWuUJRrmqSqDQT7eABY3m0/L9aq+HswoynZq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721909840; c=relaxed/simple;
	bh=eXthGSoTrnAT+PlIWv4WCCHmRkDe/EgJuNj9qj5f/fU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwpIshLsSNryF3XtYOG+cVVgtxnTsL8cjhvsK8Aeb4+LhbyNJEbpF+jOHRT9rfSXLQVhP+UN4aOQG7FdsBoY++YpgbXyXVta0hvH6H6jAGQ40g3acY/wVQq4cxj+ne3HI7IEQhOUEJltGD8YlMdmWFAuH1P+JyVo0mlXKHwo/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jetjWR6R; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909839; x=1753445839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eXthGSoTrnAT+PlIWv4WCCHmRkDe/EgJuNj9qj5f/fU=;
  b=jetjWR6R3vYfbUahGixmuCHGOHCAVdRI0inYLDC5QbEU7TYfLBu0QGGn
   GXX4WS2feuIuRcQhWxM9dNNHFFqO8UqSLrkYtawGf454WCPnXOQfwJdXu
   DiZAIVE4MDeBynfzAwUO0HPnINvva8t7DHu7NHB1N68VOxe/CStxnzE9u
   LpRLbQ5eDtJpyvmta1F/pGBEMVKQw9QfA8p+LlCX1KE7Lgv7PPColnOTm
   O0eTFXBmVg2q+thgR0aAiDhySU3RNHGUZPwS+U2BQ+V//6Y1SdKNggcN9
   K93xSxqxYSpiDnxq1qtyjPMEk806GIRrsSZpnneY+xG+w5POlOlX/H90e
   Q==;
X-CSE-ConnectionGUID: FjEJXt1iShuJypsmHj+1Bw==
X-CSE-MsgGUID: sCz0rbSXR4S4vZ5E/IiXFA==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="29650439"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:17:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:51 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:49 -0700
From: <pierre-henry.moussay@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Lewis
 Hanly" <lewis.hanly@microchip.com>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 13/17] dt-bindings: rtc: mfps-rtc: Add PIC64GX compatibility
Date: Thu, 25 Jul 2024 13:16:05 +0100
Message-ID: <20240725121609.13101-14-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX is compatible with mfps-rtc without any additional feature

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/rtc/microchip,mfps-rtc.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
index 7742465b9383..ba602b1c8799 100644
--- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -16,8 +16,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - microchip,mpfs-rtc
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-rtc
+          - const: microchip,mpfs-rtc
+      - const: microchip,mpfs-rtc
 
   reg:
     maxItems: 1
-- 
2.30.2



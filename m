Return-Path: <linux-rtc+bounces-1456-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 081F192A5D3
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2024 17:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1B411F21F1F
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2024 15:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF80143749;
	Mon,  8 Jul 2024 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NQTZYweo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A013B7A3;
	Mon,  8 Jul 2024 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720452973; cv=none; b=AECyHCd04Wl/xOUD1MdvKcwM2Xvmx52b3E3iZGWcM5ox4snOuO2wSYx0YnKbORjcoXzcNgA/uZJk3KHW8MmdBiHBh29LUWLOuM8RjdnMDh3NwhRAm1Gc59Ub83Im272ulO69HQrdUq2JtKO1Pfj3aPY2sSS2u8goTBnQqrBkvl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720452973; c=relaxed/simple;
	bh=WIlof8VjpgjVgNkQc1mbQXwNMHJWaQAci0Mrn0sTF6E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLOG7Zmv5jHVuZXvEqBD0Shcou1dQaaQHd5mJjD666DNcXUPpouVHcAFAGjqt2GKR6oqgJtgglt19KsJWGYJcoc0D3ldU2LuRalWWukYuq+Ee20Vy5RaXiE6XuPGRGFEMlsMvPJ9dE2jKRwvjCC8XJ6ilq0UZMvXO4Tj5X2JZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NQTZYweo; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468CGusT001000;
	Mon, 8 Jul 2024 17:35:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1DVExvBU3bSjiW2RLNK5c5mGCbP+StnD6nA+NGlK9LA=; b=NQTZYweosV0vBP6j
	v/5n5nOXEZe+hPLNMAyj2EOkikD494cH6Y1u02eSaCbThpACCGtHCNA/xtB8Pjxi
	R/kvJizpDBgGUOTNQ5vv1nrFGtZ02AQaB5QuGQWi3JfPKuqjTHX4BJ7sVxEP1XeS
	JgNSoT/Ke1VQMFFkrPbCC7YTKH3BWORHlt7m3mXPm6/J2b9dBUAQjJr6Up84ZTXe
	JSakcyWm3CiS44OR8OjbwFcmLWPeyDKLUjvPvY19Wlr+cBvgiys9coDTr2QzrZgx
	BGvRYyLgfjWt3YPlbGjiM0xIAiIK1MsDJKMBu7iuyxz3ldkJsnctBkJhI2nHfb7Y
	lVJp9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 407gvhngyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 17:35:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3001540049;
	Mon,  8 Jul 2024 17:35:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5FCAB22D0F8;
	Mon,  8 Jul 2024 17:35:07 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Jul
 2024 17:35:07 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH v2 1/2] dt-bindings: rtc: stm32: introduce new st,stm32mp25-rtc compatible
Date: Mon, 8 Jul 2024 17:34:33 +0200
Message-ID: <20240708153434.416287-2-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240708153434.416287-1-valentin.caron@foss.st.com>
References: <20240708153434.416287-1-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01

Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.

Difference is that stm32mp25 soc implements a triple protection on RTC
registers:
- Secure bit based protection
- Privileged context based protection
- Compartment ID filtering based protection
This driver will now check theses configurations before probing to avoid
exceptions and fake reads on register.

Link: https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-advanced-armbased-3264bit-mpus-stmicroelectronics.pdf#page=4081
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
index 4703083d1f11..7a0fab721cf1 100644
--- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
@@ -15,6 +15,7 @@ properties:
       - st,stm32-rtc
       - st,stm32h7-rtc
       - st,stm32mp1-rtc
+      - st,stm32mp25-rtc
 
   reg:
     maxItems: 1
@@ -90,7 +91,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: st,stm32mp1-rtc
+            enum:
+              - st,stm32mp1-rtc
+              - st,stm32mp25-rtc
 
     then:
       properties:
-- 
2.25.1



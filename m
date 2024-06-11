Return-Path: <linux-rtc+bounces-1278-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DF0904112
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 18:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F19B21C23810
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 16:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4C640849;
	Tue, 11 Jun 2024 16:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nQgaEm7X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE03B192;
	Tue, 11 Jun 2024 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718122882; cv=none; b=rvA9qMtvHbIt6OpD7PZf3I+8WXTxRy/F1b4Qjs2QBWA3CWUftIGMuYgA1XWT9YnbfkWesFwGzWUpxGmBg9S87EsdPLCkBIrMM6JYZgv/9xChWJ1GZfbYYjVfXfY0vA7a7eCtDtHxIIUlYyoZK1GifcATvgNJlcbgIBWpGlpLgyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718122882; c=relaxed/simple;
	bh=vZkZeJSRWsSlA3r72qLOgkTOis1ylOjAsa45W57y/jk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Urqa827zz3D8p/JwFqH+ZMFSBg7q/vx2okSTjD5yvKlojjfLR2FpdTiaGRAwPx+vL+BuDxbdwOaR7I1+gn5yp4LKk3Nq29GHo0HtvyfzUpxyCzWXYtZlEqx4KrUEq3OYa3DvJWKVWcNiJWYRMn/K9n9vtGtpkRhsAcJ1BxRVgtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nQgaEm7X; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BBkVGZ017594;
	Tue, 11 Jun 2024 18:20:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PLilViIb1Wrvxygr4/yl4pIC2TFoQ5rU0JcHSUgX2vk=; b=nQgaEm7XMOtwnIIw
	xFGdC2Vwcwr5nV5q9CgaXOnga8VOSaF2xyaztHD36EopXt2ItD73A48HqDgGNX11
	O+h4TYviz/0sCo8+GAV8D6qFwBEw8BN7nQkJh+/nUwq0AuE4zcNBUwe5NSAUed3T
	MHwX/R1l6DF08fV1IxpbwPNZDm6Jh0Rw+VX6Zjh+MuU7umzykCd4D6kAIU5wehHK
	+7yiSKaRM2xKOdp54eLmFtJwe6u1hgqRiUu0ub3aM+TgC7JY5gcqYyvG4ocOHveT
	6gjMrnMeONuDHmrgHct07GehzNM3lEldCJM7Ww3RYHcn00UeyxR24clHXQctueca
	1W7S4g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp2kvb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 18:20:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7C82240044;
	Tue, 11 Jun 2024 18:20:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C5EA21B504;
	Tue, 11 Jun 2024 18:20:12 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 18:20:12 +0200
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
Subject: [PATCH 1/2] dt-bindings: rtc: stm32: introduce new st,stm32mp25-rtc compatible
Date: Tue, 11 Jun 2024 18:19:57 +0200
Message-ID: <20240611161958.469209-2-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611161958.469209-1-valentin.caron@foss.st.com>
References: <20240611161958.469209-1-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01

Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.

Difference is that stm32mp25 SoC implements a triple protection on RTC
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
index 4703083d1f11f..65a8a93ef5753 100644
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
+            anyOf:
+              - const: st,stm32mp1-rtc
+              - const: st,stm32mp25-rtc
 
     then:
       properties:
-- 
2.25.1



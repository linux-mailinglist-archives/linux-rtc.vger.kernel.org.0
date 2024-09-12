Return-Path: <linux-rtc+bounces-1970-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC47976C02
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 16:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC009284277
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF01D1BA27A;
	Thu, 12 Sep 2024 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="Tvz3qPHy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1935F1B9845
	for <linux-rtc@vger.kernel.org>; Thu, 12 Sep 2024 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151182; cv=none; b=rD2sSEYV+QDt2WII9ExQNGY7iB+vGMylTjZpFylwcCm0cCEz0Jehz97lFocBdmPI+HNmrCnG9y7cfCn1MxxL9BkxYU98pb+kjfV8MfdRcAzvj+4TaHHiPB3G33GWvjKw+TAh9ekYiuR99iCwbxxZ+TBEDNFJ+NDeTmvE3CyUyjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151182; c=relaxed/simple;
	bh=T6OkVennspjAtzHcWDh9ZZB14fD+MSn0S3v4D8yrAic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hfuziBPlVSOG/kfSv5cGQGEcOZ3ODitfkP2GbA+59dzudltxQcQd059xXNNBQ6/MiKcW7ALTvVKvDqXvvgKB2mFXiks6HCGaBMX+SXGlNA/5zzOX0X1X4XohSm9mhCIesdJol9cloehi9YUgqvhO/K/wgjq4rbYjPNlxw7Nq5qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=Tvz3qPHy; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id ok1VsCcawumtXokm4sTd4K; Thu, 12 Sep 2024 14:26:20 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id okm1shmvGX56wokm3sCGj1; Thu, 12 Sep 2024 14:26:20 +0000
X-Authority-Analysis: v=2.4 cv=MY6nuI/f c=1 sm=1 tr=0 ts=66e2fa0c
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=XYAwZIGsAAAA:8 a=vU9dKmh3AAAA:8
 a=lGF4n8RSI6dAxPqq6YkA:9 a=E8ToXWR_bxluHZ7gmE-Z:22 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zkCBkCBKc4ANemT3MV9ght0illnAODmYjMPaR9PDusI=; b=Tvz3qPHyMLjsC4QDS4Y6cmKPTe
	tPXB6K3P8VGoElDjr9KisIZB3VFurvsDHzBX5rRhKUBFhOc+pDRquzsYSZcE0WhFTFJnniAh9rtcv
	RwOXF+edzDqCWY9msE1ezhZO7AzKeB6L+yLzQPlIp/x57w4qyw2rdYHies5oxh8Av9iYpl0HJwRei
	e6ZnxtKvuJoNCPOWkKrgwlA7gXdIkuGOBtlGnrHldFkSGseMM4gWMDOk/dbHmdKj3KIPJ1gOmnSWG
	DD98jzA+QLvszX9qUuoKAvGILiNUywTw2JA0cdhGlVDEVXuJAd5siVgLcTUoSfAfZFP13xyb2ppTT
	5bl2w3xg==;
Received: from [122.165.245.213] (port=41006 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1sokm0-003n4z-0E;
	Thu, 12 Sep 2024 19:56:16 +0530
From: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Karthikeyan Krishnasamy <karthikeyan@linumiz.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/6] dt-bindings: rtc: microcrystal,rv3028: add #clock-cells property
Date: Thu, 12 Sep 2024 19:54:48 +0530
Message-Id: <20240912142451.2952633-4-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912142451.2952633-1-karthikeyan@linumiz.com>
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1sokm0-003n4z-0E
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41006
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 35
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfP+Ypj/vpHLsZ6UX3eQRb/Sx/oc1D/1TB5IUNmkXs8mGWosmR2P+zUwfF+iqiFIFru2i9OJXUUAM8mRfHwsv+83QJkiYGg9mgx4zIVjXupbQN5CAibd2
 jp5gADSGevvMDKX1cgJKMDqyrCKSHgZ4p1vfwO5VU5KwBHhPKdIvJoNVrhds18XG/m1n3LRA1dRrjPb6I9kQAFSLvynfhWf/+uY=

RV3028 RTC has a clock out features, the clk out can be
controlled using clkout register, to consume the clock out
from rv3028 '#clock-cells' property is added.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---

Notes:
    v3:
    - fix commit message
    
    v2:
    - fix commit message subject

 Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
index 5ade5dfad048..cda8ad7c1203 100644
--- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
+++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
@@ -22,6 +22,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#clock-cells":
+    const: 0
+
   trickle-resistor-ohms:
     enum:
       - 3000
-- 
2.39.2



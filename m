Return-Path: <linux-rtc+bounces-1721-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D47C95D198
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 17:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3144C1C21CEF
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 15:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09A518BC38;
	Fri, 23 Aug 2024 15:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="gan9XfQ+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F97718BB9B
	for <linux-rtc@vger.kernel.org>; Fri, 23 Aug 2024 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427366; cv=none; b=a5MgwrdVCuzyv9q3YP2e+zbcC19LbwMESybbP5z2AOtxhJDOCSZcFp40rFZsKFrIHEKB2+QBC9VL6BchqiZoJYomJG4y7Sk0bfDobzS2EPuUysO1mPR3WOB7lL0j/rg9c54AwWf1ZZKEGwRedyK4wonFmIIeExtJXjaSKfZEJhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427366; c=relaxed/simple;
	bh=RWcsPcdAqSTQ8FCPvKUEjAG/CSPBS3D/NNk9b0oSTxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XrxayaQFajLLAitHDmlERgmXwZwLpvdcKvq8K0FCurjUNyTGXfYkow3xd89IGBGGzazAuECxyl2pICUQ/OEP9W7+uiLxlYkSEJwELWCPNNQcv5tWO+8XBeIi8P5OnGmFBVrxOUqLYSTjrQiiHoB8+1bxoNjNkYWuX6a+VkgKwV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=gan9XfQ+; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTPS
	id hHOisE19pqvuohWKUs6cNx; Fri, 23 Aug 2024 15:35:58 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id hWKRswjEbML7zhWKTspHFC; Fri, 23 Aug 2024 15:35:58 +0000
X-Authority-Analysis: v=2.4 cv=asm0CzZV c=1 sm=1 tr=0 ts=66c8ac5e
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=yoJbH4e0A30A:10 a=vU9dKmh3AAAA:8 a=Kb_rVgeVel1wak-Xqx8A:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nqWL8jBxFHYZamQffy5P+pzLgJszdIlE2k6Pctncqvk=; b=gan9XfQ+FPKlJQViHy7oe/svde
	KEqV+axl3tQmJQmV3on823mfVI+jvZUTFaSufzEsojlZU9ENnKaDts5g8Ltz/qgvVrJFZnQfD7HjI
	9A3RyfFpbTC/fUkI1HL9myUcppKMFaG5XsDTZRywCCX3jnktHiLp/+OC5a1qLGWhwBOFuKfHAF4Dw
	GAlx3up7Yjd8UWBMr5QyWLjcx9BL6pXYK3pBIKS9lHNhnHKmis/NEYTGQ+5lcHP197WH1mi4bnZbB
	5wPyuA2D1eo6J0cB2IdNemP1oW6AT5rxum7lGN7XfDti5Za+AyRtLMrW9RxDW4Dm6qoSEQ7+jDPsC
	0sdVsaVA==;
Received: from [122.165.245.213] (port=53684 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1shWKQ-000GB4-0o;
	Fri, 23 Aug 2024 21:05:54 +0530
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
	Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Subject: [PATCH 5/8] Documentation: bindings: rtc: add clock-cells property
Date: Fri, 23 Aug 2024 21:05:25 +0530
Message-Id: <20240823153528.3863993-6-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240823153528.3863993-1-karthikeyan@linumiz.com>
References: <20240823153528.3863993-1-karthikeyan@linumiz.com>
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
X-Exim-ID: 1shWKQ-000GB4-0o
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:53684
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 47
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHAwsi7ksey5KY44nKPOCu2uk2O5PbBXKeMKFbdvcj2og0IBofyEYbcUt+z/TrAPjq3M6gSUvNWFw8Xr0ohLEw9bw2Qbtg1NvCEA44aymge7Dvap8ANb
 ouUDoHY82NKfa0NwJgStFsT0ICs5dWVdVwZ0Afu8FAJd1WuXCuh3G7WDoNkVAdgTLXZW32cMdDe85ZkUWNx064jdebct2SUB5WA=

consume clkout from rv3028 rtc which is able to provide
different clock frequency upon configuration

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---
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



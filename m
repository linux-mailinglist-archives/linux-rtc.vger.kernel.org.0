Return-Path: <linux-rtc+bounces-1716-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3D95D197
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 17:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCF86B27102
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 15:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DDB18B47A;
	Fri, 23 Aug 2024 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="h58cQZqW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80241898EA
	for <linux-rtc@vger.kernel.org>; Fri, 23 Aug 2024 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427363; cv=none; b=dpzUkNUKKJZ2NprC7i4so/O6pR6Dgu4u+2jykssat/cXPa1Q+VxslSkIVfn5+PZvFz9Zn/or8Wt+Pcr/LlXusc8mXnJcp91bhY30KfkeowvAg3Rnx/mYvkpp7cGDSyDOlPqbxEOqukg+BSBwxPLuevrigY+DP5bXf64vCU+N//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427363; c=relaxed/simple;
	bh=NdEvoB57CFSCUVslQzJFyW04yg8jIdDlAxY/1vtsX9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HWOcC5FX4p4TboR2VIjPtvH1NvkVgggn2YiZD9TPLcRad7BX7Bbkbr5/UwoVOJLIYjiUFIKKvYtkGE/zZCOSsOW53BFZF+8mcg/ln+ytfAOwYMS+qBGzPkaxkO501Yos5lEA3Yg6hIZaIyHBmX85pY0NFWHTvNrp72X5kpOkG6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=h58cQZqW; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTPS
	id hSFIseEXQiA19hWKXs8u9L; Fri, 23 Aug 2024 15:36:01 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id hWKUsr4QDmqhihWKWs7O6O; Fri, 23 Aug 2024 15:36:00 +0000
X-Authority-Analysis: v=2.4 cv=NdEt1HD4 c=1 sm=1 tr=0 ts=66c8ac60
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=yoJbH4e0A30A:10 a=vU9dKmh3AAAA:8 a=4uBLznlVahHWhnoGBvoA:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GFh4qRuUJB0rrMs4T9RVkJerrRO8OYO4En9jGqxlD3Y=; b=h58cQZqWgaqWJE2GIGhYjwwR8B
	wDTc4ZTzz+PMaPqUrJbGHtVMbfXdWqcv6dnoZdcD1um3PjeBVjV6N76bHopmZiQ9dItC9KXVvov2y
	Khg6Rme5M2xenJM+VmlM6Rzv4/DS6lP5wDLaUp7sb9M1su22AyEODNBBCAt87D6rmvi/KA43R+i5K
	q9THMY4EdyTCgGCRgyDC53j8wN8QlgTzv57OJSC4UBjHe6Aj7vrEce2HH6FIFjkUZP3p0MrZ9ZPgQ
	vYAhPsow0dMui7/nWglpBgL8J6bBB0nT9hjy3TqrjnDNrLJHkl1Tk+ttgBozx7ePI9cpoPaIXTMvR
	qX7/uGlQ==;
Received: from [122.165.245.213] (port=53684 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1shWKT-000GB4-0J;
	Fri, 23 Aug 2024 21:05:57 +0530
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
Subject: [PATCH 7/8] dt-bindings: arm: rockchip: Add Relfor Saib
Date: Fri, 23 Aug 2024 21:05:27 +0530
Message-Id: <20240823153528.3863993-8-karthikeyan@linumiz.com>
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
X-Exim-ID: 1shWKT-000GB4-0J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:53684
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 71
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMgywCpn8h9txVfHkaFn3B3t5aAv4ToMazU1xUSMHGCyI9TxfADepRqtNC2iEcRZUMovUqDVi/5YhcrHQF9bhQ3Y1x1b7rj38N6sm3EhUZ+aUjw3dh+7
 qqJ0rE+41JQnevNrVHOzS1GfpBbqBNZU8yzUVowrG2lgKUGg5tIMmsXoO6s69mtZGMN1pUO5JGqOm8BsR6q5qB8B4JlfFh/LL78=

Add devicetree binding documentation for Relfor Saib
board which uses Rockchip RV1109 SoC

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1ef09fbfdfaf..29f7e09ae443 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -848,6 +848,12 @@ properties:
               - radxa,zero-3w
           - const: rockchip,rk3566
 
+      - description: Relfor SAIB board
+        items:
+          - const: relfor,saib
+          - enum:
+              - rockchip,rv1109
+
       - description: Rikomagic MK808 v1
         items:
           - const: rikomagic,mk808
-- 
2.39.2



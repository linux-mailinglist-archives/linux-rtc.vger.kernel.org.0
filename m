Return-Path: <linux-rtc+bounces-1968-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AA976BFD
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 16:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610011F2845E
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893901B9852;
	Thu, 12 Sep 2024 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="I/YOQA9M"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6111B9839
	for <linux-rtc@vger.kernel.org>; Thu, 12 Sep 2024 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151181; cv=none; b=jbDJy+1J5LHJ0v3nrBryLH73n20pO6BxBMFBmNeyjc7HNNSU1T/C0ag0dC6D76EvqZKsD9GlfYMXJmtGrESYdvk1d3caWr6wajMtqmWBed+0+3EsZLn4iKxQ9hgGmI8xoY+PL4ctrbYoN8AZhc0gBGy/i79DZ2x1M2bE8qGWoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151181; c=relaxed/simple;
	bh=HpkcJn+qbtAohbvmrgu4Rf5xO2IU/S5nQS069BoQSI4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O05nPqON/ryklH1dnRR0cTnZe+fWKeOE8xzPcTIsisBflucIrSB/x0SnMtPNBSspzfoxWTKnTbr04B1j3mU0omua5TzD+bw1wQf8IIhxvHMy8mzCzNh7P8EJgucDTQb02A5DOwDS1pjFRVTr8RilllWp4UGMXuHC3n8iOqvaaTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=I/YOQA9M; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id ohYVsINCxg2lzokm2sjiyx; Thu, 12 Sep 2024 14:26:19 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id oklyshmqsX56woklzsCGem; Thu, 12 Sep 2024 14:26:17 +0000
X-Authority-Analysis: v=2.4 cv=MY6nuI/f c=1 sm=1 tr=0 ts=66e2fa09
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8 a=_vxgr4zIZx27vdRyEIkA:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IJbCpjR15TcWvFC+DPqDRtsS9ZjW3RoOWItYzzC3tRE=; b=I/YOQA9MfrdgiWwj/igdnBlEad
	gR2ZdKlRDWJur+9+ZUpZnC74IOryoVk5ZafJE9JE6rmo187YqqgSjmEgRjg12rVyfyWtsrBtB7IG9
	aQNTOrhLv8xV3rvSl1CgxsNayoc7Ar6nCx1dPt625UylawQ3bGrLiAthGoVgTx1vEp3Yoz4xEVlxF
	A/9HiI0A+s9wW0AypynRS9V+W5xlMWWRIVMM69slv37BWvRKrRm4SYL7veHFyjzI1oRQZYlGUICai
	G7R9Ydzbx1BFGj32+YYK2VuCK2r2/tk3P6Cg3xN9KVo68sdm/EHdmDjriA4URZ8I+YQfzr1f/XWq+
	yveJcwyg==;
Received: from [122.165.245.213] (port=41006 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1soklw-003n4z-1f;
	Thu, 12 Sep 2024 19:56:12 +0530
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
Subject: [PATCH v3 1/6] dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt string
Date: Thu, 12 Sep 2024 19:54:46 +0530
Message-Id: <20240912142451.2952633-2-karthikeyan@linumiz.com>
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
X-Exim-ID: 1soklw-003n4z-1f
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41006
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 14
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfB9qVL2npTswheyhWdhV5S9r9ufMKh9is3MipnNUxKHJsdVBtYxKbKcucdh9n4Oc037i8oag/Ez4MrknD1CmcCqOZi+hAGU4uPfW2K8BDOYKqVCNKJsl
 qxnK6qpz1jMOHF4RxsEnxofoc+5Yea5eLOIYwGvTqv+V10E7N1JJw1hvlvlsV6ZXyX9Tz76nfcswbTGhFc9FuQbZ59gDrpm8YN0=

Add rockchip,rv1126-wdt compatible string.

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---

Notes:
    v3:
    - add watchdog compatible string

 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index c7aab0418a32..bccd27a1e470 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -31,6 +31,7 @@ properties:
               - rockchip,rk3568-wdt
               - rockchip,rk3588-wdt
               - rockchip,rv1108-wdt
+              - rockchip,rv1126-wdt
           - const: snps,dw-wdt
 
   reg:
-- 
2.39.2



Return-Path: <linux-rtc+bounces-1972-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 065D5976C08
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 16:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCDEE2842BB
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6FE1BBBFE;
	Thu, 12 Sep 2024 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="iNrPafFI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E711BB68E
	for <linux-rtc@vger.kernel.org>; Thu, 12 Sep 2024 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151185; cv=none; b=eaga5vdLxj02cqSKHTPeRnpHlEbPUVSykEHMB2+CJqqxOLTPPomWTORm+U0+NPlBWXrpa+jp6FVv50gWSVa1JRQvMXto1l61/Xm3vYB2fARIW3041lNPD2tSMzD4m0OjTXD571+KvcSi0XDPW/7lJteZJqahKbAe228n0Izwmho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151185; c=relaxed/simple;
	bh=I4W3+7s6dJnx7xXMW4sHD8e0zh2O1/GmeX4hIefSRvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bzIPkFAks7aYcjMX6xOLIPJTPtVHszII3n7B2FgshfL1vqwMI5lyvetCyHxXUM70N8KGjRl9hYuBS1i7sjWjgpKcwRS9dKNXASVVUdelOqP3CBZXwZ957ZzOwzflEFma560kbQ6y1DqwKJ6CS/Xr7l5U+qZzG+G0pn3iiR8VeEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=iNrPafFI; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id oiMdsXtYBqvuookm8sRbh5; Thu, 12 Sep 2024 14:26:24 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id okm5suboGV2ivokm6s7uXj; Thu, 12 Sep 2024 14:26:23 +0000
X-Authority-Analysis: v=2.4 cv=OLns3jaB c=1 sm=1 tr=0 ts=66e2fa0f
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8 a=vU9dKmh3AAAA:8
 a=7OYjvGxe6aps89qF7tkA:9 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=q3nSf+jGddQX3+uTVKIG1Xgr4itWK8uPrGRSisvTDwU=; b=iNrPafFIoD65zmFiipdpwCkAx0
	lirSOPNcyCcAP8W4t4IrFzwFTCLI+mzx0Dq+4zJ9kFNBzAJ4/VycyKvazzEuPqEo1pRjtNHrbKp0o
	RWbp3UwvVzszBP09uB+8YaALFDPb82dYXCJTIaTBAB9BytRAgaNx9YdWjQVrH8/M7LOotkJgNu86D
	jr2r4zmBBcoz0xqCwHUzfUg8hzV6fh5RTxIfXrKAB+uCqYb3WvwnFm5ZoW7L4tqZ/eq5N1xiAbWyv
	A8MMAW512hBYd3KPDOOMDwgU0nQL9aemdTXkxpc1oiURd/rGTSVZt2r1w9SMQIEFvBZLEOn5tCzg2
	VgaTjbjQ==;
Received: from [122.165.245.213] (port=41006 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1sokm3-003n4z-1r;
	Thu, 12 Sep 2024 19:56:19 +0530
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
Subject: [PATCH v3 5/6] dt-bindings: arm: rockchip: Add Relfor Saib
Date: Thu, 12 Sep 2024 19:54:50 +0530
Message-Id: <20240912142451.2952633-6-karthikeyan@linumiz.com>
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
X-Exim-ID: 1sokm3-003n4z-1r
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41006
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 56
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPnJcHccMV+gq0/KjL9X3+TXq6nHuZ7hHBwd4IN4cNsgnHtbjdetWrVJIlPdDQO/GLtksO9gqn7b9IyqY/MF2MG48lfokxQB2wpfobydD6v+4wIZChDg
 tW7XRnSCBnvoL6ldCqE03SXjC/k151k5ySHEb33KpgEzVfnQbZkQGutJ2A8QXpz0F5JcEfpmgysl/Ib9dCpZMdn7FJKSjJnfFE4=

Add devicetree binding for the Relfor saib board which
is based on Rockchip RV1109

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---

Notes:
    v3:
    - no change
    
    v2:
    - fix wrong usage of SoC enum

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1ef09fbfdfaf..ae5e0104612e 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -848,6 +848,11 @@ properties:
               - radxa,zero-3w
           - const: rockchip,rk3566
 
+      - description: Relfor SAIB board
+        items:
+          - const: relfor,saib
+          - const: rockchip,rv1109
+
       - description: Rikomagic MK808 v1
         items:
           - const: rikomagic,mk808
-- 
2.39.2



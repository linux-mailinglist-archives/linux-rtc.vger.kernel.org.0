Return-Path: <linux-rtc+bounces-1848-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EA6969AEB
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 12:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C8701C23A86
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 10:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82434201252;
	Tue,  3 Sep 2024 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="d+LxL8/v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF351DA0E2
	for <linux-rtc@vger.kernel.org>; Tue,  3 Sep 2024 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360790; cv=none; b=rQr+pTHH2kyI3DNcwr+ctpak1Txowz3UqTdX6e52mV6YfgNUN7COpf96EMDRrheK2nQbEQMg/xcOFB4UFlpXPn76Bu20+1HvNDIhkof2GwHff2w6lf38MzfjWhRNwg1+czY/wdPrfsrPTUO3M6MZ4IubAzLlH8wLfNmoPFEeATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360790; c=relaxed/simple;
	bh=JsLm1CC7c3POeqyEgAGdmiJ1LKBcyDw4jNynQKaJWco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hj1lwrh4QJlKGCk/nPq5WRJz4NjAbma38TSiFzAa7pz4HVPUc5zRRuGqdXmXClhHN61Ol8BCCn9XpsxFia39/ndbXSiuWFomAR3LORomNE7qRX8TOwgkYKNsP7yYHtxq0Py2J4xxnQeYq5KmcVTYYLj2yvhSOHCuFdEuKEdrv5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=d+LxL8/v; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id l7xQsQ7sh1zuHlR9nsd6g8; Tue, 03 Sep 2024 10:53:07 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id lR9ksJ7GE2GFYlR9msRlxW; Tue, 03 Sep 2024 10:53:07 +0000
X-Authority-Analysis: v=2.4 cv=GKAOEPNK c=1 sm=1 tr=0 ts=66d6ea93
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8 a=jOwBCQwwsqbqoLW4yoUA:9
 a=HjVMtnDHQlM7PJrv9UYS:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LI6rWAJozlYK2YSfUr+lCWS6YZ0aqIMdjWAwWkl2+FQ=; b=d+LxL8/v+ZrQg7L53jovPW5YOF
	zoo0oaevWBkcNko5hgtnN+xwtmhhhgmld9sSHrGjIGZ6vNP24TL0YERlKA6y8FrbIM/U/gtCsjej0
	6pwEod+/T1pDyzs5nSfHb5+iSbS92itRS6AehcVhY9LCsuL92FTzQQZiUGKfVJuEF1lXdlszVLmSk
	BRKC06XDjiaqavp9X+I1VKnK9t08XfqF0hrS+2fXHUiUoIlDFWcwmEb2ar4OCB6yDvjDv13MwFGwA
	Ay85U6K0eitmUq8+MTiJRL8tpkv1Om8dRjigoTUnMygFTBj/ad+z7GbmQlCXN8uuHS6FXhfBiQ+7H
	JMLsqlxQ==;
Received: from [122.165.245.213] (port=41440 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1slR9j-000Elu-1Z;
	Tue, 03 Sep 2024 16:23:03 +0530
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
Subject: [PATCH v2 4/8] ARM: dts: rockchip: Add watchdog node for RV1126
Date: Tue,  3 Sep 2024 16:22:41 +0530
Message-Id: <20240903105245.715899-5-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903105245.715899-1-karthikeyan@linumiz.com>
References: <20240903105245.715899-1-karthikeyan@linumiz.com>
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
X-Exim-ID: 1slR9j-000Elu-1Z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41440
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 42
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGm6OWJILFOoWaWX9Swa9yfm46y/zHBWXzVTVZ57Sgo9uRsFYmwbbC6PEeKyjg8NfszcfJQh8XHsumDm6ZieOO6UELBCGkAmyuXbyWgCRAiWzncwhaF0
 fmdVABB1TU3zPEI38Q/pKphBODOTW1JnDKXlcFZZ4+OeETSl4F/cKhR1YlJb/8u2zHbDtTX7Rtn+ZUJ9xp9Ws0BqoNPAAo5jkOA=

Add watchdog node for Rockchip RV1126

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---

Notes:
    v2:
    - No change

 arch/arm/boot/dts/rockchip/rv1126.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index abf442804d27..283985608428 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -544,6 +544,14 @@ timer0: timer@ff660000 {
 		clock-names = "pclk", "timer";
 	};
 
+	wdt: watchdog@ff680000 {
+		compatible = "snps,dw-wdt";
+		reg = <0xff680000 0x100>;
+		clocks = <&cru PCLK_WDT>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
 	i2s0: i2s@ff800000 {
 		compatible = "rockchip,rv1126-i2s-tdm";
 		reg = <0xff800000 0x1000>;
-- 
2.39.2



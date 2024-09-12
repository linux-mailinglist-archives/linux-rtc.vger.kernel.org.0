Return-Path: <linux-rtc+bounces-1971-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E989976C04
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 16:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128521F283B5
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93641BB688;
	Thu, 12 Sep 2024 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="maNASzBI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F2E1B9B3E
	for <linux-rtc@vger.kernel.org>; Thu, 12 Sep 2024 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151183; cv=none; b=qQZl7s3T8Gm/NhrIKaWsjWWU1I295HauRRM6eIAr22b5r6U4GT8bogWwy/pGjct/RwcaahhJxU1yFvhE4r28bkLtPnwsCrD77/a3xi6pBgI1YRw931dprYvi+JY9kAwXSGduvjIXv6WgUH9OdQrXof0oAkAnLr++CJ38VRJ5LKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151183; c=relaxed/simple;
	bh=+HsFQ9P6BeHy2tRNxN5vvOqC1d6x3UOmuVOaW6zxXUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SGgSZpv4tyz/S7PefrCPMZTaVd/fVkiphohrIXXpVtYE5QUM7gq2OtLCNVviF927hgaYIzKp9YhvbzBcfePgoWhYXsCyYsIoz1WQI7ygjg2VXvmSibQYXJNRmBK6AGqwI1TzsWYqSKh5m0n4WSAk7XjYJonxzHErwEFJCh4V6og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=maNASzBI; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id oiNVseu1IVpzpokm6sz9xR; Thu, 12 Sep 2024 14:26:22 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id okm3sylCKks1Pokm5sJnbz; Thu, 12 Sep 2024 14:26:22 +0000
X-Authority-Analysis: v=2.4 cv=Ud+aS7SN c=1 sm=1 tr=0 ts=66e2fa0e
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=ARcrkP6DAAAA:8 a=XYAwZIGsAAAA:8
 a=vU9dKmh3AAAA:8 a=L4MHaItcyTsGJ2lxC4sA:9 a=HWcd8CIpyGgXnveeQW_Z:22
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=m9JhFxEGybsTyKIPNyycazgqxL6/YVIhfiGyOVKOb+4=; b=maNASzBIfdxdX2EKB1ta9ZLmri
	5zSPT/B9C+QgusyYzKnDVSgMsF2aON3RoTG8x+Zfdfjm5Z0w7R+XL0Nki6zUfodW45NTACXUvNFHo
	+7swklYVFPezs7YIoPYQRvESyZwbXUMlBwJUFWZ0zeMRNYYF7jsVRnKfSVLQPTM6GIki2KyBPtjZX
	mT0aGzKLI86wnciZhzghrRymI30KLY9h32ThldOrZnVJSHCgjN0fY3/jhz6Crn1dM9HGCqSwNrjtc
	eRvIIYujfsNDvsD+yNVBjOvKrNaDba25AzP3wAMJXobDNaD4hKFaxEaykKFFyyVGXQh/hdd6cDypy
	yQkGp7fQ==;
Received: from [122.165.245.213] (port=41006 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1sokm1-003n4z-35;
	Thu, 12 Sep 2024 19:56:18 +0530
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
Subject: [PATCH v3 4/6] dt-bindings: vendor-prefixes: Add Relfor labs
Date: Thu, 12 Sep 2024 19:54:49 +0530
Message-Id: <20240912142451.2952633-5-karthikeyan@linumiz.com>
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
X-Exim-ID: 1sokm1-003n4z-35
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41006
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 46
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEatyRDoAxWO4Xum8d6DnClhLJC8On6l0Bs/oAmUEoPyLQFa8e5MOjhKV47PmWRxbmNfprNTvZb59H1cbAMrz346wzKuzeLnGGEyw7oK8KlPrj8KGR10
 tk0xXAYmAQsSy9xFQU+3G/ag7P5BYvdjhLZV45KFxmwQh7JRiA3iEMfMiINf8fsYlvIFoJRpOdxA+rqY3gzPqWoTa1FwuHhF1+0=

Add Relfor Labs Pvt. Ltd. vendor prefixes
https://www.relfor.com/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---

Notes:
    v3:
    - no change
    
    v2:
    - no change

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a70ce43b3dc0..7d10ac7d6800 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1220,6 +1220,8 @@ patternProperties:
     description: Unisoc Communications, Inc.
   "^realtek,.*":
     description: Realtek Semiconductor Corp.
+  "^relfor,.*":
+    description: Relfor Labs Pvt. Ltd.
   "^remarkable,.*":
     description: reMarkable AS
   "^renesas,.*":
-- 
2.39.2



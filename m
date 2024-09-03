Return-Path: <linux-rtc+bounces-1849-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF53969AEE
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 12:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3861C239FF
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 10:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709632139A7;
	Tue,  3 Sep 2024 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="mK5jSS8Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6008A1DA10B
	for <linux-rtc@vger.kernel.org>; Tue,  3 Sep 2024 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360791; cv=none; b=VEcUvnW7Ok3tGiLK70HKnNAPLxNK1+98VIS3i4KHB3QFztDJmm4tinslqWbBbmQ9Vbe4xBhv/0yqZya+GC83AVRIc8xBG4HVVV5nPJMKZ2TPcYh8Qz+Bb1cU89lphnKdhmtyvK3NXujdeWas31Bv6n7o/D8mfglA2dXkxbm6Mm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360791; c=relaxed/simple;
	bh=IEvc5bAwiIt8oyx0it1qXA04D8itst9KAXzwOeKt7r0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=noX2mNkGgroGImaGJ3pbhVXQjbavcVNteDbCVx7YoKcvnhbZYJrDPsqNGHH5vqeAqztIOvc8zaVUcs5/N+RkNwRtlkNKO5bfoJdEjdQJV+f5uiAiNBKVU7EHf+t5O3ggvdyZLiWw1FbsWrUAAVgfiPOfOmcl90/ewdScGldlYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=mK5jSS8Q; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id lINSs21iMnNFGlR9osUNjn; Tue, 03 Sep 2024 10:53:08 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id lR9ms6zRFlBoelR9nsdCwm; Tue, 03 Sep 2024 10:53:08 +0000
X-Authority-Analysis: v=2.4 cv=Lc066Cfi c=1 sm=1 tr=0 ts=66d6ea94
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8 a=Kb_rVgeVel1wak-Xqx8A:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FbIDmWyU4STgLTHI4VqNt8b7SMBSfP3dJQ9o9Le9Jaw=; b=mK5jSS8Q8/Iu7NGFXTNQlKgRID
	YC+shzubhO6R0M1heUNWgZW1GE5H9ycqewmgYnBX26PT/Jm4Wj1EVnlRp1R6VNdGLHEiUeRw58r3s
	T+20ayMdsRRLOcH1LLrgHjioyv8m8HcMJbPnE6oJReBABS/dVKAgNs8BvTXVoZ3KNUFWrbci2Mv1X
	5oPfy9nsv4c8xlEMdEXtlPa8JEBBY98Sy0v9OAg4WIs/0EaP/bIpUjQr/0bWabTzQbm+uFAWpFz0o
	0FESaRvbSgB8ZFT+S+khN4MS4+cTTBsuPMt0rzuenM483jqcKYxcYEsgKH9mgTHKDUJiYrg4U+Trc
	H/RCGwhg==;
Received: from [122.165.245.213] (port=41440 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1slR9k-000Elu-2p;
	Tue, 03 Sep 2024 16:23:04 +0530
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
Subject: [PATCH v2 5/8] dt-bindings: rtc: microcrystal,rv3028: add clock-cells property
Date: Tue,  3 Sep 2024 16:22:42 +0530
Message-Id: <20240903105245.715899-6-karthikeyan@linumiz.com>
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
X-Exim-ID: 1slR9k-000Elu-2p
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41440
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 52
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC6Ks6SWbFMat9F8VPFzZWn45eYVL100V/P1aWZDwtG6AIL1PMYnDTA4cNRO4WxYnZf3YEQPN0o+Qq8x0I0nByzLhGtYKf9sLnScBcL3skoRSQ4yPhqf
 3JTbl70rVGI7KOMhPhCmowxDMk2gPgakJQI/za3RcvmK4cLbbkZYywtZrvQ2LBeyh3I6w/tZ6SioaVL3h+CMMpbtMlk6hznRZlY=

consume clkout from rv3028 rtc which is able to provide
different clock frequency upon configuration

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---

Notes:
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



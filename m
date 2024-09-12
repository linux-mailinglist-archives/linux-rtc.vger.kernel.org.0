Return-Path: <linux-rtc+bounces-1967-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92115976BFC
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 16:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47DA01F2832A
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F2B1B983E;
	Thu, 12 Sep 2024 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="PnMS2fKW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56B21AD25F
	for <linux-rtc@vger.kernel.org>; Thu, 12 Sep 2024 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151180; cv=none; b=ZIsk6iX9unHH1jBi0v509HVwmFPbAkgVbi+fr9wE5zDS4YLPox9dsHbGSU77DNJgnwfoC4eqWR8IP9M7UZpJuHl/KTWK0VswuGPS6n9oszuLOKi6ChnSLVTUz8hAI/1KTSAhySNJws5p5qyJ52mFQfeISwqVMQkf8mAdxCffFpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151180; c=relaxed/simple;
	bh=xU6lCVd7JMgGzN64i/PH95a7uv8SV20ack91HmiXy4c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HnPkNGn9d1RDgjAgP9E7ZuEJjYj7Iu12Qy4XSZqP0KJ0fE9S6x0ZuTp/Wc1veD1Dd3WJ8EAyGZsokUNhbHD7Ll9Z6hZ0ZuK1NsyywaNl61DMmBb0p4LaKZKOrx6/qQ/PbZYKSGxzc+msy9dBzpfsAJnUyIoVyKSmGCUNZqMEmMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=PnMS2fKW; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
	by cmsmtp with ESMTPS
	id obwAsBcPmvH7lokm0snDXg; Thu, 12 Sep 2024 14:26:16 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id oklwsJh5leieBoklys8coW; Thu, 12 Sep 2024 14:26:14 +0000
X-Authority-Analysis: v=2.4 cv=BoBWwpX5 c=1 sm=1 tr=0 ts=66e2fa07
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8 a=VwQbUJbxAAAA:8
 a=rT7NhT99x2eMfdz9cs0A:9 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7QXESs+8CADDwMHBZ3VYC8ztM/9Ainl2kfcfyQYyWuQ=; b=PnMS2fKWQUhAx4yHxWHjoFae52
	SeWWxPzAluF1D9reXvhcx7lU5SPgYr2znc7T0z12i7uX0fj1vLR3RUJKD6qbQSC3yiGR52p1LaBJe
	NdPq+mqKpO/G2smQaLERjTs2BtdXF45AHSXHpi3+PCs2PpwnFWx51oduYd4UIcV+mrGvFGWKv1a8I
	Ey+O3/xGELxCwhxGupuL0Afr4W5UT85DhQgkduJRGH5+TVyHd1LHnPej+r7CO+x2COW7EU4NLxQC4
	9XM9d9ZciHUBFIUJgD7bsBxV05mgDoOiwWzLNyZVSE6/xI0V+m/NZKaOx9ZcJg2mFjYxFjfCmgFDW
	4YsSux1g==;
Received: from [122.165.245.213] (port=41006 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <karthikeyan@linumiz.com>)
	id 1soklu-003n4z-2t;
	Thu, 12 Sep 2024 19:56:10 +0530
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
Subject: [PATCH v3 0/6] Add support Relfor Saib board which is based on Rockchip RV1109 SoC
Date: Thu, 12 Sep 2024 19:54:45 +0530
Message-Id: <20240912142451.2952633-1-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.2
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
X-Exim-ID: 1soklu-003n4z-2t
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41006
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 4
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMT75u3zjbdGLIJeX8sEvJPErjo70gCaNMhgw3l9OsAKKDUmZP8odJlbLOk3yd7IHyH6Tg6gS39XEAoOpOD6pOz7BvoNcHZgW8yFT0SDldGF0MVdnVm+
 0Ap7WvXeqHyOpU4A14FanLj9YrAolYTgNJbrV8chgSYL2ZfFYLD+cvdfrGV40698wH0l9zOEVSEAr5PoGsYaxz26Ekvl2BL7X34=

Rockchip RV1109 is compatible with Rockchip RV1126.
In this series, adding required missing peripheral in
RV1126 and its pin mux.

Relfor Saib board is equipped with 1GB of RAM and 4GB of eMMC
Pheripherals like Bluetooth 4.2, Wifi 5G, audio-codec,
ir transmitter and receiver, etc

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---
Changes in v3:
- Align to the comments
- Rebased with master
- Drop first 3 commit from v2, since it got applied
- Link to v2: https://lore.kernel.org/all/20240903105245.715899-1-karthikeyan@linumiz.com

Changes in v2:
 - Align to the comments
 - Rebased with master
 - Link to v1: https://lore.kernel.org/all/20240823153528.3863993-1-karthikeyan@linumiz.com

---
Karthikeyan Krishnasamy (6):
  dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt string
  ARM: dts: rockchip: Add watchdog node for RV1126
  dt-bindings: rtc: microcrystal,rv3028: add #clock-cells property
  dt-bindings: vendor-prefixes: Add Relfor labs
  dt-bindings: arm: rockchip: Add Relfor Saib
  ARM: dts: rockchip: Add Relfor Saib board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../bindings/rtc/microcrystal,rv3028.yaml     |   3 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |   1 +
 arch/arm/boot/dts/rockchip/Makefile           |   1 +
 .../boot/dts/rockchip/rv1109-relfor-saib.dts  | 422 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi        |   8 +
 7 files changed, 442 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts

-- 
2.39.2



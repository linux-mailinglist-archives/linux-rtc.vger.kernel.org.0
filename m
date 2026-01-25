Return-Path: <linux-rtc+bounces-5882-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKbsG99udmnyQgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5882-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 20:28:31 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A61AD8223D
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 20:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B59FA3019454
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 19:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DA52F3C19;
	Sun, 25 Jan 2026 19:27:36 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21232F362A;
	Sun, 25 Jan 2026 19:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769369256; cv=none; b=oH3Cr7V5DQs2H24Y7+u2bgPzvG3U7p7OMuMG/YlnU7Vz2DhbSvxGTz44UBqL5ZGm7qNxVFr29pA35mrcRuOgxZDf6JkCgKS4lro/PE/6GMbNV8nyrsymD/X9JJIMIYYGvKQFdyZlHiNchI2NYi6f5640BeEnUF66J8nEYyeNAjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769369256; c=relaxed/simple;
	bh=4t8pAjchiPg4fWHJX9Cj7G3AJ3395v7mH+Vn0jooNNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmCCQd69rFYefLzJkuKPe4If0R8CTLpa/bkuXy5gETKMUc2hARc18H45w9xwJ++9ZtE/Dr4MIXO+otcJuhJQV73VbVNuWfJXrEMDNKpHwvDXg+xJ1bwkpCN6x9UnerL2wzwbTDitJiZFSP3AcjvBYyXq/oz4eCKN5MytRZy4CAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: wnPn42pcT/+dMoRtP5XyRw==
X-CSE-MsgGUID: DLurGguZRMWHxrNwH9ALMw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jan 2026 04:27:32 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 41B084035223;
	Mon, 26 Jan 2026 04:27:27 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: renesas: r9a09g056: Add RTC node
Date: Sun, 25 Jan 2026 19:27:04 +0000
Message-ID: <20260125192706.27099-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com>
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5882-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,bootlin.com,kernel.org,glider.be,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.198.94.208:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: A61AD8223D
X-Rspamd-Action: no action

Add RTC node to Renesas RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 9fb15ca24984..494f0e5a83ab 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -639,6 +639,21 @@ wdt3: watchdog@13000400 {
 			status = "disabled";
 		};
 
+		rtc: rtc@11c00800 {
+			compatible = "renesas,r9a09g056-rtca3", "renesas,rz-rtca3";
+			reg = <0 0x11c00800 0 0x400>;
+			interrupts = <GIC_SPI 524 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 525 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 526 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm", "period", "carry";
+			clocks = <&cpg CPG_MOD 0x53>, <&rtxin_clk>;
+			clock-names = "bus", "counter";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x79>, <&cpg 0x7a>;
+			reset-names = "rtc", "rtest";
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g056",
 				     "renesas,scif-r9a09g057";
-- 
2.51.0



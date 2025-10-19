Return-Path: <linux-rtc+bounces-5101-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1359BEE219
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 11:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD0F189E531
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 09:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76602E62D1;
	Sun, 19 Oct 2025 09:21:47 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8377A2E1F02;
	Sun, 19 Oct 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865707; cv=none; b=suJxh1BeT4P2zgwIQ2NTfF2+qQYy3Jfe/LFI84N6JgxBptUBst6EFU7Snsj4Jpza8kiij6y88+RIXxl8jPgt+J/c1HPJ9I61+wX6xau4ilrKn1iwsNkjstC0yQzmMhFYsnQ3jBoacCH6iK4Aic2Lcd2fIVnq3DC6QZH6TzZeEQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865707; c=relaxed/simple;
	bh=V2ts+ss27AMPKx5zBuYiaGxJXEgw3Lrf4jTZZMbFgVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgzRMljeTITLPnwEC7SfjURdxYotGHRPRV1Nn8oFmQ2V27W5C9XMx5p/vejhMZsPcdKAgWUMwYxj6L/58VD6dgdrVOBos3stk2Tj1fo9BeLWG5Sqav1FSXpDg8vpm9N7wcIC2bDvpRfy6wTKRwbjZIukMQd57VlHIflLqrryTQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: EOB6rY5fRkelViYbh5Zp7g==
X-CSE-MsgGUID: s+L7ohXJSnK0InUxaKXS9w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Oct 2025 18:21:44 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E31E0416123C;
	Sun, 19 Oct 2025 18:21:39 +0900 (JST)
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
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC
Date: Sun, 19 Oct 2025 09:21:06 +0000
Message-ID: <20251019092106.5737-7-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
References: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable RTC.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index d0378c1c17a1..558270ad2ed1 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -408,6 +408,10 @@ &qextal_clk {
 	clock-frequency = <24000000>;
 };
 
+&rtc {
+	status = "okay";
+};
+
 &rtxin_clk {
 	clock-frequency = <32768>;
 };
-- 
2.51.0



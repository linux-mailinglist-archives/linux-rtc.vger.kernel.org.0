Return-Path: <linux-rtc+bounces-5297-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EB3C41B9A
	for <lists+linux-rtc@lfdr.de>; Fri, 07 Nov 2025 22:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4C17352813
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Nov 2025 21:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DF934DCF3;
	Fri,  7 Nov 2025 21:07:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11BF34DB7F;
	Fri,  7 Nov 2025 21:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549651; cv=none; b=FDSpET3qokpybxAxKgKjCTjfOH3daoEr2txKVY85ji463F2hPp9s3nk8f0EctEsfsNC7bJ8/I544znAyU7xX8C25yZodpxXGVFjDT4sASD5xzdAnFRMsOC0AzakECa39oO6q6CnobOZ0UETOis642jSWfg0ooTlAxO1tmIdCiVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549651; c=relaxed/simple;
	bh=RZil7nYEzSrNAf1EU1bKa08vAC8yB1ycRnCBTre+0sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJgWXI117LrtlLS99w5Mla5Ll6m0EgE5FR0dO+ksvMLcfX0Qj7M3d8r8yEUR/c3b2nm/mJQVN5Tf9XqxTCo8mT8nYg4ZkZ0W5zriTgabt3LRMtw8VKDZ+tRqsCmr+Dd4ygJSCQlH/9U7///FLSeOz+HGIdIussnLk8r97lsTYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 9kf/MmeoT52cxYDD67wmkQ==
X-CSE-MsgGUID: 6X0oIlfUQ9Ko04j76v8Gvw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2025 06:07:29 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8AF5A4007D1A;
	Sat,  8 Nov 2025 06:07:25 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC
Date: Fri,  7 Nov 2025 21:07:06 +0000
Message-ID: <20251107210706.45044-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
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
index 7fff8bea9494..99dfb40b6ea8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -407,6 +407,10 @@ &qextal_clk {
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



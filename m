Return-Path: <linux-rtc+bounces-5245-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F76C2BA26
	for <lists+linux-rtc@lfdr.de>; Mon, 03 Nov 2025 13:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E60E4EE893
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Nov 2025 12:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D89130B50D;
	Mon,  3 Nov 2025 12:19:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AC730DEA7;
	Mon,  3 Nov 2025 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172354; cv=none; b=f8XxX566E8A1SWHe5nqIWPV5c4gTBR2KpmB1oS9y5p8Kue7QX50FovVwTcEdw5j/RJLBnCdma9Eh18g7VORvG2Me29tdnZvCrj4GSCWbQOEOB1oMcFR2vXYZS77JM9ED3k/OQLV09bN2+1VszyVPaqkK0CazYwJh0N883VBu654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172354; c=relaxed/simple;
	bh=RZil7nYEzSrNAf1EU1bKa08vAC8yB1ycRnCBTre+0sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWueGyPQx+TJQOaj+tzsd18FnwaK84PMIh3wpyNimHeLagN45qKo6ebkMipKyBKs9mgfgjhKyvixo+H+qPToQrtWVFmFABl1X/3PMIVAaGw5MMDsXDZNvatUjN7ZtUmWWyN9smzOBuIdraSjJ4TDX9xEVhWyCn5q+yd0C+tEnmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 7RNec1IXQS+TIY2K8QFXew==
X-CSE-MsgGUID: HVZInHKJSNiU6mZ86jUAcQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Nov 2025 21:19:11 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.152])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2A2CA40065BE;
	Mon,  3 Nov 2025 21:19:07 +0900 (JST)
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
Subject: [PATCH v3 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC
Date: Mon,  3 Nov 2025 12:18:48 +0000
Message-ID: <20251103121848.6539-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
References: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
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



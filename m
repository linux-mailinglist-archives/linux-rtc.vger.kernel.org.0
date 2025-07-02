Return-Path: <linux-rtc+bounces-4431-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCB3AFAC32
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 08:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76B14189E336
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 06:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D508828642B;
	Mon,  7 Jul 2025 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PJkngwkn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC8628640A
	for <linux-rtc@vger.kernel.org>; Mon,  7 Jul 2025 06:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871173; cv=none; b=FKeP8LYdTKhAsIz2BflaDFchHCXfc11plwVaWS4dbAw8yaWlNIyxW3mQoivgYfdtZ4d+T4kOCtpxppv4a5GstCRPwUJFAOPRguKHqg19ivHol1j8eF//5I7Et7CLtZWM4TLlW/vQnEOedO8qwFR3RAxTFOFpMQjPnv//V3i7RM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871173; c=relaxed/simple;
	bh=R0zErDQAlhKqB1ch3yaRWGC7BSKkNxzBuYYWrRg7fR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=oO2zGkQmk3/mV51w4kRNvXfH5QRD4SzJrqJJFqb4KEntMb5wxBv+kUjBaT3s63iCGMvZalYdU7xrrYTcBxn7jwYpQGZJGoxy/ua7uMmeS0egSdp42JW8u/qIw20GaboKHWL0UHD4L+2bEeSXSULU67RIbf6/2jB1QIp+X9sDHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PJkngwkn; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250707065250epoutp04ca7c8f3d5aee6a0d127df35645796fbe~P5YwvrdHv2061220612epoutp04z
	for <linux-rtc@vger.kernel.org>; Mon,  7 Jul 2025 06:52:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250707065250epoutp04ca7c8f3d5aee6a0d127df35645796fbe~P5YwvrdHv2061220612epoutp04z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751871170;
	bh=YYdrXQSMiKMp947pWITrggtPzRMvT6aT+Gp3RFiLw6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PJkngwknFIXoYEMF98Rebai63RBEoEGdm7QltTOfnCFBZ08vmGLTZtZv4GzGjmHVj
	 iALYGwbSfFLnMH3Fud+m+Lx7imRkmImwbw4c2jrsfphFO3AROWkZUgbqAYtd3UzRzP
	 pBrHZ/R1NVJUPHOjtp7wf7su6Ui6G2Pc7YTnSWu8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250707065249epcas5p25c1941a17f3d64590a2ca263f5a7adb5~P5YwKt85c2809428094epcas5p2C;
	Mon,  7 Jul 2025 06:52:49 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.177]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bbFL56QLhz6B9m4; Mon,  7 Jul
	2025 06:52:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250702051533epcas5p28698c81b7ec141938f8808393c498cb7~OV1Z1a_zp0155001550epcas5p2y;
	Wed,  2 Jul 2025 05:15:33 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702051532epsmtip285aeb5d817009e53559900ec540e5e52~OV1YVtQig0268202682epsmtip2o;
	Wed,  2 Jul 2025 05:15:32 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynosautov9: add RTC DT node
Date: Wed,  2 Jul 2025 10:54:26 +0530
Message-Id: <20250702052426.2404256-4-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702052426.2404256-1-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702051533epcas5p28698c81b7ec141938f8808393c498cb7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702051533epcas5p28698c81b7ec141938f8808393c498cb7
References: <20250702052426.2404256-1-dev.tailor@samsung.com>
	<CGME20250702051533epcas5p28698c81b7ec141938f8808393c498cb7@epcas5p2.samsung.com>

Add DT node for on-chip RTC for ExynosAutov9

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi     | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index de2c1de51a76..5f5167571f7a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -106,6 +106,10 @@ &pwm {
 	status = "okay";
 };
 
+&rtc {
+	status = "okay";
+};
+
 &serial_0 {
 	pinctrl-0 = <&uart0_bus_dual>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 66628cb32776..e655212f6a6b 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -1633,6 +1633,16 @@ pwm: pwm@103f0000 {
 			clock-names = "timers";
 			status = "disabled";
 		};
+
+		rtc: rtc@10540000 {
+			compatible = "samsung,exynosautov9-rtc";
+			reg = <0x10540000 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtcxo>;
+			clock-names = "rtc";
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.34.1



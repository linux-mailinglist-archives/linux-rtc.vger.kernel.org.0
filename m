Return-Path: <linux-rtc+bounces-3233-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 198E7A3C05D
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 14:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9121A3AD26C
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC111EEA31;
	Wed, 19 Feb 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8cTVUV0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E07C1E7C23;
	Wed, 19 Feb 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972597; cv=none; b=pHWn0Igwh28VwxrciecMBZCf5JeHbk+SsB9JrK1LDBpp85AXlVHQAXU7izixGELHUeq/+S/QVZcapSzuuJxf8Kk4uq9Ad3Dcwq6WfL1Fw1UMarbVXYN0suPCcfSwO3BkPSUerYYJfyTQuB1ubzrbhKcjSc/qu01WflbM1XG9AIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972597; c=relaxed/simple;
	bh=nwsj4CidURS/EZrbUuMzdATKYlm1Szt4afCfuzWKh8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uq8gkrTlwam+qOowwopUPYvHtaBjILzQuHSFBcQg5LyijcFIbE9Xla3LiXkUode9qsJ/dDzugBXS85H6uGDDtvQyyM4+kSAfoLWFzn8+lQeGk7zkg6sJGFQjnWfvawMPz7tp2SP8wWNCdE5hMwxmp2CTEkvbsV304CQQbFeeQTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8cTVUV0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BBDC4CEFB;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972596;
	bh=nwsj4CidURS/EZrbUuMzdATKYlm1Szt4afCfuzWKh8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V8cTVUV0A08OVk8hDrK05zy8mj/oVhFOTq0CCgvqhwMDk7yPJ0QlNezVMSOEnCEkO
	 I0ta7hG34cnQfg9JlepjjfeDwY6AUXAJLE16UjOpUzk3HFFnVP/zrr6O3KdLDekxve
	 WDRHiVPjfway0x3VMOK79NErelGvGIv0vYe5YM+NWHUxNil4VB6rbs78ZPJaFo/bTD
	 JJitjEAvW0/eaeREhFB8y3OJHtSZ1PqG+we58IqK0ItT6Egoh/jH8IBXp2mzmSscZD
	 8BptSCq6ln6QoXvdMhtlSUnyTF5L8YeQOzwJkIlMb+qArM6/xzUcbfTZOPymSAGbij
	 xMmuRLsetkDmg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkkMI-0000000086h-1ex3;
	Wed, 19 Feb 2025 14:43:26 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Joel Stanley <joel@jms.id.au>,
	Sebastian Reichel <sre@kernel.org>,
	Steev Klimaszewski <steev@kali.org>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 5/6] arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
Date: Wed, 19 Feb 2025 14:41:17 +0100
Message-ID: <20250219134118.31017-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250219134118.31017-1-johan+linaro@kernel.org>
References: <20250219134118.31017-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On many Qualcomm platforms the PMIC RTC control and time registers are
read-only so that the RTC time can not be updated. Instead an offset
needs be stored in some machine-specific non-volatile memory, which a
driver can take into account.

Switch to using the Qualcomm specific UEFI variable that is used by the
UEFI firmware (and Windows) to store the RTC offset.

This specifically means that the RTC time will be synchronised between
the UEFI firmware setup (or UEFI shell), Windows and Linux.

Note however that Windows stores the RTC time in local time by default,
while Linux typically uses UTC (i.e. as on X86).

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Steev Klimaszewski <steev@kali.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts   | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 38d911992475..8000254f4db5 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1090,18 +1090,7 @@ &pmk8280_pon_resin {
 };
 
 &pmk8280_rtc {
-	nvmem-cells = <&rtc_offset>;
-	nvmem-cell-names = "offset";
-
-	status = "okay";
-};
-
-&pmk8280_sdam_6 {
 	status = "okay";
-
-	rtc_offset: rtc-offset@bc {
-		reg = <0xbc 0x4>;
-	};
 };
 
 &pmk8280_vadc {
-- 
2.45.3



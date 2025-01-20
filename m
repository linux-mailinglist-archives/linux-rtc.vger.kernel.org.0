Return-Path: <linux-rtc+bounces-2960-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C18A16EA3
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D732168491
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 14:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86841E5705;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivIfR5eb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881651E47CD;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384168; cv=none; b=EFymcAqWMO/wnTNGUBxQf88RVyM831sl43uRmhoMbhhosqDYEOIqO3+q2UhtDHYGY4Qp78BOqqpNAw09NfwdmjkZ7RSxrnutAoWg35U8ato7mdsNJX2d4bW+5eaeaKWHlvnKN5Ol3VZZorU+51j0JrYYM9Ww+Z3B3epGHiui87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384168; c=relaxed/simple;
	bh=2xVFRHUWfE9PJ70s7RfpZCcofH/jA5B1CaqMtdHej8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e38n3fbnr9HcOXJf7du914TXp+BCN8Y3YP8Q1oiUNsghdrcBRQNR8n0027aApNOARjNCHoGPOM65V9dtPb8eg84psugbSzOOBtbJNBzqxNcg7n8ZyEe7NWlVg+ivUIagdeo1VxyVSvQA+VYfA/pBVSQMwiEzMiZbEO0NSoH8nG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivIfR5eb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46C6C19421;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737384168;
	bh=2xVFRHUWfE9PJ70s7RfpZCcofH/jA5B1CaqMtdHej8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ivIfR5ebGw3Nn0sH/Wh9cNZUnDFmXhBR/172Q/KZvHWsBlRxR7BTbQIarE4Id+eWn
	 3j9SrXbMT1b1nOsD9rZ/OK4HvhpcjYghlespXddADB/kzxWpa4MCPRkPdKGoUND4CZ
	 qquwFQshBgnsNFE3r05OVWoUTpBg5ICL87zlFNOXXSlG5f71OXrIBLNdHfHD8GvK9r
	 y9k1K3YiTh+JFR9yGucO+BsmelY03DoHiBNzU1frDYWKrxQbLLXlc1ifHFDeYXxEBf
	 T0eKMXFPExDYp0tOvcOO1RDLiBlrLHaI+eJc0957dq/7mrXqUGiAI6N93fAE1B2Yr6
	 8K5aIlkOy6NqQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tZszL-0000000038B-31RF;
	Mon, 20 Jan 2025 15:42:51 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 6/7] arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
Date: Mon, 20 Jan 2025 15:41:51 +0100
Message-ID: <20250120144152.11949-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250120144152.11949-1-johan+linaro@kernel.org>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
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

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts   | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 38d911992475..66c39765225f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1090,20 +1090,11 @@ &pmk8280_pon_resin {
 };
 
 &pmk8280_rtc {
-	nvmem-cells = <&rtc_offset>;
-	nvmem-cell-names = "offset";
+	qcom,uefi-rtc-info;
 
 	status = "okay";
 };
 
-&pmk8280_sdam_6 {
-	status = "okay";
-
-	rtc_offset: rtc-offset@bc {
-		reg = <0xbc 0x4>;
-	};
-};
-
 &pmk8280_vadc {
 	channel@144 {
 		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
-- 
2.45.2



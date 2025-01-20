Return-Path: <linux-rtc+bounces-2957-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71BA16E9D
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8851887CED
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 14:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89ED21E47D4;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtpLca7+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1591E47A6;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384168; cv=none; b=iKMEL8uQWGvOajzOl2c7AFYMkOUOmoxgvV2PzbHrZEY+2YuEJ6VHkRGU11HkPgjR1/mYfqur+a9SP+sd8PEyW+NUaaW+tes/QWnoYN+yrkpZ2BFT15nz4FlnPUI1MhrXu62nfHQnmhAnYA45Dw509aoqxM1I5foJVJ/AeyDkT4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384168; c=relaxed/simple;
	bh=KMK58D4C+h2UQiZzzkAGki7tuZnIjmfF8XJycNxg1+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIMVVVa1Xin+u+gjCmC9H+cJTPh56RukOXkW+vUpz2MTVdVmq9nW18WgGM8kh7A0ufNZUx+/3w6zp54N3Vms27D3kZcTIx+O4ryHf+uKxH2kSxPAmk0j9kxcjJjPn9NIFlydJGz1xKLgiOUIlIw+lhxmhwlCS1ABUVVsGwdlNVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtpLca7+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7781C4AF09;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737384167;
	bh=KMK58D4C+h2UQiZzzkAGki7tuZnIjmfF8XJycNxg1+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FtpLca7+LJoU794TWx594cU3FiFgOVcZykF1TQizqJb4PM59yhkKZmfA2Ms9xDhwq
	 Ro9kV30cAv4teX8aUDNGKHIPC+KnTmiRTTif4FcfdrtplEaj7cO9AmsXHeabhqQUTL
	 /nf9ONJ2Z6M5NEmCAzl7X8Xb019V2zhPgTv5VNAI1SN2XkZONJfspyBaDc5E2yvCsl
	 5IRb+Fe0zLTMgtU+CpznROuVd95XZw0X3H0ahkefDQJp6eGhCiVvmd4eZAc9/lPdu6
	 Ul1R3sBZSNl4ACUMw7WAHtC7rWLu8MGeL8jesFu5O7B6mKwiRKPuW13R0TPQoOUpQI
	 1xRsXFvuVE5wA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tZszL-0000000038E-3MEn;
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
Subject: [PATCH 7/7] arm64: dts: qcom: x1e80100: enable rtc
Date: Mon, 20 Jan 2025 15:41:52 +0100
Message-ID: <20250120144152.11949-8-johan+linaro@kernel.org>
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

On X1E based Windows on Arm machines the offset is stored in a Qualcomm
specific UEFI variable.

Unlike on previous platforms the alarm registers are also unaccessible
on X1E as they are owned by the ADSP.

Assume all X1E machines use similar firmware and enable the RTC in the
PMIC dtsi for now.

Based on a patch by Jonathan Marek. [1]

Link: https://lore.kernel.org/r/20241015004945.3676-4-jonathan@marek.ca # [1]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index 5b54ee79f048..051fb3a304b9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -223,8 +223,8 @@ pmk8550_rtc: rtc@6100 {
 			reg = <0x6100>, <0x6200>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
-			/* Not yet sure what blocks access */
-			status = "reserved";
+			qcom,no-alarm; /* alarm owned by ADSP */
+			qcom,uefi-rtc-info;
 		};
 
 		pmk8550_sdam_2: nvram@7100 {
-- 
2.45.2



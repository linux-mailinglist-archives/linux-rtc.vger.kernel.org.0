Return-Path: <linux-rtc+bounces-3979-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40E9A981D7
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 09:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 526CC5A11B6
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 07:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD93226FA55;
	Wed, 23 Apr 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODGa/Wv0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922026F444;
	Wed, 23 Apr 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394841; cv=none; b=b65t444dzbDreM9H8JEhVr0t2qUzSnHijl8BUdXDOs1VyQZFzXI3xbtvCJQrmDMsap2YHJoB1lsjbOIUr6fUz0RgW1/wKPwyaUdXNSVX5zA+ssZ4keBkyzwdWmuhU1aVnFDXWdPn2NFfk3N+NEfR8asBeh+/Y2EiY0q2wQh5utU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394841; c=relaxed/simple;
	bh=wZmVIbw/lQthHIrwcOBgr2yuApg1OYgWGTelA61EH1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYP/cZgRyJ/+CTj2/RPWCe8qnwHQC27uoU7gUcfdnvsy/dxRqY9xRBPmemdpO+VBuvjiyIqrmvoHJ+C/IIFsQ69nv4a/GNkP7JZbTCeAIPeV6O3GwbcnRC4SOUpFdd5pI7qQbTVnsN+VMd5mpGq1jpzn4Rtn+igWM8lAardBFag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODGa/Wv0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4031C4CEF9;
	Wed, 23 Apr 2025 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394841;
	bh=wZmVIbw/lQthHIrwcOBgr2yuApg1OYgWGTelA61EH1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ODGa/Wv0EW6YjAydX6uA/bH14EN8i4pWoMUtptnE/kGBA9stKEr9HSH0e/h1WIt5R
	 +/vMRKsP6b1JP/BbQCp8BsvrKcwJ8BkejO6fkmmu4gtPNTZ41RIxbHB9NqK3mrYvpz
	 W33YK/awH668yE99yI84SgHdr5x4QHwhS+eGqmSliVhZVOTxgKTrRDMdUCI57njzz9
	 Si3LD0xuygUSVBmbEkH10dxOP1rIISDg8eF+ohuXzxYhlOR1OeKgjfxSYe/2tT5keK
	 qEj3viucpCdJirsII+oswJpGtDPlrkZyBM4H3xo9FdWgq9DeZwKHUhc25vhoNTO23L
	 gbbSt0f6anfNw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Uvf-000000002xH-2Def;
	Wed, 23 Apr 2025 09:53:59 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sc8280xp-x13s: describe uefi rtc offset
Date: Wed, 23 Apr 2025 09:51:42 +0200
Message-ID: <20250423075143.11157-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423075143.11157-1-johan+linaro@kernel.org>
References: <20250423075143.11157-1-johan+linaro@kernel.org>
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

On platforms where the offset is stored in a Qualcomm specific UEFI
variable the variables are also accessed in a non-standard way, which
means that the OS cannot assume that the variable service is available
by the time the RTC driver probes.

Use the new 'qcom,uefi-rtc-info' property to indicate that the offset is
stored in a UEFI variable so that the OS can determine whether to wait
for it to become available.

Fixes: 409803681a55 ("arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 8000254f4db5..66c39765225f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1090,6 +1090,8 @@ &pmk8280_pon_resin {
 };
 
 &pmk8280_rtc {
+	qcom,uefi-rtc-info;
+
 	status = "okay";
 };
 
-- 
2.49.0



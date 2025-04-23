Return-Path: <linux-rtc+bounces-3977-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D293A981C5
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 09:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A63EF7ABE60
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 07:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858B526F464;
	Wed, 23 Apr 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sqma4gES"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FA826D4F6;
	Wed, 23 Apr 2025 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394841; cv=none; b=erY9ohq6X0s/74RiB34ehLJ1LxiEod1Z+doGzxUkZKU6MXZhmQmKBd19yRNHm59kWPOlJuxGE+KohrkNm56Pgn1SW/oh1SNmlTR6S5py7isgAL14CbiGeLhR0C8/l8vWBHoKlh8IA8mGl8hiQ9l5qi6fq3rE05zJrmxoWRJiD9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394841; c=relaxed/simple;
	bh=2vwphhkHgVALJXaVfVrnaAzNXFpIgz4zKU/4c4LyDyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jpq47G/imumWu7L7wd6rsumeF50d9+Zf5WAeTGEkS2smDkmUwiuRhYtxHU69NpjE5xIGK3ohLEf3bgURRq78NzfaeMcHT3g1KNsmeFcuHUfpvQUY9vW63zVNQY+cFpnxnDnJEh6OEN82GBnFGk+0ILLIn2uFVZG4gyRb4Rx3MC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sqma4gES; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8877C4CEF0;
	Wed, 23 Apr 2025 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394840;
	bh=2vwphhkHgVALJXaVfVrnaAzNXFpIgz4zKU/4c4LyDyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sqma4gESzk15tGVofga9Q03bD/qnLJvWwgHzFPFRbFECvaqnPkyP13kMy5nM1mmJ3
	 oOD9MpJrB++4qugTHey4jvkYCQH1W15K5ql0Tdmc4lpECDVtZBLO53pVBmJ0iGVQpu
	 4nKlb0Dd9P4RtRKJBRrIOI0VpaRJ6hh34mUFN9FcqAYgt5N4LsHXb2NLNjtpp/iN0a
	 60hEbLPgfc5G1qtly/MGHncmHqmVKtK7C764q40JV9OPyfRRmImW/3ZygXprE/+jew
	 vD7nLtST/evy6Dp4+Bg2oDm3lsasr1xcJj8jmDYuOXdS8GJQacv4wOs01C2lN6VSSU
	 F0JSWkg1JpEIg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Uvf-000000002xJ-2Y45;
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
Subject: [PATCH 4/4] arm64: dts: qcom: x1e80100: describe uefi rtc offset
Date: Wed, 23 Apr 2025 09:51:43 +0200
Message-ID: <20250423075143.11157-5-johan+linaro@kernel.org>
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

Fixes: b53c2c23d3c2 ("arm64: dts: qcom: x1e80100: enable rtc")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index a59aa8e7642d..5a170238e74d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -224,6 +224,7 @@ pmk8550_rtc: rtc@6100 {
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 			qcom,no-alarm; /* alarm owned by ADSP */
+			qcom,uefi-rtc-info;
 		};
 
 		pmk8550_sdam_2: nvram@7100 {
-- 
2.49.0



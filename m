Return-Path: <linux-rtc+bounces-3976-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE239A981D2
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 09:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4917C3AE624
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 07:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6B826F445;
	Wed, 23 Apr 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="keRBghCG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB726D4F5;
	Wed, 23 Apr 2025 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394841; cv=none; b=CI7mn8NPysRBf8/TQXL8NnoffPIgTDcb0XMSajaBFSzOtbWRkDB0vePpM0dYcalLSdzOxFcXFjzdLMo1bac69ZcO0axf2pEiuSX7fHYUWff86nltPa+vDYWiqf6ic6tHaocK30zg01pk82vskhUbAmcbxwo2LBM+7wBiXfC9Nj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394841; c=relaxed/simple;
	bh=zDte0/iXQpDSnWpaIOv5baQ9jRG/g3Ee05V6cmpgp+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVxO0ooEXXzDtvhAHHiRSPcOLxNDAzq9Xpa1he6kbiPHZROEzk0w5EUUj54Vic5S7Ody3Jv9BL8L/PQwF4gR/dPUx7cogW2M7yRWRcjtxym6xf0plxFbZ55VedBdpUUpY+hjE3XJEbkbmr43qJVFVA9gvUW12m62fx3E2v5GMt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=keRBghCG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2E9C4CEEF;
	Wed, 23 Apr 2025 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394840;
	bh=zDte0/iXQpDSnWpaIOv5baQ9jRG/g3Ee05V6cmpgp+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=keRBghCGdWmUHzXz0BO6ocH91FuuEBSS1x1hpBzecyLMYSfIXvkWntlx6DsrUiIVr
	 hqWf6wlJvKjlROruVM2B5Ab7MsX2gp+kld7415IK6fxUoGJ6BqB5a6NF13PTKy1P7+
	 t265R0lg6BftcJJIveV3fw4Bd32RzagGEhGTNaVD5NPGnWCxqijZfcHgB0BZL/gxUO
	 EHYsGgQnzbeOXE2TkrxjucinRGQJiSB+ytmidQU2gvZZdQI8wZIJJZZMaCqDGFDmqM
	 o7IP/yu2/2I1jIKDFPaiOpahztGMP1uZSQrciUZcJwCpgKuJZ5m15MUiUaOI+yii9A
	 7hbR4gLuPNusA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Uvf-000000002xF-1tA6;
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
	Johan Hovold <johan+linaro@kernel.org>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/4] rtc: pm8xxx: fix uefi offset lookup
Date: Wed, 23 Apr 2025 09:51:41 +0200
Message-ID: <20250423075143.11157-3-johan+linaro@kernel.org>
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
by the time the driver probes.

Use the new 'qcom,uefi-rtc-info' property to determine whether to probe
defer until the UEFI offset becomes available so that the offset can be
used also when the RTC driver is built in or when a dependency of the
UEFI variable driver is built as a module (e.g. the driver for the SCM
interconnects).

Fixes: bba38b874886 ("rtc: pm8xxx: add support for uefi offset")
Reported-by: Rob Clark <robdclark@gmail.com>
Link: https://lore.kernel.org/lkml/CAF6AEGsfke=x0p1b2-uNX6DuQfRyEjVbJaxTbVLDT2YvSkGJbg@mail.gmail.com/
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-pm8xxx.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 3c1dddcc81df..5da237e7b9b2 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -576,13 +576,20 @@ static int pm8xxx_rtc_probe_offset(struct pm8xxx_rtc *rtc_dd)
 	}
 
 	/* Use UEFI storage as fallback if available */
-	if (efivar_is_available()) {
-		rc = pm8xxx_rtc_read_uefi_offset(rtc_dd);
-		if (rc == 0)
-			rtc_dd->use_uefi = true;
+	rtc_dd->use_uefi = of_property_read_bool(rtc_dd->dev->of_node,
+						 "qcom,uefi-rtc-info");
+	if (!rtc_dd->use_uefi)
+		return 0;
+
+	if (!efivar_is_available()) {
+		if (IS_ENABLED(CONFIG_EFI))
+			return -EPROBE_DEFER;
+
+		dev_warn(rtc_dd->dev, "efivars not available\n");
+		rtc_dd->use_uefi = false;
 	}
 
-	return 0;
+	return pm8xxx_rtc_read_uefi_offset(rtc_dd);
 }
 
 static int pm8xxx_rtc_probe(struct platform_device *pdev)
-- 
2.49.0



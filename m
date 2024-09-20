Return-Path: <linux-rtc+bounces-2033-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3747A97D00F
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Sep 2024 05:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98B61F24CAC
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Sep 2024 03:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFBDF9CF;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4U8/yxe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBECD10E5;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726801858; cv=none; b=h3lQnYU9lB6gSWdJZpandHzFimlK14ml/mBqv9JBgk7hr+hXiht4bgHJjNZuU/C8d82mEP9awcGasl00u3sF/9dn1FT6Bq3tOVDFFCpVUC8/pV15FI07KLB8ZMbiSqZ7xJzGKugQlKWSbuRzGrxbVSh8I0CXCJRCJ50UGAAtzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726801858; c=relaxed/simple;
	bh=a/hFCgDZqsbnUBYLjL3wvxEJ7t4hBd6dwDs0Oy9yB58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZL/iMz4hY57KKpmzokJ3Ae+DYK3d3PeWVPX1SptxfjaVRsYE6NeuuZXBnjHFHPDGuX9ZSvy5Llas8VydS4F93HrtwDEF8OIm0SR15uhwQmf9ZhzRaZL0uYUpn31IW8lfCms2h5zJ4Hhgp1yS8o0RWvPJH+nH28Tl5+iuWbxEV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4U8/yxe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DBD5C4CED0;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726801858;
	bh=a/hFCgDZqsbnUBYLjL3wvxEJ7t4hBd6dwDs0Oy9yB58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J4U8/yxen4D8YM7iisKEdcQ5GJyH79XM7di0TDTXzM/bxGbMYyfbbDNaWU9rQUsGJ
	 zpbkJajaIKrP+e5/MMbM74iW6ytKSMxno0PmrilaTEYiMRlGu/N0x0nehEy8TUrSsK
	 MNnShEweIJMTPIfafyM5yaqhLKVBbkX1A6wpRVHnkpWDeY9zMt4zEtsSo9K/O35Y2I
	 98nxwMra6eVXcs9QmgPHCX6UcFUImpAXEiPLj+mB1Gpig1ibS1Kogx22qqmN0Eokn6
	 3fvYKQoMuSooSOhp0MTRHf2kRmDPkVi6/Vf/wzXc1cf7iCzFBjliE5eYW1CJIs0UwG
	 40CdfobfRtejA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BACCE8D75;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 20 Sep 2024 11:10:58 +0800
Subject: [PATCH v4 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-rtc-v4-3-91ae5fb4e3d5@amlogic.com>
References: <20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com>
In-Reply-To: <20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726801856; l=931;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dltl4Bg5cOWUNAG/8WRhVbXcztZ3rrpVcPR+gcSx/Bg=;
 b=Yx3qxfnCd8BhpKgGeHbhtCGrW6gTAHLOfhsHGGU1QIRV2w/mGl+7JUluQ3zbldVjy/MnjEzXd
 w4izZZ/GnX9CeGWhwbsfQHBVWygA2eBKdvuSItHkUUNyVfuDl5Yp46r
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

Add Amlogic RTC entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..f595715eb3e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1163,6 +1163,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC RTC DRIVER
+M:	Yiting Deng <yiting.deng@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
+F:	drivers/rtc/rtc-amlogic-a4.c
+
 AMPHENOL CHIPCAP 2 HUMIDITY-TEMPERATURE IIO DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.37.1




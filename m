Return-Path: <linux-rtc+bounces-2527-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6F29C4D2F
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 04:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08423B28CE6
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 03:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCEE209680;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/bIjYvF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A89207A14;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731381018; cv=none; b=ChxCXJNTFZ8lKUqri86JPDWGwQgVsPYIRPL+i/cLhv2wBSGwIpVufe78RbzRxgiSkKnppVSFuUS4NrxRZIeZ6V+MVzkUUOI/ApYTnifDJYgh1O2rEEa2/deFaXDUOqQg/nCtkEq8fwkFn7HsITZZDJ42vdMxmmWbyND8nhTEWnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731381018; c=relaxed/simple;
	bh=SVIUbQzxLofeJMLFPpkqoKqNt1gn+vEU3tlnN8KXr+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5LkHiyrrUBDY/zMo1dV8Oj9/GfxRwBcW2eRnNCSmiBMas4GuedcYySxDxg5MHLbNtZfN64tB3fam3Wai//LGqrqXMRa9HORB4+8RviVtU8FegWW5cBWpTpEhnIdP7+9zcOaEWZNA5P1gVKenYb3gtrvEWCQWN4yQw1YgCLwndQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/bIjYvF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30992C4AF10;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731381018;
	bh=SVIUbQzxLofeJMLFPpkqoKqNt1gn+vEU3tlnN8KXr+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f/bIjYvF/nZ6o8Fps/kS0C6UFlZGwQfhJQJFusR+oPfENGgTR4OBf3xHRqR2/tl3g
	 8TdiuyACyJFkOGzPFS7kZuAnisEELWIVeh93VhQ2CWE+P5uMzCkwekrs3qOLPbDLv3
	 pWbA/mhzb47wehubpIGLLwhpXTwM5C3VQ/fLCUNC/nYwqfeh3UWRRyDaS6MWGaegaB
	 IKRESnm7mYDZ8kOTjZBo7r0MMPYX6zS+JjREpv2yjPj1WVyI1fwO2buFwArKPYRgT6
	 419mWbNNm5cCs5fq+JxlipvX5MSPlv6t6JpmflyFSDoOlJ4V7GvYuHKkVTujELmKl1
	 Jdl/+8uce7Brg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23621D41D4A;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 12 Nov 2024 11:10:16 +0800
Subject: [PATCH v6 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-rtc-v6-3-a71b60d2f354@amlogic.com>
References: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
In-Reply-To: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731381015; l=931;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Gn6Ya+wBxnc2VJ4I38RsdaXoWkK7Fe7p7YGOFyMiaMc=;
 b=+Dw8a0HzDmMQJH0sX/GRskjZ9a1Mnzshf4iUIbwZucRCh5cCAlPCMBtlUipbZEhPVHUJ3xxnW
 2H0vSdoXjj+CyrfUG7XGEHEV5JRpAo+xjxFQauP3Z7uASm7Pr1sUd+i
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
index c27f3190737f..86675e03888c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1209,6 +1209,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
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




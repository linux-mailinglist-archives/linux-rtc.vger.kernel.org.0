Return-Path: <linux-rtc+bounces-1917-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0451973228
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 12:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 933B2287C52
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 10:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7B01991A0;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuEm+DEL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BD18C03E;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963260; cv=none; b=CaJpPkWVNoDlSVKvlOVZU5hUzZdrfv28vlaZhhrwoFvMKW4ppJhNvFhxnTdr4YJCgoAGgSRNfy1M/qaRCoDL9s+RQxkE40QbgTWeFa5fkRPfv6tcjeeVBJl0+3ZjAuS8xkiq7Ik45boQjY+wBhElUqlAnp56jHzUkc7n6Vhjiak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963260; c=relaxed/simple;
	bh=a/hFCgDZqsbnUBYLjL3wvxEJ7t4hBd6dwDs0Oy9yB58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X9JCT/9wwtSW8sCic8utRIELrwftN7mPqIPuMXHHNtoKF6QR46el5kBZ0mcHlhs0CZkjmvO1wdgcSdChdJpdapOwnumv2ImMTRpMLHVwtGoQuHjW+kXHf2OjzFhiDy+19NqjqS0Dx/Ult1FXL9RkVSgvtexrfJVNoDNe6FprakA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuEm+DEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AA0AC4CED1;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725963260;
	bh=a/hFCgDZqsbnUBYLjL3wvxEJ7t4hBd6dwDs0Oy9yB58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZuEm+DELevIWXJ2Zf8m1LccFIPt8g/KDhqEfbaH+OzEr6bqRgsCuTapJhl/oByGpc
	 QU3QpNcszCVdA0nND8qzfEFYmIMdsL9rbuKNMN0+KmdDJRDTE7En6rVLknMTvmTCEi
	 Sa7Ef093fWr6xS2hNCaEwmLLu0TSna1E52tSr2oTSNkTIUSLytYtXdMvvuib2Ut7z/
	 IcOCP1cMqdPqkWVycnExTdgDG/4XXRxOeLKJGiW/4bXza7lhIb6HUf5m5jlJDtqKHn
	 DAnNz1MVrmeNuPj4PV+3glV/FOl4kHHmh7pXzzc6YQnnMxiEJ4Bp5BcybB9MCDKy4t
	 iuKHKdJniLeOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840F5ECE564;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 10 Sep 2024 18:14:20 +0800
Subject: [PATCH v3 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-rtc-v3-3-1fa077a69a20@amlogic.com>
References: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
In-Reply-To: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725963258; l=931;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dltl4Bg5cOWUNAG/8WRhVbXcztZ3rrpVcPR+gcSx/Bg=;
 b=MoifP6YCT9C3dZb9ivv6Aih+92TQ3cZzveLbNoTe8lEriWxZ2A1dOQh8bQFEFlFlAj5pPFVwV
 JabA+WhbHG8AZ2PTY6eI1RzEQcve+obFcYNY4nCd+s5gR5USV5Tdxpy
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




Return-Path: <linux-rtc+bounces-3267-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22787A4463A
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 17:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 519CD19C1928
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 16:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1CD14A60A;
	Tue, 25 Feb 2025 16:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X38ywIVM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2E4430;
	Tue, 25 Feb 2025 16:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501272; cv=none; b=CHmoMl5RwPWkFqnUS2X8qkhlR+CMiXi8J7FtDgcozzmlcbm8EyxyGbu9/mb5NzO1dI6OE31f4e2X15nMOHZC2HWnPjIUksAz60uIxLlrtfQS0R/3vQ+LKcLW1Qgl7QFXE7X0XC1R0pZ9jjsdNQ+VS+bRYEs8UysV81dP3jjCjYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501272; c=relaxed/simple;
	bh=ZVN2jAp//1Bi4NTUQhstv2rOQhLKNMFQYilgLnPa2/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EqGvwLl185yQ4nAGKct9BlBdg/S1MWCQ9xQ1HFgy9HhQKSLaBzyfSr8h7q+GI0jl6Ku9RBa584ylqBEod8j+tU8KGIOJgnsvhYbFAq0Ej6DeWs2ycp3yGC/N8kWbAnEzYWJqucoZHOxOxUw7W5UqlSEUtgsGEto6qL1QL7nfds4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X38ywIVM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0427C4CEDD;
	Tue, 25 Feb 2025 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740501271;
	bh=ZVN2jAp//1Bi4NTUQhstv2rOQhLKNMFQYilgLnPa2/c=;
	h=From:To:Cc:Subject:Date:From;
	b=X38ywIVMtP//6KCeIy2RZFW8cZM7+RaTV9cySuvfYWciBnyPRJWNKP8QOSzyTUkoD
	 nd1aM3uJX4BOg8bfwQ+LdEfdTIS+p2R/gtTTCx1Rh/KBdw2Wzt4TO4uF+tSaqAz98b
	 StkONQyWmd1akwfKSW6XR+vZvQ7b/nq2ERLyQ1mtlBszObr9XxZJDdWxteahBlgKS9
	 BnO8/RNF4w8TW9qLjoH/XhSfsPQfqrRjndGHpmohx9X2Ugrl+k1VFeNWcmjVfYUdTd
	 jNIE1pcUSeXrpZj6kuTyo9Dl1bqcdCaRnw7SJA+YzDHwEmHRFJzDR4kizW8SPVSbTq
	 sXBjodpHmGWDw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: fsl-ftm: remove incorrect ACPI_PTR annotation
Date: Tue, 25 Feb 2025 17:34:19 +0100
Message-Id: <20250225163427.4168570-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building with W=1 shows a warning about ftm_imx_acpi_ids being unused when
CONFIG_ACPI is disabled:

drivers/rtc/rtc-fsl-ftm-alarm.c:312:36: error: unused variable 'ftm_imx_acpi_ids' [-Werror,-Wunused-const-variable]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index a72c4ad0cec6..12da7d36e520 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -320,7 +320,7 @@ static struct platform_driver ftm_rtc_driver = {
 	.driver		= {
 		.name	= "ftm-alarm",
 		.of_match_table = ftm_rtc_match,
-		.acpi_match_table = ACPI_PTR(ftm_imx_acpi_ids),
+		.acpi_match_table = ftm_imx_acpi_ids,
 	},
 };
 
-- 
2.39.5



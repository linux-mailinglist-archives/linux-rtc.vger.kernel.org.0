Return-Path: <linux-rtc+bounces-1637-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E79942107
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jul 2024 21:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE5CF281869
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jul 2024 19:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44FA18B479;
	Tue, 30 Jul 2024 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X64ADXox"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845C4189904;
	Tue, 30 Jul 2024 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722368955; cv=none; b=cWkXzgTf6ni6eLLmSKexJtO9D0Wg836Rhm1SVNktW7GZVMOCa2XjB0Z9ziAXX/PhnYdvbAGxJ40MO31j9utA3yDaAvos1zh2ld5NEk5JpMObpwpNNqrY94qf4aF8XY4Am8kHK0xN2HoKuQsH2hpmO3l8m0hRAmCWYThIxVD+j/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722368955; c=relaxed/simple;
	bh=ZRU/ils+M3BtFnjH9dt3Gff4powKMpDinTqwXofED/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MuTZAXZekdBKWzuHn+DxYJhia4jEryiknUw92XXm6TU/dJPczuRSj+wUzGG4nP8O1LHd2AhrZfsqtk1WAUHd20xB/BE/PKWJpd354+nyw8MH7BU+JB8G2hmJ/jzvjVL4eE8cDX7H6+CVUq9v+wsVs73v5PplMGmpaBHOhByv44M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X64ADXox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E8CC32782;
	Tue, 30 Jul 2024 19:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722368955;
	bh=ZRU/ils+M3BtFnjH9dt3Gff4powKMpDinTqwXofED/o=;
	h=From:To:Cc:Subject:Date:From;
	b=X64ADXox43umdsDRtMUpRKW31HQ1ZHNTX4onNoU0QNchkN4AhaVjUWfA07xu2aLC4
	 b9rEySAXMLu/tBW3zYfvpShp6p4Nx9QMdz6CcsoTWNZeNXIKVbExJ+nEdRyd/MAHTJ
	 gtU2z5iBWHnU/F9XU3nKc78GBxyyDRRoOXgp57GwQsWnL0e+sQTT21mm5MetY0pk6D
	 OonsdH0B0qzyonZ9PpZwRVp3ZPDELzoxXhOocWCk9VagG77Vy80usKCpGRVj/GjYA3
	 dt8I7zbc30I/IOyQ/0nd3FPce4fuPKvnP7B1r70YdQWd9q70iG7AkequpgsUIMAJlx
	 brMr/Et78jltg==
From: Michael Walle <mwalle@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] rtc: sun6i: disable automatic clock input switching
Date: Tue, 30 Jul 2024 21:49:05 +0200
Message-Id: <20240730194905.2587202-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V3(s) will detect a valid external low frequency clock and if it is
not present will automatically switch to the internal one. This might
hide bugs and (hardware) configuration errors. It's even worse because
the internal RTC runs significantly slower (32.000Hz vs 32.768Hz).
Fortunately for us, the V3(s) has an (undocumented) bypass of this
switching and the driver already supports it by setting the
.has_auto_swt flag.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
This is not tagged as a Fixes commit, because it might break boards with
an incorrect device tree. That is, if the device tree lists the external
crystal but the board doesn't have it the RTC will stop running. I don't
think this is likely though, because the user manual requires the
external clock.
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 8e0c66906103..e681c1745866 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -402,6 +402,7 @@ CLK_OF_DECLARE_DRIVER(sun8i_r40_rtc_clk, "allwinner,sun8i-r40-rtc",
 static const struct sun6i_rtc_clk_data sun8i_v3_rtc_data = {
 	.rc_osc_rate = 32000,
 	.has_out_clk = 1,
+	.has_auto_swt = 1,
 };
 
 static void __init sun8i_v3_rtc_clk_init(struct device_node *node)
-- 
2.39.2



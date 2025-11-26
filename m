Return-Path: <linux-rtc+bounces-5457-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC80C87AD8
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 02:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 47C7B354D04
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 01:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019342D7DC7;
	Wed, 26 Nov 2025 01:20:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395862459D7;
	Wed, 26 Nov 2025 01:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764120044; cv=none; b=EG6nVltWBZLaCmYq7Lzb5hl0GRzglXFHXIWAaZbHfwrRdL8qvaInlyRmPW/CsmhorLltJBojBEEzNSeotYUlAXOUgbFPPlOXM8XiMgxDRJ+hI2NgyF8BzSVUA5zmvJSc0Kt9AQtS4BWoRdQa1t8xGVqLL3cxSGiRyp65ToF9ZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764120044; c=relaxed/simple;
	bh=vuDjNzHtNm+8qyLrqifULp4b26GGpEBVCqbY+ekJtsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qz6oKVv4qmN8yXPp/G1QNetzL4g5kbrBrdK4SqElXKi4XD9xRFsxUUpLlc8Xwq9LiaOgq3t0PfH1lFE/nUE6wJzPAI0xGXYC1MEoPJH64ypWkBTmLHgBs/RrPjatTgODG428MfHuANkIXk6h1Q7ZB4a1R8k+zmxZhfWCLBJotxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAD38mPcVSZpT48VAg--.12017S2;
	Wed, 26 Nov 2025 09:20:30 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: linkmauve@linkmauve.fr,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] rtc: gamecube: Check the return value of ioremap()
Date: Wed, 26 Nov 2025 09:20:19 +0800
Message-ID: <20251126012019.1003-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD38mPcVSZpT48VAg--.12017S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyDCF1fCFWrJw18Jr4Dtwb_yoWDCrgE93
	WfWr13Ja98Ar1DGw10qr1fZry5K3Wv9r1vqr4Igas0kFZ8urnFgryIyrsxGw4UWa4akFn8
	C34ayryfZr12yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
	IFyTuYvjfUezuWDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAURA2klxbZy4wACs3

The function ioremap() in gamecube_rtc_read_offset_from_sram() can fail
and return NULL, which is dereferenced without checking, leading to a
NULL pointer dereference.

Add a check for the return value of ioremap() and return -ENOMEM on
failure.

Fixes: 86559400b3ef ("rtc: gamecube: Add a RTC driver for the GameCube, Wii and Wii U")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/rtc/rtc-gamecube.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-gamecube.c b/drivers/rtc/rtc-gamecube.c
index c828bc8e05b9..cd7714437107 100644
--- a/drivers/rtc/rtc-gamecube.c
+++ b/drivers/rtc/rtc-gamecube.c
@@ -242,6 +242,10 @@ static int gamecube_rtc_read_offset_from_sram(struct priv *d)
 	}
 
 	hw_srnprot = ioremap(res.start, resource_size(&res));
+	if (!hw_srnprot) {
+		pr_err("Failed to ioremap hw_srnprot\n");
+		return -ENOMEM;
+	}
 	old = ioread32be(hw_srnprot);
 
 	/* TODO: figure out why we use this magic constant.  I obtained it by
-- 
2.50.1.windows.1



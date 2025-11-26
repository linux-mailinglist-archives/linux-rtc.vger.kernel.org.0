Return-Path: <linux-rtc+bounces-5460-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4EC8890D
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 09:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9BBEE34ECA5
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 08:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF9C2DFF19;
	Wed, 26 Nov 2025 08:08:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC802877D9;
	Wed, 26 Nov 2025 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764144493; cv=none; b=ItbMj8XA5EEYIIpYpdIU0TIzVcvmGER6jT2abXEo7jaPVWK2p24x5n3tK4wZx9F7SO/0aPhNmnXqyyiEoMuM4h6Obd+lm4om+5R5UfiakaY4KxYVZ1OMMm9Dm8c3cQ6jcMb5CYHG/3hEqdFQFg25BF3KLfFRk75TTWrLH2h5eYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764144493; c=relaxed/simple;
	bh=yJuCDJrubsdVZ4oNI+UtuTgwl+CbqRIvOM+kQ9MR/Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qwh2qSpteuRTfokf9AFUgZRo5RgO3K4hSXC1cz/sqlqU/jSDNX3la0PB8Yr/8FN7JCJODuHE+p8VsDNhOY9HNsRQWIjM4Boj2gJqKuUKaHPdBUY90jHBihBVrQhtwmY+APG6qVVEMHB0Zg/eISriHj5PdOSL/ZXPXVDwSwGnaSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowADXXtFhtSZpG64hAg--.9376S2;
	Wed, 26 Nov 2025 16:08:03 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: linkmauve@linkmauve.fr,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] rtc: gamecube: Check the return value of ioremap()
Date: Wed, 26 Nov 2025 16:06:25 +0800
Message-ID: <20251126080625.1752-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251126012019.1003-1-vulab@iscas.ac.cn>
References: <20251126012019.1003-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADXXtFhtSZpG64hAg--.9376S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyDCF1fCFWrJw18Jr4Dtwb_yoWkGFgE93
	WxWw13Ga90yr1DGw10qF1fZrWYk3Wkur1vqr4Iga4YkFW5ur1qgryIyrs3Jw1Uuas0kFn8
	CryIyryfZr12vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcBMtUUU
	UU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwSA2kmkL2FngAAsi

The function ioremap() in gamecube_rtc_read_offset_from_sram() can fail
and return NULL, which is dereferenced without checking, leading to a
NULL pointer dereference.

Add a check for the return value of ioremap() and return -ENOMEM on
failure.

Fixes: 86559400b3ef ("rtc: gamecube: Add a RTC driver for the GameCube, Wii and Wii U")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
  -Use lowercase for error message to match existing style.
---
 drivers/rtc/rtc-gamecube.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-gamecube.c b/drivers/rtc/rtc-gamecube.c
index c828bc8e05b9..045d5d45ab4b 100644
--- a/drivers/rtc/rtc-gamecube.c
+++ b/drivers/rtc/rtc-gamecube.c
@@ -242,6 +242,10 @@ static int gamecube_rtc_read_offset_from_sram(struct priv *d)
 	}
 
 	hw_srnprot = ioremap(res.start, resource_size(&res));
+	if (!hw_srnprot) {
+		pr_err("failed to ioremap hw_srnprot\n");
+		return -ENOMEM;
+	}
 	old = ioread32be(hw_srnprot);
 
 	/* TODO: figure out why we use this magic constant.  I obtained it by
-- 
2.50.1.windows.1



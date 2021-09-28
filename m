Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02D041AA5C
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239548AbhI1IGG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:06:06 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:55223 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239330AbhI1IFa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:30 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 9AF912B0161B;
        Tue, 28 Sep 2021 04:03:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 28 Sep 2021 04:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=dEiHNKK1pcUTp
        srgmvewxSpAPrBEKgL3rrGk/Y3A02Y=; b=hR5m5FUxINrVN0qjHK//RVSl9tDCw
        Nlfq+Uk1Nt2MzA9H4e6PjUUb8MlLUxCaN3zFwXXzlLeijGpYpLcmm+gnLQUr7Xpe
        QVZDIQozjnzcWBAhkgJTOmYhIsu2Vg7QPOdxJxLhNR5fjofXWDrLvdLMjs7hUmf+
        gYPR1lkxM9WxLFBMR5hR7iuq9rHY5/zxH48lw99PnWaK01s7M7aktkmn3NUbcgQc
        d9+7FXHEJu0S9wq5ZVQWibu4fwOBS/n/59ylroqzBtM+HEAy9UO1ygpvTvfku/YD
        cFpbIMQrZ/IAiOgo3MunwECXzJjhgDlWVWGa5FpKl15kgbgADlNSJ0FYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=dEiHNKK1pcUTpsrgmvewxSpAPrBEKgL3rrGk/Y3A02Y=; b=WeyNm4py
        Wxk3VKq7tJQS3B0EGithFqISMoAGwOI+cwfvU0aNAexEDagdcOQoLM9rDnbVQpRj
        2cw7gLflNrkpU19oSy/6ITTJHGPJBUtFqNfxj3KT0C31yucbqIFYID7Td6vKANTk
        jPDdpuE3ELR89SUeVakKSECY7Ibj5iOXoCdoAgmOb0TF95TNatBAcvILDDog7QOo
        gxRu9iWdXNr0v74dCuiiwsTyol+YV4qmIrQWADcgC3MDstDLWQesNRZtZeYGi0xL
        if4LCHb79atNdvyP2bZETjvu7jlmabNHb4Ns39JnKz/BEcv6s6bbJSW2MFGlzRv0
        2xqJu00o+rzNMw==
X-ME-Sender: <xms:ZsxSYY3pu1XlWjrvgd94YFXEuuV3141WJ6_XqSAvgXeEUNbYxUF8Rg>
    <xme:ZsxSYTE7yTBD9_eywNEY2EP5sVYPR9u_dr7HWOwOhvJRAjyc8AesDezF3JCUQUZo-
    4yA79hpqWGI2KA6PQ>
X-ME-Received: <xmr:ZsxSYQ6SaJd9gvHHJC6NiedwWeobdC9sRiSlmGnqytkGrWS9yhDiK7eg-32W8wz25HPpI5Q19sQ1_kvwQ0PJ29stau3Xjj5Qr3JfeXUtagyX-dwBUlC2MW0ylwlPq3oQurmiCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:ZsxSYR0winhHkoVi7NXthFsCKxMtb53uFVatl-yyGyOsbLyR2VPGGg>
    <xmx:ZsxSYbFOEDdBiHJkpgfsO3aM4YnfSBNc7Gm2A5ruSxbGLg0tsRY7RQ>
    <xmx:ZsxSYa8jt6JTKycJEr4EruRXvt12-QdCyxqRutzxMUpsZS0A2KKqjA>
    <xmx:ZsxSYbFJOBgFr-XyB8L0r33iTYNUQ1Sw9-KbuTC7D1WOKZ4Cah9z0KfCc4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:49 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 6/9] rtc: sun6i: Allow probing without an early clock provider
Date:   Tue, 28 Sep 2021 03:03:32 -0500
Message-Id: <20210928080335.36706-7-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-1-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some SoCs have an RTC supported by this RTC driver, but do not have an
early clock provider declared here. Currently, this prevents the RTC
driver from probing, because it expects a global struct to already be
allocated. Fix probing the driver by copying the missing pieces from the
clock provider setup function, replacing them with the devm variants.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes since v1:
  - New patch. (This patch is independent of the rest of the series.)

 drivers/rtc/rtc-sun6i.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index adec1b14a8de..711832c758ae 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -673,8 +673,17 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 	struct sun6i_rtc_dev *chip = sun6i_rtc;
 	int ret;
 
-	if (!chip)
-		return -ENODEV;
+	if (!chip) {
+		chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+		if (!chip)
+			return -ENOMEM;
+
+		spin_lock_init(&chip->lock);
+
+		chip->base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(chip->base))
+			return PTR_ERR(chip->base);
+	}
 
 	platform_set_drvdata(pdev, chip);
 
-- 
2.31.1


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB95B9D3B
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Sep 2019 12:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405654AbfIUKBE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Sep 2019 06:01:04 -0400
Received: from mout.web.de ([217.72.192.78]:59627 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405440AbfIUKBE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 21 Sep 2019 06:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1569060054;
        bh=9om8hD/kLaf9e9fQUs6omNYsjXudzvqtIiKV5m1awsY=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=EZ5XJ0OVva5N4xddt9Ox+uofQUZw+jafS918t7wQPFSWdh/bznObMAPipk03KjwSU
         tFkYEqcaa8gaZ/gfeVQnAVklnxcp+s0os4H7Rl8qjEnb30a2+UUFIbqrZnK8qxoldC
         /7+xlAH/QrhdrxmOd8LyeWna0etzWVddTy2IJp+E=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.64.44]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LilNJ-1hd6rI3brx-00cxvm; Sat, 21
 Sep 2019 12:00:53 +0200
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Biwen Li <biwen.li@nxp.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] rtc: fsl-ftm-alarm: Use devm_platform_ioremap_resource() in
 ftm_rtc_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <4552ef52-f218-93b1-6dfa-668d137676f8@web.de>
Date:   Sat, 21 Sep 2019 12:00:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PdS6VDi89nQ5MEz616+aD8BLYHe8fFIFFttx8Q1QfI/O1vGuHJ/
 stDZ13wS8Kf6tTtIcRB8rpHjD1N+oua420FVjfOKbccUv498P8vc6AFzxfjJc19qeU7XqG1
 8yj68XIMfbL0Mb60u/pzMqzpomX+tHpFQcrFNtfrsNX5K0Ti1liCEwp1LNqB0Dk2XZoOhI0
 DoqhWWiFB0qiBdABqJm9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MVTIGAREZiM=:yZXRK+m9tX1/qFF2DIp1du
 z7+IADNwTWEHEEHESJz9ZrCtxecvnS6o1qLLxx75laDVRHhjPDR0lwThuOAc+9BmA0IY6EzOu
 kZaouoaTQWBtuhf5123va1ixRzMCvVr6K8STObVub0IdbEBHugl4pozrj1r84yAC+4bhrtZYr
 CYFc539Zd3NteFJ1qifqDI6FVWqLye4iW90+zZBDLvEnD1mO6p/CyaQhJziSSD+V8N5sXTGo9
 HfEB9lUnOQ/Y+Og02RHUeS3GyXKSJQnAQrDdewpqovbSgxMiVa94OUTXCkv0YHl0X5bF0XRO5
 JFJFL20xqMzpr3FUsi0l7sScIh5x2i6PRc0RFdY8UAH9tKy75JyZPKH9ui0yzquxmQWQQtqKG
 3pTCwOalgXemerM1sMsatdiC8ZAEGOS9G7o6zoUceKah1OpktIFzUnU48ZBG3eMVAH4YvaSUi
 +9RkTcsQFiAKInSsZdPs3VHeu2wwImkGA+aTloI1hYeaIczj9PUe+Cp0fhUV5jNcb+Q81crlE
 3R74fxtMkvvHi2XMI81SZ0HRX5mADAMbCIisB3RdPROXwafz5dklgCNVuljt5kVziC5fpdVAQ
 RfHfYah58O6KDlzUAUT7sXod9WeMDJuUhNLytxrmhkqdQ7pEdw29XaaklnMP7T+RG63N/c0Zs
 xZqPMQU6yyVBFHDUTH8nJQoCnh3h1+RZz2ZWTs9boO631dSnuNTFpykM+/ZSNgPXBEo7bIjEw
 WPTge+x59lH6p8RwN10n+Nf1hoOhxrrKbOc4YfWmL5/oAqipeAE9kaJbEzx4rFkEhRRP9aKla
 a2kvPs+ZpCgxPoaLiZ84KN0OPbOLtWX0Im7MsbaGjgZenkuB1Xha2hII7ncOsqk+1JqZ24Tca
 vGQI1IiOHJIAmeFS7nRuURNdxHNLQUFvXPxVNxB6E3REQDBDQbqEFeCrwQCB/F91mmR064/8G
 EZsqE2GGFLbqOg5GXuxAdMJeLW7iCJgvzNfErOX5boZuO+vAx680BSXwMzprhGFreJB3LoU7Y
 3WWzo4dc8yIylUbUnvcRxSp1qeFHw1c7LwZNGrcMCijZ/VOIqS/u4zI/5+6B2/NlM/PXPMk+8
 ibd8iUEC6o3uUDXClqwO1hm8Ws2AfGbfxRQSupX+RHYkdwiT7B3ao+dK73EZGBOv+2dflWVsV
 hO2U+VehsQJqDAEwNEnM3c70Y6hhIrCYP4bmD05jg9UB/ZzZhvKNxSFynOP5XVZZQUvd+TCRS
 dwpts4k8nOCIuUD7/f+pL5x2RWDdPFDlbbLh+G6ctrNeqbaFtP4L21vtVAoE=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 11:49:01 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/rtc/rtc-fsl-ftm-alarm.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-ala=
rm.c
index 8df2075af9a2..b83f7afa8311 100644
=2D-- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -248,7 +248,6 @@ static const struct rtc_class_ops ftm_rtc_ops =3D {
 static int ftm_rtc_probe(struct platform_device *pdev)
 {
 	struct device_node *np =3D pdev->dev.of_node;
-	struct resource *r;
 	int irq;
 	int ret;
 	struct ftm_rtc *rtc;
@@ -265,13 +264,7 @@ static int ftm_rtc_probe(struct platform_device *pdev=
)
 	if (IS_ERR(rtc->rtc_dev))
 		return PTR_ERR(rtc->rtc_dev);

-	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "cannot get resource for rtc\n");
-		return -ENODEV;
-	}
-
-	rtc->base =3D devm_ioremap_resource(&pdev->dev, r);
+	rtc->base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtc->base)) {
 		dev_err(&pdev->dev, "cannot ioremap resource for rtc\n");
 		return PTR_ERR(rtc->base);
=2D-
2.23.0


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E255EB9D9B
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Sep 2019 13:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407543AbfIULal (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Sep 2019 07:30:41 -0400
Received: from mout.web.de ([212.227.17.12]:52095 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407428AbfIULak (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 21 Sep 2019 07:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1569065430;
        bh=qo/Wuz+07R6dBwZTGNB45QvhHNJk+Q9DA0Zq4F9rHz4=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=jm4jVIgZzI3dNAFG2s0nJX943KkUUZU4FbtpBmYoXvijc1bbZ+HgcgLHjkE8QYMIB
         ajj9/XfsiO3Kv8m0AEbxLvsgm18duS2Lrzo8yN6cLAIJM+ocD48KI3EY7pFoX8gpCX
         s6j4AD06CHUs56OQXhodeJRNMCmYmKDtp23UE+/4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.64.44]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MXpdL-1ifBbd2AQJ-00Wj6v; Sat, 21
 Sep 2019 13:30:30 +0200
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] rtc: m48t86: Use devm_platform_ioremap_resource() in
 m48t86_rtc_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <25448e11-c43f-9ae0-4c43-6f789accc026@web.de>
Date:   Sat, 21 Sep 2019 13:30:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JwSnI6lSedHJGoEU5PTGg5UX7g9KLhHv1cPOk2Bpo2TXSt/7Brd
 LxQX8XT62sjdSE06odvInb8UtgQs5JnhCjzrCPL+pSmDRxFkoNq6EX38j9AlNGyWhaETAqr
 JGvC/4PkQAcbM91SV8Q1peO7ln0frRuRz7Gm7JESmR9l9pyHel0ZIwNn3krmHMV3QhTHh/w
 ERo0hq7XtuTZJpZpZYsvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0XuPjzpJV4E=:ElqUk+WbWRqRKgek+qIDYl
 59LLd4n7TVW78JWnsflfCoqRCXj9KpNXU+/JiZ4739SaR5QuT2yAR4Jt9zcF0nmKyLDtoFRyw
 fmRTkx1oitVc4tRaxU1KpTck5kSS7NKtyFb0wWsN7OnCUGA02++1N0MTV9SqFvU0pf16/MMeR
 vkUXJ4Yn68tmOI8iCAS57zbIYnKGh/qJ6UJxA1IPZSbChx+zAK4Z5u1jiWOM6SPX/zBFkbQfK
 gYoh14Y0KStJWEyh5sIfyYXUdCgIm+sX/GxeOODPUGY9DR/3qDlkfQvA6yQj7gE7I1N74MLSE
 7y/N3FlXa/DI8dDVn7x3n7PTf7HGTyx6smgii/u9SDMcDhRm2/a9pCB9TAQhPtUj6/u8MbgH+
 IJH0UKgG3+KqAWfQrcIcYgDkL5pIVSd1GopJYFxQyN6neXAv2WulKxPD3Znch/k0acyUWOaSq
 g4PhVJZcVF91NZuxyr+U1b0DurYyLK5J7hp2AdKgNHkKi122tId1ayd05dBI48I8cMhUuw7Ag
 vzr/w9RGGBy/g3qbNY589S0yg6t+ts9JvSWHXIbIfUXDmB/Ng8xVe2/sH/RNis0i1iqTeUydf
 kiIXkviUOWRfwHVgeCnX8revrfwCeJIhU6wMrRy2YKKFUTtbUHg8C2g337zI3uVrdcQulXSaU
 vE5hQiYvckl0yuP4ST7rvDRKRZKBpWV7vsU5Y9Lq2rUgx2PNlHd6FXEwNyaEGiCX+RALIEa4+
 W1Pnwpd4d7POxr69G9272MqD+BX1Rn1iM18QC+wgvzzRQP/IcfZQl2P79WxrYqanI/f7Fdhry
 XvWL0fgSjsuB+gXgh+gDm20n5NwAJM2MV0LMDM4tuD37SkU8MH2vSF+hFeUqV2VAQqNyvnIwI
 ARx9BMzFzaEAYNUGodcH43J8y0HRjOXaT6fY3bmNAZaJ/OqbSNyNgh7YEYl7Utqe5JV2FFuJR
 XXGOKgfXtfIHqiqd1R/1jOlALSvWWLtgEvdsVMstfiVJZw7DobhgMvzpvSTD/VyHdl9MdKU0K
 V6NFJcvTMBcx/YQ0BwUAUaVIj4MOmQ/fkMnmEW1j4CrsBFT7vK/Uyv3wbpIWFjRXCF6m5zRQr
 +i/QSRi7VFVFhnpyGhzQmvP0PQIkKRx4pMD4R0zrSsAZzkjjk4Zx5+PoggvoAg169VQoXLh+c
 5kgBNzgJjc7fjHXn/Izi0Amo0QLMEUNT8tvCT7mhDOtaXdKnQVZrz7xL/gud1HgrWIFny4VhM
 m9B50vb/GfqwpsX+tw7gok1cw+cRjndgNXXU7e47E42i/BST0z6QOAT+cgRs=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 13:13:35 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/rtc/rtc-m48t86.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index 59b54ed9b841..75a0e73071d8 100644
=2D-- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -218,7 +218,6 @@ static bool m48t86_verify_chip(struct platform_device =
*pdev)
 static int m48t86_rtc_probe(struct platform_device *pdev)
 {
 	struct m48t86_rtc_info *info;
-	struct resource *res;
 	unsigned char reg;
 	int err;
 	struct nvmem_config m48t86_nvmem_cfg =3D {
@@ -235,17 +234,11 @@ static int m48t86_rtc_probe(struct platform_device *=
pdev)
 	if (!info)
 		return -ENOMEM;

-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-	info->index_reg =3D devm_ioremap_resource(&pdev->dev, res);
+	info->index_reg =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->index_reg))
 		return PTR_ERR(info->index_reg);

-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res)
-		return -ENODEV;
-	info->data_reg =3D devm_ioremap_resource(&pdev->dev, res);
+	info->data_reg =3D devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(info->data_reg))
 		return PTR_ERR(info->data_reg);

=2D-
2.23.0


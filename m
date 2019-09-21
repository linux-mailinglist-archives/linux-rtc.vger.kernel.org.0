Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2ABFB9D71
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Sep 2019 12:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407436AbfIUKsm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Sep 2019 06:48:42 -0400
Received: from mout.web.de ([217.72.192.78]:45379 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407271AbfIUKsl (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 21 Sep 2019 06:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1569062907;
        bh=2KlsMu3Yr2Jz4vFlxK+RT/uUmCETBSIvHkQo4xghl4k=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=GrIiA3DjUajilEfhe5yVl4eIU+wnpy1sYdprmgb44hZhhAhJZyZhnIzl731LMsHN3
         JrTwGgCQZ4jCA728IZnelIW5nPFQQxxhhrUK7PkY7y32xu0+6j3KcJFBHqrnIPDYjI
         /S3QTiLZnoeMcieXXLSIE8l4fpREGvtrUjOCA9wo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.64.44]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MHp4r-1iCRDa12jd-003a1n; Sat, 21
 Sep 2019 12:48:27 +0200
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miodrag Dinic <miodrag.dinic@mips.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Aleksandar Markovic <aleksandar.markovic@imgtec.com>,
        Goran Ferenc <goran.ferenc@imgtec.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] rtc: goldfish: Use devm_platform_ioremap_resource() in
 goldfish_rtc_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5ecfcf43-d6b2-1a38-dee8-b8806f30bc83@web.de>
Date:   Sat, 21 Sep 2019 12:48:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N3NnE9ynw+TLhydFjG05ejJtWADOH98Ta018iGgzSfvz22KdUvQ
 4zSis1r5kI05XgdZC2hMkLO/j14fGQ8145XvWJCz8uBr6yT5dtdITzkK6jSWfuo95bkrlaK
 60JJD3Ldde6GEYrwNxlzIYaqDMGUqNOwRzAiX5cRmnArBbgnSibs5UM21j+6z8tn80mOoOT
 HRw/9CQgm4BrQWvO4iYHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FWNLfKQZnz8=:VyeVERNzXzFkFT0eIX8teI
 dh5T2rfIfvprA+WFE6zAJL8EnmlfYB2dnsLfe4S9q59EHxTu+esN8Ebh7YCrji4E/f3ZD2ajG
 WLy2G75+QX+MskCh9urUyP2LfCa+pd2v0b1QtkDdNnK3kd7eRtfk0UsTndHxwM0myrAhGi52o
 UxLzLjznKC8DYzSYHfplUn3tBjq+brycnzfO/H2R0PujNDwFhCYmRfxOVg/463cukVk5w9FS3
 8aNisxxhR3W3IRMCZamo/SnOGQzArk6jOdqwyrMcFf0qd2+I3qAjlXomH50shApAacABF6XLk
 4VIxft9d0YDQx8W/0ZDmz3qlhVZnsX7C1imjuIiTdQtcw//zKiuCnGfyo9CHH0V9gxjYNeRkf
 yQ1fwJu9UJSR6Hv+zxAUCBPWv0N/WFhem0ZK1F2glWhr4T2aLFUayJgvBN/amC2WkF4hN1E4W
 aZwJCmxlIRYeOLeC3VSdWpKCikPFIKbM+OJu/BoNu5PsuC3U3r999Lm+fEfJE7F6DxvddOsLl
 Xk62153sI3H+JkRjQW5S7SrRse26CLuyFSFEKk1BiDs8FiLtlJT9IeE27+chCn/NKmNxnU8tf
 2/l4ykgHrRNOX1LinacPlxDTJoci5o32gy5q7QfpCr6gyZqp1zU5MWhqOvSWGL/vAz90zu3jy
 uopzVhzAcmRR+PwZN7U6/QDNytiOhPzExqD21SdCtU4BfYBptx4jHazS3OTcSFvkx46HhbZVH
 0uGzGpMaLZ4HrSinxtL6J9kOJOAF7yKujS8xBE6G64hKXOIXq/N0V3/uQkBpFfEjTYAJRjEof
 Aa/9TUfjDZ63hZEGCuNb6KhTS+FPFLa9gQIxkU3OsIH0WGENZMV2tZNpkUATnlXj3oqwyGKYn
 x6h1U9gIiczIj9mL63CgtSgKD6w6/ujfuP4tIFzeuVSCyJtrsNCdmXMhJZr0k2yYAy28vOX2I
 A+9FHpjNoftxaQ9AEE1G3vEOeFIh9YvvLq1B1OohDTHb2f2tkzFGax9rAmlO6QnglbHLXqvqT
 C0FEC62xAPy7ISSP6owhvD+6AakJVilZ9xAHpz7uB2mzeNWas+FO33mTEFCL5TrUo8rtxie1r
 6LJRlmTGbqVkrWZiz9CCiZwv6stLJi6NKlOOULIyPf/3U1uGzEQ0TUoUFZfj5knDwy76kLaOY
 Nkogm+NwHWL/dl5QrCi3IL1jUV2g03JwxGjwGE4KPuYrQD3oOAlUswiNlPpHbV1kQopkYkM7Z
 MqCWGC5VX9tN0r1lV64XZFN02tEokKe9kob8CngvRJcGww1KZER3RSrcdEcE=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 12:20:11 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/rtc/rtc-goldfish.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
index 1a3420ee6a4d..cb6b0ad7ec3f 100644
=2D-- a/drivers/rtc/rtc-goldfish.c
+++ b/drivers/rtc/rtc-goldfish.c
@@ -165,7 +165,6 @@ static const struct rtc_class_ops goldfish_rtc_ops =3D=
 {
 static int goldfish_rtc_probe(struct platform_device *pdev)
 {
 	struct goldfish_rtc *rtcdrv;
-	struct resource *r;
 	int err;

 	rtcdrv =3D devm_kzalloc(&pdev->dev, sizeof(*rtcdrv), GFP_KERNEL);
@@ -173,12 +172,7 @@ static int goldfish_rtc_probe(struct platform_device =
*pdev)
 		return -ENOMEM;

 	platform_set_drvdata(pdev, rtcdrv);
-
-	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r)
-		return -ENODEV;
-
-	rtcdrv->base =3D devm_ioremap_resource(&pdev->dev, r);
+	rtcdrv->base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtcdrv->base))
 		return -ENODEV;

=2D-
2.23.0


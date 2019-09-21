Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB165B9DAE
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Sep 2019 13:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394111AbfIULt0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Sep 2019 07:49:26 -0400
Received: from mout.web.de ([217.72.192.78]:33217 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389497AbfIULt0 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 21 Sep 2019 07:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1569066553;
        bh=3BmTDmp6iKuuz4ABn/3dTpvuueFCJwVtF9AXtIawYXw=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=qaGk9OcWGdV9o6lvlwwXMp+rW8dpNLQDaCpSM4yztGEzWDqwROt7+/rMRA7Z3RLXB
         a1JeCSewjxMMMrH/q6o2NVRdrINRYb4pJtyT8VMrsA4GGhDr8l9IsTYphkuuACMVnz
         0GKhVrBhHLKkdEQF8S5hXpIBGqEvjOwH8GuN6Dkc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.64.44]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LzKIP-1i7mEy2yCf-014U6w; Sat, 21
 Sep 2019 13:49:13 +0200
To:     linux-rtc@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Rob Herring <robh@kernel.org>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] rtc: r7301: Use devm_platform_ioremap_resource() in
 rtc7301_rtc_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <8c17a59c-82ff-aa6b-5653-a38d786d3e83@web.de>
Date:   Sat, 21 Sep 2019 13:49:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FSXYSJXSqpG5FQ0Yy9xUAQkmypljm0MuAK4xnRLwb3zYKkW+0K4
 kdPAcwVo/hXo7jn16R4y5zfM6nJLAru5hBSLQlLB2Rpa5IW/E2TESbkhp+kl0ag+FbxoIyP
 DVUSNuvCzruICgYRp/nOFPvX10DveUOnyPNhMizuxDYauTqtf9q+eEntNJCdypcv3xs1R45
 BkGcmnMfs2f0yz1y50NTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B06/QBIJIdE=:TvFOfESuat+rpiJIuAz8Nq
 S1xexZUZ2aEZIXsOA7yLGLMCSvvjm6aj+FReYBTdW7amxL+wcMM8qC4gc34ZgtdHeG0KnhRvC
 kgoH/scwHw6Wec54+6qm2eWLtJBJqB+0Ky4U6uHiN3aZwqu1CTu+PUji4oXxEohwMnWEP6PrR
 fMe3rEhhZXzCQLEq7qICJzyqbNOLYqaDtpltiQ1vf9pm7BLoe35YUqQg/YDCdKE3CfsNNd0/U
 uRUcBu4AjnYVUbwZJ3VjpVcOZgGnu2MWOipCvtTvIf2lZAYPFVaw7V68RnKiFZksbK6ZRry+C
 JOQ2F/w9FHFpCAdxCdCjL3uvJ9ROD99hc6/mqAvhhWnu8FcFK8IWbi6HHsvgHT62PONJcus7o
 b7A1/rCkDxxeCDu3LxUtoRYYJkzOWOs/WKrId0xJo1/IlbQOmpJlRBy6JZ/r3ONYb0B9p+uPq
 thcrC7jF1nlLW3IBAFbYGOWJiEYURx7jsqouQ/0VHkucJhKmv03Y66aK8G6Z+mgjbVy7AtnTQ
 1S30M2Q+K+YzXH1SEGhUsdVSCK77V+JuW+lDX89/rdqBSkDpsyMHqej5ZUHv7WrJUZKlr9xd5
 CdmX/pJTcy+xa/JLDN2rCpLATks0BdonXxTqhRgfL6tTWfkJm9pwVksZ4RUvz4lx+20b/Q1qh
 7M4uhGkJ9k3qOXcIQzBGROgnytTa1hlAsV7X7DQ+OqQFVEfRNfUUkch0zULXqM0WzhCGZ/UzC
 JWTNohkDbGp7wxaDXy8wJAuWz64dPX35BiKHiZUVuwF/Cw+SrMjVueXhB15QqSdntEbrVA+XI
 o3r3pia7nDafdQeB7SdPhsve/gab4M3qzDE4lYJCGHW4qDFZMdecixuB1+gsKrq3U/JmZ3ING
 zce/R9RplHEaoxavCLSf3P7o3EQKeRf/aEG+IBN/cZTEDI0Lqwy51PgzMcGcbOyH6WJw24kNC
 zaSEWKvJQ2eWvBgybSiE1WbSPCQ6ZoVMPa9BSC2N+IA98Eek978sBUJcdvAMMzH57DyInBfqb
 ZE8OOOcMSC1jdWHdRpszEGxL8d6k/CLRqv4eTvHnWVbUqoWmTeUBzAVgW/3NP+X3mSMjCQh0W
 znk7z9S67LrqHHDJ76H+0KzfX6oFKur050GMBdQTsauJIOKJf8P8jf8adFJ1OYu7ZC5Vbcy1E
 W6j3zsXN2sX1Ox3zDbzkCHS0Ry5c64f5xAxbiQqxOh129YKX5RAl5BGWVxyZ/lmlFynRi/CPh
 nSyvtfho4ADLi0M5aifDGgS+pThYNVb4wbhB3pyJ8+MAKmvJXxCWCQNvBcgk=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 13:43:07 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/rtc/rtc-r7301.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-r7301.c b/drivers/rtc/rtc-r7301.c
index 2498278853af..aaf1b95e3990 100644
=2D-- a/drivers/rtc/rtc-r7301.c
+++ b/drivers/rtc/rtc-r7301.c
@@ -354,21 +354,16 @@ static void rtc7301_init(struct rtc7301_priv *priv)

 static int __init rtc7301_rtc_probe(struct platform_device *dev)
 {
-	struct resource *res;
 	void __iomem *regs;
 	struct rtc7301_priv *priv;
 	struct rtc_device *rtc;
 	int ret;

-	res =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
 	priv =3D devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;

-	regs =3D devm_ioremap_resource(&dev->dev, res);
+	regs =3D devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);

=2D-
2.23.0


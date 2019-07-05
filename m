Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3B9960CA9
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Jul 2019 22:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbfGEUqD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Jul 2019 16:46:03 -0400
Received: from mout.web.de ([212.227.15.3]:33019 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726411AbfGEUqD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 5 Jul 2019 16:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1562359542;
        bh=KmnE4fAAIZ6JB39FlpC/FKOeG4jUpG0pyrFXxMQV2xE=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=GAynKJI6Rip3yOv1g8ymskGTNlzwH/i8slxxv3UyO7sX+3HE4wF4DbTRBGXLULUy8
         bLBfvzQCRCBF3P8Gmv2B/oMjzmsoIakXgGxfml4HBt2SU3qjkLhF/ILB++F/G65TZb
         T+5LUtPai3OnVr0zJOhcBqgfSdqIikM9j7Xd/UmQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.45.164]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LkhQi-1iHSKI116K-00aR1D; Fri, 05
 Jul 2019 22:45:42 +0200
To:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] rtc: zynqmp: One function call less in
 xlnx_rtc_alarm_irq_enable()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <6f1db217-cb0a-9f6c-0e2e-5d932103f6ef@web.de>
Date:   Fri, 5 Jul 2019 22:45:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UupEyaN0IiJ9PZk2+h9eYsKtAQY7pJzNgUPnwbpvJ1Ic2DIwktL
 GD3/CY0CFxxoNrh0CLkifleMWPhDssJhu+oMiTVHCiSgdpqTQPjAZboa2ZnwbBJuJNVoMP4
 QB6ct3zqygwJm2a01G48Z5+C7Bo8GQNJdQEiqD6RddZxnyZ3nwSm9Ca67apcaBYBgWG7vPl
 4qHuhTs4kgRfdmqtpXmtw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KobCKjFU9UM=:ATFrkdPR4OqEsBEZp60Ipj
 b7lls44D1hh148HBtyCAikBb8NiC9TbokjCr5zcYuASuypIEnGtuW499JnjSDC0h57WM5VB36
 L62SEaJrnxOnn8YWueHdT7P35W86NM1eh4xvoPrMvf2CtMu1tBMZtnxAC21m71XTZ25CdwvdF
 qYwVDrRJ59X2V6vjsTb9KtjD74f8KLP771eWmEj5Nfkqlems3BSaIO91llfoPRub9iOwXWjhq
 BupyNkeoaUrzoUu7yvqZLqXBLUUl1jEn0AlGpoMJ5SHZff09mg9UEgb3YfAzFNASmFHKu+ft7
 hXjC8dPZL39xpz3E+mnvA6B7E0tUzwM+89ZT7cf7LAy6vcEP6dzZ64RTHFlEvC2U8Vwzj60cx
 QkZa0+mpFGaB4hBI4zOiirVzjCBXpPEKH4dIyA5Xa+ujEcNT7Glpj0HdcFDKUzMPtCuxIR7ig
 OzMsMrYLEmVBefuARpCe9rPhhXf6cy97K/QPRqlj7OKJ1X6rcO6DmkxXvNyMCZswaoAlxSpjZ
 6Ws8Pn7q7/0bVrwPq9C7mqr0jcwhdnYdXamb0/gHlxll2YXZl4ZIiVQofm8m8K0//68sJeijN
 NEFm19f+LrtQzACt3DN0z6+qCeLdR5HEgdYh7fFYHbPXDyGgPZju6mrHC9OaKH8IQ2RRoVo1L
 sXX9D3euxJJTpc0xy9uq1V7w1Bc92rygcg+/LMWWFMRs7ZVn4uywddSt6j+thKLTXi5X/7Z09
 lol60jsDtIcdVTjzGpojswfEuNirPsynYrUq65ZuclMipf83brDgG5NjRynSLP8rsyfDeaH0I
 U7KfDCPvAWI1v1JNQXRUx/Z4B3rHHnsOaTaj78aC+FXyf/7e6uQycJB8jJ5B3id68DNUBHTya
 GQ90px6UXyBbPiyuY79b1ZFG5fNc71wtB3jKGiiu54ObZxD0qwt2tJu1bdUpWIajPjoE3SHLN
 mCN7pVUzhaKMPtXEcXRWD0YESw7XvfC4JfCaMOXMJy2VMkNp/DtvTL5ZKbbYQx7QdWnXEhASB
 FuuWg3BkhX6qLJw9ihDkOEJ1tyKsYnNyEZMCOsMLXDCv2VSprNrb/PcCzdrrvimtDZnUuMd+V
 KYYr4Pkl/ITtRcSjpCmLtILSo6gmjVH9oMO
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 22:37:58 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement for a setting selection.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/rtc/rtc-zynqmp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 00639594de0c..4631019a54e2 100644
=2D-- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -124,11 +124,8 @@ static int xlnx_rtc_alarm_irq_enable(struct device *d=
ev, u32 enabled)
 {
 	struct xlnx_rtc_dev *xrtcdev =3D dev_get_drvdata(dev);

-	if (enabled)
-		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
-	else
-		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
-
+	writel(RTC_INT_ALRM,
+	       xrtcdev->reg_base + (enabled ? RTC_INT_EN : RTC_INT_DIS));
 	return 0;
 }

=2D-
2.22.0


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E611A19EC5F
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Apr 2020 17:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgDEPgs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 5 Apr 2020 11:36:48 -0400
Received: from mout.web.de ([212.227.17.11]:59255 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgDEPgs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 5 Apr 2020 11:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586100978;
        bh=tnYDeiuDrcRk0nlPNPGkbd2yv/Uu1XjW1jGNeoaglWg=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=sJHbBQmslULtjvmcd7PHQdC2tBb0NYq7WQjJH9N9pOqVcoLPp+AX/c85elklTWPEG
         aItGPWfGemVpvXJ1/qPY+BRmVh4LgwuxAFTcMKS/aU7Z44wa401mBsYtFT33s7p/0n
         k4hOjIuy6rLmYWLsDPJASng8JgOL8k/81R3rkE4E=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LkPjj-1ijqYr2hzf-00cU19; Sun, 05
 Apr 2020 17:36:18 +0200
To:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] rtc: Delete an error message in three functions
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <04116352-b464-041c-1939-96440133aa6f@web.de>
Date:   Sun, 5 Apr 2020 17:36:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8+/Dc59/ZQ9+ftEfpC3i/0o/mPSYrEeU22u2c6J0lKMOGgj7M27
 xGQQMzqGeVrc7EFFUgwLSLjJZiyGFZ1ONGhSzOSNqClTcF/6Ka5qQyBp4vDtj9xoyM9/W4C
 5N8LN+TKjhgKzvLi5AR/m3uPV4eqI1AEmzq3W9Y7J7iplIsSb41ZO04Tinu1vwu8Wa1fXOj
 euXLTnhOf446ZHlS/lLrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5BtEuP3ErMc=:Fh4okuSnNC5D+zfo6Znivn
 3TLmQdF8XJzaa1V6MArixv9kPF2bf1E9JGcJt9sxPaPX4KoVU18S9Q76t4sOHp4v0eUK5767S
 b5KA+QSsz7QNprTJmHTRBX4F6LKx+nEDwjPP6NmAqPGSgmUjNAJedy5wE+Fp08MR85VpjaaYL
 kIW1IbsnEee6kFDpDrCEls4gxLVMZy0YiKTDf7rRWlpYMWWhx/W+f8rQzV4voDn3eWxqfAjEk
 Ko3mbHs+iPtxaNJpQbXdaD9ymY4c5yR7ZAj1lnZMaR423E/pNok4POesKdF25xI5MyveHLhi3
 PRpfhLysiH7W10EcHGuF0nf0uOlqzjZW24aeNRmkyrllreNBBIuDJ6yX/zdSUWY2EC2nbuj/6
 ClcvRqxeCZ9ThC5REh4CMzQ75YKLcHzh1CMLSLTim+TyOUUMU8MiNOJ5xj6D7MMIhGVvx790a
 TxApeRk10UoxFlXJvNA2UHf3SP+a8S1CYi1ooLvNROm3+CYqqeJm/q12bB/lTnhmX3wsk+1DM
 AuVhcHwgKBCNTwfZ1p/7SBeHf4+1yZqnX1pn7InzvxsM9NPCErXZhehH6x5P0dG7aQ7pyieQx
 30vNUjnxPabHCLGoOEEBwIvsH4KaxAPIdbAbG2z3UJbgzz4vvanwZ+hhcuACfriATMOjFuW5Y
 rgtNfj4BHYNMv2kYRLyDE2XyzDh5vlq1exCIzHCAZRZPnRB9QQAhIcBXqRqohbV4LE9qzdiOR
 j1IprXh6+lNiRvCjVc3KejkWXsZe75ljjj6dVXLkVEOxC9iwxgUggQMzLiZeX9BZIxl061lnC
 /TjTXhfu6TMk3hFyhcAh+kV/Gbh1RXi4z224ueq5hZyBuFKMXkxDp2L4sFBImRSGTtqp4OHqn
 4R43dy1rwxeM96rBPZ+IzLYLrm0GG1yK3eV1OCPvA88WviOAueyKbEK4XqVBfHqH1Pixwhs36
 U1sK74WbEOTpEVzgvBdcWjRPXBmZD0GidH0iD3Mxc45YGc/vtqLCsAWaz6zTV8jY7dF2FZ+Uc
 jmf9sT4Yy/2zszLKhMEyPz7U4pLJl3MN3cavs3kerN1xUKheqx8NjgmuDX0bLkccyPmvyu8Jf
 XOySu9rXtxrBtKqid/mn6snxZwdtQyHESzUYcQ2hdj3oNly+r0kUVjV5hRP+FIzbYruzVKmIf
 oyBeAgLodBqcslOWVF1tZ98IvGa4hPhzXW9VvYdifbWkMnlmJ629y6VejpnT19PMbpKQEi3FQ
 WisU3HbEfVjK+e+8c
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Apr 2020 17:30:15 +0200

The function =E2=80=9Cplatform_get_irq=E2=80=9D can log an error already.
Thus omit redundant messages for the exception handling in the
calling functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/rtc/rtc-fsl-ftm-alarm.c | 4 +---
 drivers/rtc/rtc-lpc24xx.c       | 4 +---
 drivers/rtc/rtc-mt2712.c        | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-ala=
rm.c
index 756af62b0486..23c811da4801 100644
=2D-- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -268,10 +268,8 @@ static int ftm_rtc_probe(struct platform_device *pdev=
)
 	}

 	irq =3D platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't get irq number\n");
+	if (irq < 0)
 		return irq;
-	}

 	ret =3D devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), rtc);
diff --git a/drivers/rtc/rtc-lpc24xx.c b/drivers/rtc/rtc-lpc24xx.c
index 00ef16ba9480..eec881a81067 100644
=2D-- a/drivers/rtc/rtc-lpc24xx.c
+++ b/drivers/rtc/rtc-lpc24xx.c
@@ -205,10 +205,8 @@ static int lpc24xx_rtc_probe(struct platform_device *=
pdev)
 		return PTR_ERR(rtc->rtc_base);

 	irq =3D platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_warn(&pdev->dev, "can't get interrupt resource\n");
+	if (irq < 0)
 		return irq;
-	}

 	rtc->clk_rtc =3D devm_clk_get(&pdev->dev, "rtc");
 	if (IS_ERR(rtc->clk_rtc)) {
diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
index 581b8731fb8a..f6bdbabd7202 100644
=2D-- a/drivers/rtc/rtc-mt2712.c
+++ b/drivers/rtc/rtc-mt2712.c
@@ -328,10 +328,8 @@ static int mt2712_rtc_probe(struct platform_device *p=
dev)
 	mt2712_rtc_hw_init(mt2712_rtc);

 	mt2712_rtc->irq =3D platform_get_irq(pdev, 0);
-	if (mt2712_rtc->irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
+	if (mt2712_rtc->irq < 0)
 		return mt2712_rtc->irq;
-	}

 	platform_set_drvdata(pdev, mt2712_rtc);

=2D-
2.26.0


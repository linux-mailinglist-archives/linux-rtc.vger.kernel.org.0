Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E92961BCC
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2019 10:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbfGHInF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jul 2019 04:43:05 -0400
Received: from mout.web.de ([212.227.17.11]:48791 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727189AbfGHInF (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 8 Jul 2019 04:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1562575358;
        bh=lEJJRcdmXlTIVj8k3C+1nfg3u7cryKn3CqmVSGmDYCg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=KTYKABnOAbCf1p3uMvKHr4vUuzb9NOLrd8jZdGF/cyX4RH50b5SjfKTwLibFKyde3
         ywOITkhkZM8YjQHB6uexvoR0EiYi6puRUixnLEpR92Z9DXdKFabzQpqzBKpVhCzi3A
         dcWwinbr/hB9XGzV+aPUCWdXAlJJVYMkUfVnnbhw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.165.233]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LvSLn-1iRopp28zD-010YiK; Mon, 08
 Jul 2019 10:42:38 +0200
Subject: [PATCH v2] rtc: stm32: One condition check and function call less in
 stm32_rtc_set_alarm()
To:     linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <f04277da-8a98-473e-2566-ac7846f9f8e1@web.de>
 <20190707211638.sehikkear25dffah@shell.armlinux.org.uk>
From:   Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <4da614a4-83c6-548c-a112-033b846c561b@web.de>
Date:   Mon, 8 Jul 2019 10:42:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190707211638.sehikkear25dffah@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wh0iqueJEE1aqZAx5uF+5ResTjObNNmFpBi+frR0Fw4nTVaeDMX
 Rx0keq+a8IZ0LyfQjad9ONCFtDtY9Nx+FXDZ1vlj3bxDOyHbBgzlRLiqNrl8w7Bdm7Yiovg
 PNKHosZwwP8nrU04e3dy8GBQY1PWJSxA+VDnPt1alGW1GxBdh04Yg/Cui3yNm1ywr+QPauG
 nVhk0g0u3Uimsu2VIf8eQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Yn62schdTuU=:DlF2xpvX4dTwP81KGg/kiw
 arykr7yHiCwdAZXkGMTEf0yJOK2hZuwjep91AR2YDCSke8gyqv1n+raS3MEOLelGX7sFQmdtE
 47Bl/T+2pubfose8p8MvgPHbZ9zbzFxyw/pq9mQm+/pra2hMBulJ4ufvSbos73omjoegfE1je
 78Ua3KODkUxczYD3IMrqoCpns1xbbcf0K5oglWxb2sojGUsEDD3TbKHQf7tHctXUjiYP9H2uj
 5mSzcbyh0DWJh5QsMIDiMS35AtPPNb9tM8e3hAKxbfPsI1jDYBgIbt501Yz0hvcMx4QYvFXO8
 9tgeSe/Lo1tNqzIsIVSvo6us3FZspHAG8cMwGbW+wbipGJUokmSC6cWw8/GOBDlEraKg3kxoE
 w/L9acygJS1diTONfHS0if99BjFyC+taL1LuvKxPorx/Jq80hagLWO/kpsMXf+SET0QrGu/7S
 loq98OAxLXE7kfEPPB81xTfIJkXIQvb6Fnk0JPacsSy/bIn0+1AFRDIAigXybK16XiVb4rypL
 arLFVNEf3e8oXqdYKYTJ9kxZdtQpnctKSUDgGyWIMWT761tyt7dQEq75/Zbj1kuF/5iigDfzf
 9EmOvxf8vh9E34Da9H/g9BsWETiuYyys3dpS5XVfv4ACP4DKF+/rWh/HlT9a4mXeLh+wceJJF
 6AAJNPGlBJruegBE3XlL8d00xUQvibxygJQFPxX4NLLzQddR+YLZx75pkYi8d3UAZzag184nC
 4iSoWuxVJcO+XQJ8Tj9OSa36vaNuAGUoNDO8hD3Q1Fbfa/5jCDLJ0r1G+0htStl6qAhz9XnSf
 mXAbXaA4R/oHrmwrpN+AysyeIVu/rJQO/FIWBF05QYsazH/N1lUBDU44RMtDsoV21xWkBi8HG
 evQpOBbNmMCjuePuXD79DH1sS04cfFFl/yqG5fEdV7gjMiIQ8mFg+qS45h2vCfZ3dwHAcnXW4
 k205m7u36ABwYyi5jy976F+mOpoiMpbv89tWB7YbbKFh7d/8w7PzXiOjQ0aF6Gh0jzYLsl9P2
 MlUR1XUeJR1/x16AzlprbPN3CaaNo8WOrKPXP+d3072RkbAqNDegzRMgk8baVdY+GKMut6aMl
 2VRVTwTv3zxTR7neA6I/uMgR321iJvzAIoc
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jul 2019 10:26:47 +0200

A condition check was repeated in this function implementation despite of
a corresponding check in the stm32_rtc_alarm_irq_enable() function.
Thus delete redundant source code here.

Suggested-by: Russell King <linux@armlinux.org.uk>
Link: https://lore.kernel.org/lkml/20190707211638.sehikkear25dffah@shell.a=
rmlinux.org.uk/

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

v2:
Russell King pointed the change possibility out to omit a condition check
at this place.


 drivers/rtc/rtc-stm32.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 8e6c9b3bcc29..773a1990b93f 100644
=2D-- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -519,11 +519,7 @@ static int stm32_rtc_set_alarm(struct device *dev, st=
ruct rtc_wkalrm *alrm)
 	/* Write to Alarm register */
 	writel_relaxed(alrmar, rtc->base + regs->alrmar);

-	if (alrm->enabled)
-		stm32_rtc_alarm_irq_enable(dev, 1);
-	else
-		stm32_rtc_alarm_irq_enable(dev, 0);
-
+	stm32_rtc_alarm_irq_enable(dev, alrm->enabled);
 end:
 	stm32_rtc_wpr_lock(rtc);

=2D-
2.22.0


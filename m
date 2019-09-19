Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A30D1B811D
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Sep 2019 21:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392146AbfISTAf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Sep 2019 15:00:35 -0400
Received: from mout.gmx.net ([212.227.17.21]:33897 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389123AbfISTAf (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 19 Sep 2019 15:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1568919580;
        bh=hj0v1Dk284VBCCqtbevoonaHYwBxNHrfdQxj3+1olfo=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=Q3ls9dDaa3lO23ToTcVtAxpChrkrT67aZVQKDBGAWOCCrvsABcWRYXnWiuyIoimY0
         5z/z7hnxea5Qoy+C30DO7BORwklbHAWP4H/Kw0K8Vwx0cuD+UMdUDUHnkQfNdMSaMW
         QU0gINfMFb8OWKPNbB7O7wUPJUuoG2sB9og87XgA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.10.26] ([80.208.215.153]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAgq-1hdtp60qym-00ba2G; Thu, 19
 Sep 2019 20:59:40 +0200
Date:   Thu, 19 Sep 2019 20:59:35 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <1567059876.15320.3.camel@mtksdaap41>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com> <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11> <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com> <0A87F427-2D81-412A-9549-09A51A021799@public-files.de> <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com> <trinity-a57f08bb-e30e-4e74-911c-c40e335d00da-1566580580817@3c-app-gmx-bs75> <1567059876.15320.3.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Aw: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from core driver
Reply-to: frank-w@public-files.de
To:     linux-mediatek@lists.infradead.org,
        Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org,
        Richard Fontana <rfontana@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        =?ISO-8859-1?Q?=22Ren=E9_van_Dorst=22?= <opensource@vdorst.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
From:   Frank Wunderlich <frank-w@public-files.de>
Message-ID: <904EC97A-486D-4C22-9D36-838D25EB7A6F@public-files.de>
X-Provags-ID: V03:K1:row03C78r7NZowZd8aVAl1Eeyaqqfenw5BZOEshUX8lFBJvuhz4
 T+PL7oTN1F06ozQi0+zBKKCvCjoji4fkxqRZYCs4Niyy/E2/wOLW0QO2w/ZBpvxECmQWl/i
 A6QlqHL6V32iBPMdpj4GYf0evMqUF1ziUcKsrai89pMK9PRtGVWj6HXo3RI2nn0FwZR5Jz+
 lrl7R4R95drFfoDuQz9Wg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e7BeDAeyJjA=:q/h5IzV1+NgCc3T9CmosSg
 5EqJDfGKXmoIHjQZkXq8oJq+sjZkfSZvZPdGHFckLlVfGVh5bL98PsKt6DGldZNBHN1p8Yh22
 gSANqdGmtfpzBVbqmWzawdC++Qo/URhEqfAYw5t/5jtZQaPbcETwtqJhaTocnUeRNq7O2m10k
 +giTC5JeqqoydXT5s7p06GpravF0F08jWcA1B5/BtR05ITCeHOhJlIF+gHZD50PqFOALYnfUn
 oOaARwN2zGdGdZRmVB579kngNnoqBcIyI7A0dnwrs1o4TvpFvkvUVHvJ6xIxglodmj0yYnHDz
 JJIWTw93tIZ/s66GZQ2dKEkq2Ds7+KW6e3GysK20VR1rX3r/Ll0iL4tJDV19WRY+oPTqiuipD
 c0Qh1fvK+ew0WTzxbaASsidqATQNvDEOrhKcGvhawSEAYIXo3jI769l7TEelE0RtDp5pon/xq
 wWSbWtnDb4smBSrqADxXE1aXBh0gLJTgwO0s6Qy/sJSvmXyaCP8yfExTQypOoDE51gkDR/l7V
 UoINLG06vd6EaqaYgJgy+92YLhugFzupIcVSP2ZDdHOo/c3bbPSvPWFwyyrPTXR3aDDR4bzWF
 N9xPJZWCLNeqql2BqXyX/BNWPLRwJM49HBfIUJs7OHpYn0pMV5XYI5KM/Zf78qiVNQZ5YHYvV
 3uiAjYU849vUmDCkwmCFJjZoLqKbEwgaTmKmS9A9i1gE89hEsHOiIa2Qf5Bng9H1Utnysq3lC
 KdssfnlXSmZa4CPktrrC9DqVjtUr+2hVZjujLB5vpumb884hT0Ruz886H/4GQg4ZsL5/K51Kj
 ugJHHH0LTsFdQVGGoFFr1jMdoy/cMDU/jBAnoa9lunXk+b5hPlMLrmEHOjGu0CJU0WRq/yggs
 QpXzZpFp6ulWwdKNnN2ZZL0OnX3r45zjcx4Vf3qOT6nGLoDlXaBfaHwwPyp0+1Krq7N8uJMl5
 sO+lQ9qXsLMNxRaU0Trv/0E0bjZPFylaGGXPnau15KgXPiuInFIgwlcU3Q8XsNvo7xXtO4873
 6sw++dLvqQu+fBI0pzrJnYwVph+StTcKRW0+qHJ0LrQQZPM/pgplDHHPdV5vBUrMBG1hH3IeL
 wXBRjnkwpGFFAeyz10TtMtqXJHcIpt9wvcc4camaPl5slaFI3rCrt8Xq3qhpBimk5htF+VdVU
 MYhdw0Cjsxc6opGMtremMxOcVHEMcGiCD7lqvu66REZg68HyRdcLnZzDXqYv9H75zooPiMPzE
 bdHoJ3bB+sx8eukAEEgyWXBXIGQge/cIOeL7NxJyMbLQgww1Yphgbj/o7mgk=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi

When is new version ready? First 2 patches are still in next for 5=2E4 and=
 i see no fix so i guess it is still broken=2E

Regards Frank

Am 29=2E August 2019 08:24:36 MESZ schrieb Hsin-hsiung Wang <hsin-hsiung=
=2Ewang@mediatek=2Ecom>:
>Hi Frank/Matthias,
>
>Thanks for your comments=2E
>The root cause seems I didn't split the code well=2E
>I will fix it in the next version=2E

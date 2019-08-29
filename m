Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46339A11B2
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 08:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfH2GYp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 02:24:45 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:29503 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725782AbfH2GYp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 02:24:45 -0400
X-UUID: a196583a8332455382dc647d0c53f3f3-20190829
X-UUID: a196583a8332455382dc647d0c53f3f3-20190829
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1898947706; Thu, 29 Aug 2019 14:24:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 14:24:42 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 14:24:42 +0800
Message-ID: <1567059876.15320.3.camel@mtksdaap41>
Subject: Re: Aw: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related
 code from core driver
From:   Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Frank Wunderlich <frank-w@public-files.de>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-mediatek@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        "Mark Brown" <broonie@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "=?ISO-8859-1?Q?=22Ren=E9?= van Dorst\"" <opensource@vdorst.com>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        "Lee Jones" <lee.jones@linaro.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        <linux-rtc@vger.kernel.org>
Date:   Thu, 29 Aug 2019 14:24:36 +0800
In-Reply-To: <trinity-a57f08bb-e30e-4e74-911c-c40e335d00da-1566580580817@3c-app-gmx-bs75>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
         <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
         <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
         <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
         <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com>
         <trinity-a57f08bb-e30e-4e74-911c-c40e335d00da-1566580580817@3c-app-gmx-bs75>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Frank/Matthias,

On Fri, 2019-08-23 at 19:16 +0200, Frank Wunderlich wrote:
> > Gesendet: Freitag, 23. August 2019 um 17:42 Uhr
> > Von: "Matthias Brugger" <matthias.bgg@gmail.com>
> 
> > I suppose that's because 3/10 has code that should be in 2/10 and for some
> > reason 3/10 was not pushed for linux-next inclusion. Although it has the same
> > Acked-for-mfd-by tag.
> >
> > @Frank, can you test if adding 3/10 to your code base fixes the issue?
> 
> adding part 3 [1] seems to fix the issue too
> 
> [    4.960051] mt6323-regulator mt6323-regulator: Chip ID = 0x2023
> 
> thanks
> 
> [1] https://patchwork.kernel.org/patch/11110509/
Thanks for your comments.
The root cause seems I didn't split the code well.
I will fix it in the next version.


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3BE87F9B3
	for <lists+linux-rtc@lfdr.de>; Fri,  2 Aug 2019 15:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394500AbfHBN2k (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 2 Aug 2019 09:28:40 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:61071 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391155AbfHBN2j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 2 Aug 2019 09:28:39 -0400
X-UUID: 1da96149f2434255840eb41c0a62870c-20190802
X-UUID: 1da96149f2434255840eb41c0a62870c-20190802
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1967125001; Fri, 02 Aug 2019 21:28:30 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 2 Aug 2019 21:28:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 2 Aug 2019 21:28:31 +0800
Message-ID: <1564752511.1587.5.camel@mtksdaap41>
Subject: Re: [PATCH v3 04/10] dt-bindings: mfd: Add compatible for the
 MediaTek MT6358 PMIC
From:   Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Nicolas Boichat <drinkcat@chromium.org>
CC:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Mark Brown" <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        <linux-rtc@vger.kernel.org>
Date:   Fri, 2 Aug 2019 21:28:31 +0800
In-Reply-To: <CANMq1KCiK69kXkpagccqd1=pKOs7qOOVuJUaCe5JfoGVmPt7mg@mail.gmail.com>
References: <20190503093117.54830-1-hsin-hsiung.wang@mediatek.com>
         <20190503093117.54830-5-hsin-hsiung.wang@mediatek.com>
         <CANMq1KCiK69kXkpagccqd1=pKOs7qOOVuJUaCe5JfoGVmPt7mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Nicolas,

On Tue, 2019-05-07 at 14:24 +0900, Nicolas Boichat wrote:
> On Fri, May 3, 2019 at 6:34 PM Hsin-Hsiung Wang
> <hsin-hsiung.wang@mediatek.com> wrote:
> >
...
> > This adds compatible for the MediaTek MT6358 PMIC.
> >
> > Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/mt6397.txt | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> > index 0ebd08af777d..62f1c17c7738 100644
> > --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> > +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> > @@ -17,22 +17,27 @@ Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> >  This document describes the binding for MFD device and its sub module.
> >
> >  Required properties:
> > -compatible: "mediatek,mt6397" or "mediatek,mt6323"
> > +compatible:
> > +       "mediatek,mt6323" for PMIC MT6323
> > +       "mediatek,mt6358" for PMIC MT6358
> > +       "mediatek,mt6397" for PMIC MT6397
> >
> >  Optional subnodes:
> >
> >  - rtc
> >         Required properties:
> > -               - compatible: "mediatek,mt6397-rtc"
> > +               - compatible: "mediatek,mt6397-rtc" or "mediatek,mt6358-rtc"
> >  - regulators
> >         Required properties:
> >                 - compatible: "mediatek,mt6397-regulator"
> >         see Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
> > +               - compatible: "mediatek,mt6358-regulator"
> > +       see Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
> >                 - compatible: "mediatek,mt6323-regulator"
> >         see Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> >  - codec
> >         Required properties:
> > -               - compatible: "mediatek,mt6397-codec"
> > +               - compatible: "mediatek,mt6397-codec" or "mediatek,mt6358-sound"
> 
> Sean had a question about this
> (https://patchwork.kernel.org/patch/10846669/#22524299):
> "why didn't we use a more consistent naming as mt6358-codec?"
> 
The compatible name, "mediatek,mt6358-sound", is already in mt6358 audio
driver which is already in the upstream codebase.
After discussing with audio owner, we will submit another patch to fix
it.

Thanks.
> >  - clk
> >         Required properties:
> >                 - compatible: "mediatek,mt6397-clk"
> > --
> > 2.18.0
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek



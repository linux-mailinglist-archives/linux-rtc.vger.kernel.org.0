Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C08F6830DC
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Aug 2019 13:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfHFLln (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 6 Aug 2019 07:41:43 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51559 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726713AbfHFLln (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 6 Aug 2019 07:41:43 -0400
X-UUID: 9ef266cfa1bb42fbbaeb731b843d0390-20190806
X-UUID: 9ef266cfa1bb42fbbaeb731b843d0390-20190806
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 415061747; Tue, 06 Aug 2019 19:41:32 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n1.mediatek.inc
 (172.21.101.55) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 6 Aug
 2019 19:41:34 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 6 Aug 2019 19:41:32 +0800
Message-ID: <1565091692.24748.3.camel@mhfsdcap03>
Subject: Re: [PATCH v4 10/10] rtc: Add support for the MediaTek MT6358 RTC
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Richard Fontana" <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Date:   Tue, 6 Aug 2019 19:41:32 +0800
In-Reply-To: <20190805072338.GB3600@piout.net>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1564982518-32163-11-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20190805072338.GB3600@piout.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Belloni,

On Mon, 2019-08-05 at 09:23 +0200, Alexandre Belloni wrote:
> Hi,
> 
> The subject should be:
> 
> "rtc: mt6397: Add support for the MediaTek MT6358 RTC"

Will be changed at next patch.

> > +struct mtk_rtc_compatible {
> 
> I would name that struct mtk_rtc_data
> 
> > +	u32			wrtgr_addr;
> 
> and this member should be wrtgr_offset or simply wrtgr.
> 

Will be changed at next patch.

> >  
> > +	of_id = of_match_device(mt6397_rtc_of_match, &pdev->dev);
> > +	if (!of_id) {
> > +		dev_err(&pdev->dev, "Failed to probe of_node\n");
> > +		return -EINVAL;
> 
> This will never happen because probe would not be called if there is no
> match. You could also use of_device_get_match_data to avoid having to
> move the of_device_id table.
> 

Will use of_device_get_match_data() function instead of
of_match_device() function.




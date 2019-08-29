Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8777FA118E
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 08:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfH2GKG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 02:10:06 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:22584 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725883AbfH2GKG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 02:10:06 -0400
X-UUID: 1eaec999b78146a1bfcc86fc0004392d-20190829
X-UUID: 1eaec999b78146a1bfcc86fc0004392d-20190829
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1779642533; Thu, 29 Aug 2019 14:10:01 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 14:10:05 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 14:10:05 +0800
Message-ID: <1567058998.31616.2.camel@mtksdaap41>
Subject: Re: [PATCH v5 07/10] regulator: mt6358: Add support for MT6358
 regulator
From:   Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Date:   Thu, 29 Aug 2019 14:09:58 +0800
In-Reply-To: <20190828104555.GE4298@sirena.co.uk>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1566531931-9772-8-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20190828104555.GE4298@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 3D21F7D16BC2B25CFE3E426405FDF82F479EDCE9532B4837AF176595204156AC2000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Mark,

On Wed, 2019-08-28 at 11:45 +0100, Mark Brown wrote:
> On Fri, Aug 23, 2019 at 11:45:28AM +0800, Hsin-Hsiung Wang wrote:
> > The MT6358 is a regulator found on boards based on MediaTek MT8183 and
> > probably other SoCs. It is a so called pmic and connects as a slave to
> > SoC using SPI, wrapped inside the pmic-wrapper.
> 
> This looks good - since there was only one small issue with the example
> in the binding document I'll apply both patches, please send a followup
> fixing the binding document.

Thanks for your comment.
I will update the binding document in the next patch.


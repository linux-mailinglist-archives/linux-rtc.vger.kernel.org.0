Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2B182CBF
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Aug 2019 09:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732093AbfHFH3A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 6 Aug 2019 03:29:00 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51751 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731787AbfHFH3A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 6 Aug 2019 03:29:00 -0400
X-UUID: 133475bd8ce243548306e51b43c35492-20190806
X-UUID: 133475bd8ce243548306e51b43c35492-20190806
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1328225322; Tue, 06 Aug 2019 15:28:50 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 6 Aug 2019 15:28:47 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 6 Aug 2019 15:28:47 +0800
Message-ID: <1565076527.23984.5.camel@mtksdaap41>
Subject: Re: [PATCH v4 07/10] regulator: mt6358: Add support for MT6358
 regulator
From:   Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        "Allison Randal" <allison@lohutok.net>,
        <linux-rtc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Tue, 6 Aug 2019 15:28:47 +0800
In-Reply-To: <20190805131030.GE6432@sirena.org.uk>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1564982518-32163-8-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20190805131030.GE6432@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Mark,

On Mon, 2019-08-05 at 14:10 +0100, Mark Brown wrote:
> On Mon, Aug 05, 2019 at 01:21:55PM +0800, Hsin-Hsiung Wang wrote:
> 
> > +static const u32 vmch_voltages[] = {
> > +	2900000, 3000000, 3300000,
> > +};
> 
> > +static const u32 vemc_voltages[] = {
> > +	2900000, 3000000, 3300000,
> > +};
> 
> Several of these tables appear to be identical.
> 
I will use the same voltage table in the next patch.

> > +static inline unsigned int mt6358_map_mode(unsigned int mode)
> > +{
> > +	return mode == MT6358_BUCK_MODE_AUTO ?
> > +		REGULATOR_MODE_NORMAL : REGULATOR_MODE_FAST;
> > +}
> 
> There is no need for this to be an inline and please write normal
> conditional statements to improve legibility.  There's other examples in
> the driver.
> 
will fix it in the next patch.

> > +static int mt6358_get_buck_voltage_sel(struct regulator_dev *rdev)
> > +{
> > +	int ret, regval;
> > +	struct mt6358_regulator_info *info = rdev_get_drvdata(rdev);
> > +
> > +	ret = regmap_read(rdev->regmap, info->da_vsel_reg, &regval);
> > +	if (ret != 0) {
> > +		dev_info(&rdev->dev,
> > +			 "Failed to get mt6358 Buck %s vsel reg: %d\n",
> > +			 info->desc.name, ret);
> 
> dev_err() for errors here and throughout the driver.
> 
will fix it in the next patch.

> > +		return ret;
> > +	}
> > +
> > +	ret = (regval >> info->da_vsel_shift) & info->da_vsel_mask;
> > +
> > +	return ret;
> > +}
> 
> This looks like a standard get_voltage_sel_regmap()?
> 
MT6358 has buck voltage status registers to show the actual output
voltage and the registers are different from the voltage setting
registers.
We want to get the actual voltage output, so we use the da_vsel status
registers here.

> > +err_mode:
> > +	if (ret != 0)
> > +		return ret;
> > +
> > +	return 0;
> 
> Or just return ret unconditionally?
will modify it to return ret unconditionally in the next patch.

Thanks a lot.
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


